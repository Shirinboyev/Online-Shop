package uz.pdp.lesson.repository;


import uz.pdp.lesson.model.user.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements BaseRepository<User> {
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new IllegalStateException("Failed to load PostgreSQL JDBC driver.", e);
        }
    }

    @Override
    public void save(User user) {
        String query = "Insert into users (fullname, username, email,password,prePassword,age) values (?,?,?,?,?,?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getFullname());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getPrePassword());
            statement.setInt(6, user.getAge());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User get(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<User> getAll() {
    List<User> users = new ArrayList<>();
    String query = "Select * from users";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                User user = new User();
                user.setFullname(resultSet.getString("fullname"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setPrePassword(resultSet.getString("prePassword"));
                user.setAge(resultSet.getInt("age"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean update(User old, User updated) {
        return false;
    }
}
