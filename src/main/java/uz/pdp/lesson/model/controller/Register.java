package uz.pdp.lesson.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.model.result.Result;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.model.servicee.DBService;

@WebServlet(name = "registerServlet", value = "/register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneNumber = req.getParameter("phoneNumber");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String prePassword = req.getParameter("prePassword");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        PrintWriter printWriter = resp.getWriter();

        if (password.equals(prePassword)) {
            DBService dbService = new DBService();
            User user = new User();

            user.setPhoneNumber(phoneNumber);
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setAddress(address);

            Result result = dbService.signUp(user);

            if (result.isSuccess()) {
                printWriter.write("<h1>Registration successful</h1>");
            } else {
                printWriter.write("<h1>" + result.getMessage() + "</h1>");
            }
        } else {
            printWriter.write("<h1>Passwords do not match</h1>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }
}
