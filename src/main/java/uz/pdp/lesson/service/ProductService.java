package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.BaseRepository;
import uz.pdp.lesson.repository.CartDao;
import uz.pdp.lesson.repository.ProductsRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class ProductService {
    private static ProductService productService;
    private final ProductsRepository productsRepository;
    private static final MarketService marketService = MarketService.getInstance();
    private List<Products> productList;
    private Connection connection;
    private List<CartItem> cartItems;
    private final CartDao cartDao = CartDao.getInstance();


    private ProductService() {
        this.productsRepository = new ProductsRepository();
        try {
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public void addProduct(String productCategory, int marketId, String productName, int productPrice, String productDescription, int productCount, String productImageUrl, String base64Img) {
        Products product = new Products();
        product.setName(productName);
        product.setPrice(productPrice);
        product.setDescription(productDescription);
        product.setMarketId(marketId);
        product.setCount(productCount);
        product.setImageUrl(productImageUrl);
        product.setCategory(productCategory);
        product.setImageBase64(base64Img);
        productsRepository.save(product);
    }

    public Products getProductById(int productId) {
        String sql = "SELECT * FROM product WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Products product = new Products();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getInt("price"));
                product.setDescription(resultSet.getString("description"));
                product.setCount(resultSet.getInt("count"));
                product.setCategory(resultSet.getString("category"));
                product.setImageUrl(resultSet.getString("image"));
                product.setMarketId(resultSet.getInt("market_id"));

                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Products> getAllProducts() {
        return productsRepository.getAllProducts();
    }

    public List<Products> getProductsByOwnerId(Integer ownerId) {
        List<Integer> marketsId = marketService.getMarketsIdByOwnerId(ownerId);
        List<Products> products = new ArrayList<>();
        for (Integer i : marketsId) {
            products.addAll(productsRepository.getProductsByMarketId(i));
        }
        return products;
    }

    public boolean deleteProductById(int id) {
        try (Connection connection = BaseRepository.getConnection()) {
            String query = "DELETE FROM product WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public void reduceAmountOfProductByProductId(List<CartItem> items) {
        String query = "UPDATE product SET count = count - 1 WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            for (CartItem item : items) {
                int productId = item.getProductId();
                ps.setInt(1, productId);
                ps.addBatch();
            }
            ps.executeBatch();  // Execute all updates as a batch
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Products> getArchivedProductsByUserId(int userId) throws SQLException {
        List<CartItem> cartItems = cartDao.getCartItemsByUserId(userId);
        List<Integer> archivedProductIds = cartItems.stream()
                .filter(CartItem::isPaid)
                .map(CartItem::getProductId)
                .collect(Collectors.toList());

        return productsRepository.getProductsByIds(archivedProductIds);
    }

}
