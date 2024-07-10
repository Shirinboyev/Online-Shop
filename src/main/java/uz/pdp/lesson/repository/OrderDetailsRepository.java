package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.orders.OrderDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderDetailsRepository implements BaseRepository<OrderDetails>{
    @Override
    public void save(OrderDetails orderDetails) {
        String query = "INSERT INTO users (price, basket_id) VALUES (?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setDouble(1, orderDetails.getPrice());
            statement.setInt(2, orderDetails.getBasket_id());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderDetails get(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<OrderDetails> getAll() {
        return List.of();
    }

    @Override
    public boolean update(OrderDetails old, OrderDetails updated) {
        return false;
    }
}
