package backend.repository;

import backend.model.vertification.Vertification;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class VerificationRepository implements BaseRepository<Vertification> {
    @Override
    public void save(Vertification vertification) {
        String query = "INSERT INTO verification (sent_code, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, vertification.getSend_code());
            statement.setInt(2, vertification.getUser_id());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Vertification get(Integer id) {
        return null;
    }

    @Override
    public List<Vertification> getAll() {
        return List.of();
    }
}
