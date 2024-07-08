package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lombok.Data;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "Login",urlPatterns = "/login")
public class LogInServlet extends HttpServlet {
    UserService userService = UserService.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String email = req.getParameter("email");
    String password = req.getParameter("password");
    String prePassword = req.getParameter("prePassword");

    HttpSession session = req.getSession();
        User user = userService.login(email, password,prePassword);

        PrintWriter writer = resp.getWriter();

    String id = session.getId();
        Cookie cookie = new Cookie("JSESSIONID",id);
        cookie.setMaxAge(60*60*24*7);
        resp.addCookie(cookie);

        if(password.equals(prePassword)){
            if(user!=null){
                if(user.getRole().equals("ADMIN")){
                    session.setAttribute("user",user.getId());
                    resp.sendRedirect("/adminProfile.jsp");
                }
                else if(user.getRole().equals("CONSUMER")){
                    session.setAttribute("user",user.getId());
                    resp.sendRedirect("/");
                }
                else if(user.getRole().equals("CUSTOMER")){
                    session.setAttribute("user",user.getId());
                    resp.sendRedirect("/customer.jsp");
                }
            }
        }

    }

}
