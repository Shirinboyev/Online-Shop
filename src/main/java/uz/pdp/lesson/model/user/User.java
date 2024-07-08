package uz.pdp.lesson.model.user;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String phoneNumber;
    private String address;
    private String Role;

    public User(int id, String username,String email, String phoneNumber, String address,String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.password = password;
    }

    public User(int id, String username, String email, String userPassword) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = userPassword;
    }
}
