package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lombok.Data;
import uz.pdp.lesson.enums.BasketStatus;
import uz.pdp.lesson.enums.Categories;
import uz.pdp.lesson.enums.UserRole;
import uz.pdp.lesson.model.basket.Basket;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
@WebServlet(name = "Login", urlPatterns = "/login")
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

        User user = userService.login(email, password, prePassword);

        HttpSession session = req.getSession();
        if (user != null) {
            session.setAttribute("user", user);  // User object set to session
            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            cookie.setMaxAge(60 * 60 * 24 * 7);
            resp.addCookie(cookie);

            switch (UserRole.valueOf(user.getRole())) {
                case ADMIN:
                    resp.sendRedirect("/adminProfile.jsp");
                    break;
                case USER:
                    resp.sendRedirect("/userProfile.jsp");
                    break;
                case CUSTOMER:
                    resp.sendRedirect("/customerProfile.jsp");
                    break;
                default:
                    resp.sendRedirect("/");
                    break;
            }
        } else {
            resp.getWriter().println("Invalid email or password.");
            resp.setHeader("Refresh", "2; URL=/login.jsp");
        }
    }
}


