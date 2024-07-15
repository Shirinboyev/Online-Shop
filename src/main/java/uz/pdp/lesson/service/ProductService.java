package uz.pdp.lesson.service;

import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.ProductsRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private Connection connection;

    public ProductService(Connection connection, ProductsRepository productsRepository) {
        this.connection = connection;
        this.productsRepository = productsRepository;
    }
    private static ProductService productService;
    private final ProductsRepository productsRepository;
    private static final MarketService marketService = MarketService.getInstance();

    private ProductService() {
        this.productsRepository = new ProductsRepository();
    }

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public void addProduct(String productCategory, int marketId, String productName, double productPrice, String productDescription, int productCount, String productImageUrl, String base64Img) {
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
                product.setPrice(resultSet.getDouble("price"));
                product.setDescription(resultSet.getString("description"));
                product.setCount(resultSet.getInt("count"));
                product.setCategory(resultSet.getString("category"));
                product.setImageUrl(resultSet.getString("image_url"));
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
}