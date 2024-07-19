package backend.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private int id;
    private String fullname;
    private String username;
    private String email;
    private String password;
    private String prePassword;
    private int age;
    private String Role;

}
