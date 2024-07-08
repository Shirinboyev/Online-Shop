package uz.pdp.lesson.service;


import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.UserRepository;


import java.util.List;

public class UserService implements BaseService {
    private static UserService instance;
    private UserRepository userRepository = new UserRepository();

@Override
public User login(String email, String password ,String prePassword ) {
    List<User> users = userRepository.getAll();
    if(password.equals(prePassword)) {
        for (User user : users) {
            if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
    }
    return null;
  }

    @Override
    public String signup(String fullname, String username, String email, String password, String prePassword, int age) {
        List<User> users = userRepository.getAll();
        if(password.equals(prePassword)) {
            for (User user : users) {
                if(user.getUsername().equals(username) && user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    return"User already exists";
                }
            }
            User user = new User();
            user.setFullname(fullname);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setPrePassword(prePassword);
            user.setAge(age);
            userRepository.save(user);
            return "User added";
        }else {
            return "Wrong password";
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
