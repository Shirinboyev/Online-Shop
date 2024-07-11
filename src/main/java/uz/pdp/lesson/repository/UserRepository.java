package uz.pdp.lesson.repository;

import org.postgresql.Driver;
import uz.pdp.lesson.model.user.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements BaseRepository<User> {
    private static void forDriver() {
        try {
            Class.forName("org.postgresql.Driver"); // Register the driver
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found. Include it in your library path.", e);
        }

    }
    @Override
    public void save(User user) {
        forDriver();
        String query = "INSERT INTO users (fullname, username, password, email, age, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getFullname());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getEmail());
            statement.setInt(5, user.getAge());
            statement.setString(6, user.getRole());

            statement.execute();
            System.out.println("User inserted successfully.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User get(Integer id) {
        forDriver();
        return null;
    }

    @Override
    public List<User> getAll() {
        forDriver();
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFullname(resultSet.getString("fullname"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setAge(resultSet.getInt("age"));
                user.setRole(resultSet.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

}
