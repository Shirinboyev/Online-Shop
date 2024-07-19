package backend.servlets;

import backend.model.orders.OrderDetails;
import backend.model.user.User;
import backend.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import backend.service.OrderDetailsService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Archive", urlPatterns = "/archives")

public class ShowHistoryServlet extends HomeServlet {
    UserService userService = UserService.getInstance();
    OrderDetailsService orderDetailsService = OrderDetailsService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        List<OrderDetails> archives = null;
        try {
             archives = orderDetailsService.getArchives(userService.getUserId(user));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("userId", userService.getUserId(user));
        request.setAttribute("archives", archives);
    request.getRequestDispatcher("archive.jsp").forward(request, response);
        }
}

