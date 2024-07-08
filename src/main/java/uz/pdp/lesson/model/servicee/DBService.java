package uz.pdp.lesson.model.servicee;

import uz.pdp.lesson.model.result.Result;
import uz.pdp.lesson.model.user.User;

import java.sql.*;

public class DBService {
    String url = "jdbc:postgresql://localhost:5432/shopping_project";
    String userDb = "postgres";
    String parol = "1111";

    public Result signUp(User user) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url, userDb, parol);

            // Check if the phone number already exists
            String checkPhoneNumber = "SELECT COUNT(*) FROM users WHERE phone_number = ?";
            PreparedStatement ps = connection.prepareStatement(checkPhoneNumber);
            ps.setString(1, user.getPhoneNumber());
            ResultSet resultSet = ps.executeQuery();
            int countOfUsersField = 0;
            if (resultSet.next()) {
                countOfUsersField = resultSet.getInt(1);
            }
            if (countOfUsersField > 0) {
                return new Result("Phone number already exists", false);
            }

            // Check if the username already exists
            String checkUsername = "SELECT COUNT(*) FROM users WHERE username = ?";
            PreparedStatement psu = connection.prepareStatement(checkUsername);
            psu.setString(1, user.getUsername());
            ResultSet resultSetUsername = psu.executeQuery();
            if (resultSetUsername.next()) {
                countOfUsersField = resultSetUsername.getInt(1);
            }
            if (countOfUsersField > 0) {
                return new Result("Username already exists", false);
            }

            // Insert the user into the database
            String query = "INSERT INTO users (username, email, phone_number, password, address) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getAddress());

            int rowsAffected = preparedStatement.executeUpdate();
            connection.close();
            if (rowsAffected > 0) {
                return new Result("Successfully registered", true);
            } else {
                return new Result("Failed to register user", false);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return new Result("Database error: " + e.getMessage(), false);
        }
    }

    public User logIn(String username, String password) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url, userDb, parol);

            String query = "SELECT id, username, email, phone_number, address, password FROM users WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                username = resultSet.getString("username");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String userPassword = resultSet.getString("password");

                User user = new User(id, username, email, phoneNumber, address, userPassword);
                connection.close();
                return user;
            } else {
                connection.close();
                return null; // No user found
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
