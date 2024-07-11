package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.CustomerService;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProfile", urlPatterns = "/adminProfile")
public class AdminProfileServlet extends HttpServlet {
    private UserService userService = UserService.getInstance();
    private CustomerService customerService = CustomerService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("showUsers".equals(action)) {
            List<User> users = userService.getAllUsers();
            req.setAttribute("users", users);
        } else if ("showCustomers".equals(action)) {
            List<User> customers = userService.getAllCustomers();
            req.setAttribute("customers", customers);
        } else if ("showCustomersMarkets".equals(action)) {
            List<Market> markets = customerService.getAllMarkets();
            req.setAttribute("markets", markets);
        }

        req.getRequestDispatcher("adminProfile.jsp").forward(req, resp);
    }
}
