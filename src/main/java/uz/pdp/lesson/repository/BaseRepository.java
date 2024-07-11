package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.user.User;

import java.util.List;

public interface BaseRepository<M> {
     String URL = "jdbc:postgresql://localhost:5432/shopping";
     String USER = "postgres";
     String PASSWORD = "1111";

    void save(M m);
    M get(Integer id);
    List<M> getAll();
}
