package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.service.CustomerService;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;

@WebServlet(name = "Customer", urlPatterns = "/customerProfile")
public class CustomerProfileServlet extends HttpServlet {
    private CustomerService customerService = CustomerService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("customerProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String marketName = req.getParameter("marketName");
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("user");

        String result = customerService.createMarket(marketName, userId);
        req.setAttribute("result", result);
        req.getRequestDispatcher("customerProfile.jsp").forward(req, resp);
    }
}
