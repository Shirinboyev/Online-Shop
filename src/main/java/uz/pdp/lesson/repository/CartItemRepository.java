package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.cart.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartItemRepository {
    private final String URL = "jdbc:mysql://localhost:3306/your_database";
    private final String USER = "root";
    private final String PASSWORD = "password";

    public void addCartItem(CartItem cartItem) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO cart_items (user_id, product_id) VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cartItem.getUserId());
            statement.setInt(2, cartItem.getProductId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void save(CartItem cartItem) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cartItem.getUserId());
            statement.setInt(2, cartItem.getProductId());
            statement.setInt(3, cartItem.getQuantity());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CartItem> getCartItemsByUserId(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM cart_items WHERE user_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                CartItem cartItem = new CartItem(
                        resultSet.getInt("id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("product_id"));
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }
}
