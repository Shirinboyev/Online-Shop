package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lombok.Data;
import uz.pdp.lesson.enums.UserRole;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

@WebServlet(name = "Login", urlPatterns = "/login")
public class LogInServlet extends HttpServlet {
    UserService userService = UserService.getInstance();
    private static final Logger logger = Logger.getLogger(LogInServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String prePassword = req.getParameter("prePassword");

        logger.info("Email: " + email);
        logger.info("Password: " + password);
        logger.info("PrePassword: " + prePassword);

        User user = userService.login(email, password, prePassword);

        if (user != null) {
            logger.info("User found: " + user.getFullname());
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            cookie.setMaxAge(60 * 60 * 24 * 7);
            resp.addCookie(cookie);

            switch (UserRole.valueOf(user.getRole())) {
                case ADMIN:
                    resp.sendRedirect("/adminProfile.jsp");
                    break;
                case CUSTOMER:
                    resp.sendRedirect("/userProfile.jsp");
                    break;
                case VENDOR:
                    resp.sendRedirect("/vendorProfile.jsp");
                    break;
                default:
                    resp.sendRedirect("/");
                    break;
            }
        } else {
            logger.warning("Invalid email or password.");
            resp.getWriter().println("Invalid email or password.");
            resp.setHeader("Refresh", "2; URL=/login.jsp");
        }
    }
}
