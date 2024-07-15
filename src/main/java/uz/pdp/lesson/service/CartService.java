package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartService {
    private Connection connection;

    public CartService(Connection connection) {
        this.connection = connection;
    }

    public Cart getCartByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
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

    public List<CartItem> getCartItems(int cartId) throws SQLException {
        String sql = "SELECT * FROM cart_items WHERE cart_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, cartId);
        ResultSet resultSet = statement.executeQuery();

        List<CartItem> items = new ArrayList<>();
        while (resultSet.next()) {
            CartItem item = new CartItem();
            item.setId(resultSet.getInt("id"));
            item.setCartId(resultSet.getInt("cart_id"));
            item.setProductId(resultSet.getInt("product_id"));
            item.setQuantity(resultSet.getInt("quantity"));
            items.add(item);
        }

        return items;
    }

    public void addProductToCart(int userId, Products product, int quantity) throws SQLException {
        Cart cart = getCartByUserId(userId);
        if (cart == null) {
            createCartForUser(userId);
            cart = getCartByUserId(userId);
        }

        String sql = "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE quantity = quantity + ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, cart.getId());
        statement.setInt(2, product.getId());
        statement.setInt(3, quantity);
        statement.setInt(4, quantity);
        statement.executeUpdate();
    }

    private void createCartForUser(int userId) throws SQLException {
        String sql = "INSERT INTO cart (user_id, create_date) VALUES (?, NOW())";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.executeUpdate();
    }
}
