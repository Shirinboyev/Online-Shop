package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.market.Market;

import java.sql.*;


public class CustomerRepository {
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new IllegalStateException("Failed to load PostgreSQL JDBC driver.", e);
        }
    }

    public void saveMarket(Market market) {
        String query = "INSERT INTO market (name, owner_id) VALUES (?, ?)";
        try (Connection connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, market.getName());
            statement.setInt(2, market.getOwnerId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
