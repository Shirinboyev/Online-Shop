package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.CustomerService;
import uz.pdp.lesson.model.market.Market;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "Customer", urlPatterns = "/customerProfile")
public class CustomerProfileServlet extends HttpServlet {
    private CustomerService customerService = CustomerService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");  // Retrieve user object from session

        if (user != null) {
            List<Market> markets = customerService.getMarketsByUserId(user.getId());
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);  // Set user attribute for JSP
        }
        req.getRequestDispatcher("customerProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String marketName = req.getParameter("marketName");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String result = customerService.createMarket(marketName, user.getId());
            List<Market> markets = customerService.getMarketsByUserId(user.getId());
            req.setAttribute("result", result);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);  // Set user attribute for JSP
        } else {
            req.setAttribute("result", "User not logged in.");
        }
        req.getRequestDispatcher("customerProfile.jsp").forward(req, resp);
    }
}
