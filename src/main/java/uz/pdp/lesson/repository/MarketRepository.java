package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.market.Market;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class MarketRepository implements BaseRepository<Market>{
    @Override
    public void save(Market market) {
        String query = "INSERT INTO market (name, owner_id) VALUES (?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, market.getName());
            statement.setInt(2, market.getOwnerId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Market get(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<Market> getAll() {
        return List.of();
    }

    @Override
    public boolean update(Market old, Market updated) {
        return false;
    }
}
