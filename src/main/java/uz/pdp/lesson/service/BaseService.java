package uz.pdp.lesson.service;

import uz.pdp.lesson.model.user.User;

public interface BaseService {
     User login(String email, String password ,String prePassword );
     String signup(String fullname, String username, String email, String password,String prePassword, int age);
}
