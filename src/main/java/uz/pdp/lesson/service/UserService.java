package uz.pdp.lesson.service;

import uz.pdp.lesson.enums.UserRole;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.UserRepository;

import java.util.List;

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
}
