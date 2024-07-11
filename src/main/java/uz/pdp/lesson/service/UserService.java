package uz.pdp.lesson.service;

import uz.pdp.lesson.enums.UserRole;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class UserService implements BaseService {
    private static UserService instance;
    private UserRepository userRepository = new UserRepository();


    public User login(String email, String password, String prePassword) {
        List<User> users = userRepository.getAll();
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password) && password.equals(prePassword)) {
                return user;
            }
        }
        return null;
    }

    public String signup(String fullname, String username, String email, String password, String prePassword, int age, UserRole userRole) {
        List<User> users = userRepository.getAll();
        if (password.equals(prePassword)) {
            for (User user : users) {
                if (user.getEmail().equals(email) || user.getUsername().equals(username)) {
                    return "User already exists";
                }
            }
            User user = new User();
            user.setFullname(fullname);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setAge(age);
            user.setRole(String.valueOf(userRole));

            userRepository.save(user);
            return "User added";
        } else {
            return "Passwords do not match";
        }
    }

    public static UserService getInstance() {
        if (instance == null) {
            synchronized (UserService.class) {
                if (instance == null) {
                    instance = new UserService();
                }
            }
        }
        return instance;
    }

    public List<User> getAllUsers() {
        return getUsersByRole(UserRole.CUSTOMER);
    }

    public List<User> getAllVendors() {
        return getUsersByRole(UserRole.VENDOR);
    }

    private List<User> getUsersByRole(UserRole userRole) {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, userRole.name());
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setFullname(resultSet.getString("fullname"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setAge(resultSet.getInt("age"));
                    user.setRole(resultSet.getString("role"));
                    users.add(user);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }


    public Integer getUserId(User user) {
        List<User> users = userRepository.getAll();
        for (User user1 : users) {
            if (user1.getEmail().equals(user.getEmail()) && user1.getPassword().equals(user.getPassword())) {
                return user1.getId();
            }
        }
        return null;
    }
}
