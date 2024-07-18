package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class CartDao {
    private static CartDao instance;

    private CartDao() {}

    public static synchronized CartDao getInstance() {
        if (instance == null) {
            instance = new CartDao();
        }
        return instance;
    }

    public Cart getCartByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            Cart cart = null;
            if (resultSet.next()) {
                cart = new Cart();
                cart.setId(resultSet.getInt("id"));
                cart.setUserId(resultSet.getInt("user_id"));
                cart.setCreateDate(resultSet.getTimestamp("create_date"));
                cart.setItems(getCartItems(cart.getId()));
            }
            return cart;
        }
    }

    public void addProductToCart(int cartId, int productId, int quantity) throws SQLException {
        String sql = "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cartId);
            statement.setInt(2, productId);
            statement.setInt(3, quantity);
            statement.executeUpdate();
        }
    }

    public List<CartItem> getCartItems(int cartId) throws SQLException {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cartId);
            ResultSet resultSet = statement.executeQuery();

            List<CartItem> items = new ArrayList<>();
            while (resultSet.next()) {
                CartItem item = new CartItem();
                item.setId(resultSet.getInt("id"));
                item.setCartId(resultSet.getInt("cart_id"));
                item.setProductId(resultSet.getInt("product_id"));
                item.setQuantity(resultSet.getInt("quantity"));
                item.setPaid(resultSet.getBoolean("is_paid"));
                items.add(item);
            }
            return items;
        }
    }

    public void createCartForUser(int userId) throws SQLException {
        String sql = "INSERT INTO cart (user_id, create_date) VALUES (?, NOW())";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }

    public void deleteItemsByCartId(int cartId) throws SQLException {
        String sql = "DELETE FROM cart_items WHERE cart_id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cartId);
            statement.executeUpdate();
        }
    }

    public void updateCartItemsPaidStatus(int userId, boolean isPaid) throws SQLException {
        String sql = "UPDATE cart_items SET is_paid = ? WHERE cart_id IN (SELECT id FROM cart WHERE user_id = ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setBoolean(1, isPaid);
            statement.setInt(2, userId);
            statement.executeUpdate();
        }
    }
    public List<CartItem> getCartItemsByUserId(int userId) throws SQLException {
        String sql = "SELECT ci.* FROM cart_items ci JOIN cart c ON ci.cart_id = c.id WHERE c.user_id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            List<CartItem> items = new ArrayList<>();
            while (resultSet.next()) {
                CartItem item = new CartItem();
                item.setId(resultSet.getInt("id"));
                item.setCartId(resultSet.getInt("cart_id"));
                item.setProductId(resultSet.getInt("product_id"));
                item.setQuantity(resultSet.getInt("quantity"));
                item.setPaid(resultSet.getBoolean("is_paid"));
                items.add(item);
            }
            return items;
        }
    }

}
