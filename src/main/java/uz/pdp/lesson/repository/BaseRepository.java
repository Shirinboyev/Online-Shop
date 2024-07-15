package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.user.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public interface BaseRepository<M> {
     String URL = "jdbc:postgresql://localhost:5432/shopping";
     String USER = "postgres";
     String PASSWORD = "1111";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect to the database", e);
        }
    }

    void save(M m);
    M get(Integer id);
    List<M> getAll();
}
