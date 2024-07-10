package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.orders.Orders;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrdersRepository implements BaseRepository<Orders>{
    @Override
    public void save(Orders order) {
        String query = "INSERT INTO orders (count, product_id, basket_id)) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, order.getCount());
            statement.setInt(2, order.getProductId());
            statement.setInt(3, order.getBasketId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Orders get(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<Orders> getAll() {
        return List.of();
    }

    @Override
    public boolean update(Orders old, Orders updated) {
        return false;
    }
}
