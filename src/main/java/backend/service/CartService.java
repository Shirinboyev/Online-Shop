package backend.service;

import backend.model.cart.CartItem;
import backend.model.products.Products;
import backend.repository.BaseRepository;
import backend.model.cart.Cart;
import backend.repository.CartDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    private CartDao cartDao;
    private Connection connection;
    private static CartService cartService;

    private CartService() {
        try {
            this.connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.cartDao = CartDao.getInstance();
    }

    public static CartService getInstance() {
        if (cartService == null) {
            cartService = new CartService();
        }
        return cartService;
    }

    public Cart getCartByUserId(int userId) throws SQLException {
        return cartDao.getCartByUserId(userId);
    }

    public void addProductToCart(int userId, Products product, int quantity) throws SQLException {
        Cart cart = getCartByUserId(userId);
        if (cart == null) {
            createCartForUser(userId);
            cart = getCartByUserId(userId);
        }
        cartDao.addProductToCart(cart.getId(), product.getId(), quantity);
    }

    public void deleteItemsByCartId(int cartId) throws SQLException {
        cartDao.deleteItemsByCartId(cartId);
    }

    public void markItemsAsPaid(int userId) throws SQLException {
        cartDao.updateCartItemsPaidStatus(userId, true);
    }

    private void createCartForUser(int userId) throws SQLException {
        cartDao.createCartForUser(userId);
    }
    public List<CartItem> getCartItems(int cartId) throws SQLException {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, cartId);
        ResultSet resultSet = statement.executeQuery();

        List<CartItem> items = new ArrayList<>();
        while (resultSet.next()) {
            CartItem item = new CartItem();
            item.setId(resultSet.getInt("id"));
            item.setProductId(resultSet.getInt("product_id"));
            item.setCartId(resultSet.getInt("cart_id"));
            item.setQuantity(resultSet.getInt("quantity"));
            item.setPaid(resultSet.getBoolean("is_paid"));
            items.add(item);
        }

        return items;
    }
}
