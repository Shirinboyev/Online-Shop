package backend.repository;

import backend.model.orders.OrderDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderDetailsRepository implements BaseRepository<OrderDetails> {
    private static final String URL = "jdbc:postgresql://localhost:5432/shopping"; // Replace with your database URL
    private static final String USER = "postgres"; // Replace with your database username
    private static final String PASSWORD = "1111"; // Replace with your database password

    private static OrderDetailsRepository orderDetailsInstance;

    private OrderDetailsRepository() {
        // Private constructor to prevent instantiation
    }

    public static OrderDetailsRepository getInstance() {
        if (orderDetailsInstance == null) {
            orderDetailsInstance = new OrderDetailsRepository();
        }
        return orderDetailsInstance;
    }

    @Override
    public void save(OrderDetails orderDetails) {
        String query = "INSERT INTO order_details (price, cart_id, ordered_time, user_id) VALUES (?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setDouble(1, orderDetails.getPrice());
            statement.setInt(2, orderDetails.getCart_id());
            statement.setTimestamp(3, orderDetails.getOrdered_date());
            statement.setInt(4, orderDetails.getUserId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderDetails get(Integer id) {
        // Implementation to retrieve an order details by ID
        return null;
    }

    @Override
    public List<OrderDetails> getAll() {
        // Implementation to retrieve all order details
        return null;
    }
}
