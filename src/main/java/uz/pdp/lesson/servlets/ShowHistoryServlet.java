package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.orders.OrderDetails;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.CartDao;
import uz.pdp.lesson.service.OrderDetailsService;
import uz.pdp.lesson.service.ProductService;
import uz.pdp.lesson.service.UserService;

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

