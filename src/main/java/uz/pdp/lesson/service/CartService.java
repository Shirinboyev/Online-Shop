package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;

import java.security.PublicKey;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class CartService {
    private Connection connection;
    public static CartService cartService;

    private CartService() {
        try {
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static CartService getInstance() {
        if (cartService == null) {
            cartService = new CartService();
        }
        return cartService;
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

    public void addProductToCart(int userId, Products product, int quantity) throws SQLException {
        Cart cart = getCartByUserId(userId);
        if (cart == null) {
            createCartForUser(userId);
            cart = getCartByUserId(userId);
        }

        String sql = "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?) ";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cart.getId());
            statement.setInt(2, product.getId());
            statement.setInt(3, quantity);
            statement.executeUpdate();
        }
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

    private void createCartForUser(int userId) throws SQLException {
        String sql = "INSERT INTO cart (user_id, create_date) VALUES (?, NOW())";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.executeUpdate();
    }
}
