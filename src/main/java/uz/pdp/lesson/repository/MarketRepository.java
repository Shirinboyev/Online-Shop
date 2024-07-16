package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.market.Market;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MarketRepository implements BaseRepository<Market>{
    @Override
    public void save(Market market) {
        forDriver();
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
    private void forDriver() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found. Include it in your library path.", e);
        }

    }
    @Override
    public Market get(Integer id) {
        return null;
    }

    @Override
    public List<Market> getAll() {
        List<Market> markets = new ArrayList<>();
        String query = "SELECT * FROM market";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

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

    public List<Market> getMarketsByOwnerId(int ownerId) {
        List<Market> markets = new ArrayList<>();
        String query = "SELECT * FROM market WHERE owner_id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, ownerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Market market = new Market();
                    market.setId(resultSet.getInt("id"));
                    market.setName(resultSet.getString("name"));
                    market.setOwnerId(resultSet.getInt("owner_id"));
                    markets.add(market);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return markets;
    }
    public Market getMarketById(int marketId) {
        Market market = null;
        String query = "SELECT * FROM market WHERE id = ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, marketId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                market = new Market();
                market.setId(resultSet.getInt("id"));
                market.setName(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return market;
    }
    public static boolean deleteMarket(int marketId) {
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement ps = connection.prepareStatement("DELETE FROM markets WHERE id = ?")) {
            ps.setInt(1, marketId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
