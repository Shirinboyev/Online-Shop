package backend.service;

import backend.model.cart.CartItem;
import backend.model.orders.OrderDetails;
import backend.repository.BaseRepository;
import backend.repository.OrderDetailsRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailsService {
    private static OrderDetailsService orderDetailsService;
    private static final ProductService productService = ProductService.getInstance();
    private static final OrderDetailsRepository orderDetailsRepository = OrderDetailsRepository.getInstance();
    private static final CartService cartService = CartService.getInstance();

    private OrderDetailsService() {
        // Private constructor to prevent instantiation
    }

    public static OrderDetailsService getInstance() {
        if (orderDetailsService == null) {
            orderDetailsService = new OrderDetailsService();
        }
        return orderDetailsService;
    }

    public void save(OrderDetails orderDetails, List<CartItem> items) throws SQLException {
        orderDetailsRepository.save(orderDetails);
        cartService.deleteItemsByCartId(orderDetails.getCart_id());
        productService.reduceAmountOfProductByProductId(items);
    }
    public List<OrderDetails> getArchives(int userId) throws SQLException {
        String sql = "SELECT * FROM order_details WHERE user_id = ?";
        try (Connection connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            List<OrderDetails> orderDetailsList = new ArrayList<>();
            while (resultSet.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setId(resultSet.getInt("id"));
                orderDetails.setPrice(resultSet.getDouble("price"));
                orderDetails.setCart_id(resultSet.getInt("cart_id"));
                orderDetails.setOrdered_date(resultSet.getTimestamp("ordered_time"));
                orderDetailsList.add(orderDetails);
            }
            return orderDetailsList;
        }
    }
}
