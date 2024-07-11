package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.basket.Basket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class BasketRepository implements BaseRepository<Basket>{
    @Override
    public void save(Basket basket) {
        String query = "INSERT INTO Basket (order_date,status, consumer_id) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setTimestamp(1,basket.getOrderDate());
            statement.setString(2, String.valueOf(basket.getStatus()));
            statement.setInt(3, basket.getConsumerId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Basket get(Integer id) {
        return null;
    }

    @Override
    public List<Basket> getAll() {
        return List.of();
    }
}
