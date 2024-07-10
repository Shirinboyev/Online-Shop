package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.user.User;

import java.util.List;

public interface BaseRepository<M> {
     String URL = "jdbc:postgresql://localhost:5432/shopping";
     String USER = "postgres";
     String PASSWORD = "123";


    void save(M m);
    M get(Integer id);
    boolean delete(Integer id);
    List<M> getAll();
    boolean update(M old, M updated);
}
