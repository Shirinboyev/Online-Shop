package uz.pdp.lesson.model.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.model.servicee.DBService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginPage",value= "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        DBService dbService = new DBService();
        User user = dbService.logIn(username, password);
        PrintWriter printWriter = resp.getWriter();
        if (user==null){
            printWriter.write("<h1>User not found </h1>");
        }
        else{
            printWriter.write("" +
                    "<h1> Welcome you profile </h1>" +
                    "<br>" +
                    "<h1>" + "Username: " +user.getUsername()+ "</h1>" +
                    "<h1>" + "Phonenumber: " +user.getPhoneNumber()+ "</h1>"
);
        }
    }
}
