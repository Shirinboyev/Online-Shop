package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.market.Market;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


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
    public List<Market> getAllMarkets() {
        List<Market> markets = new ArrayList<>();
        String query = "SELECT * FROM market";
        try (Connection connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int ownerId = resultSet.getInt("owner_id");
                Market market = new Market(id, name, ownerId);
                markets.add(market);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return markets;
    }

    public List<Market> getMarketsByUserId(int userId) {
        List<Market> markets = new ArrayList<>();
        String query = "SELECT * FROM market WHERE owner_id = ?";
        try (Connection connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int ownerId = resultSet.getInt("owner_id");
                    Market market = new Market(id, name, ownerId);
                    markets.add(market);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return markets;
    }
    public List<Market> findMarketsByOwnerId(int ownerId) {
        List<Market> markets = new ArrayList<>();
        String query = "SELECT * FROM market WHERE owner_id = ?";
        try (Connection connection = DriverManager.getConnection(BaseRepository.URL, BaseRepository.USER, BaseRepository.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, ownerId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Market market = new Market();
                market.setId(resultSet.getInt("id"));
                market.setName(resultSet.getString("name"));
                market.setOwnerId(resultSet.getInt("owner_id"));
                markets.add(market);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return markets;
    }
}
