package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.CartDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class CartService {
    private CartDao cartDao;
    private Connection connection;
    private static CartService cartService;

    private CartService() {
        try {
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
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
