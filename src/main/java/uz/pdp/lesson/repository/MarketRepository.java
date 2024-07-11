package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.market.Market;

import java.sql.*;
import java.util.ArrayList;
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

}
