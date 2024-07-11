package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.VendorService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Vendor", urlPatterns = "/vendorProfile")
public class VendorProfileServlet extends HttpServlet {

    VendorService vendorService = VendorService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<Market> markets = vendorService.getMarketsByUserId(user.getId());
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);  // Set user attribute for JSP
        }
        req.getRequestDispatcher("customerProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Market market = new Market();
        String marketName = req.getParameter("marketName");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {

            String result = vendorService.addMarket(marketName);
            List<Market> markets = vendorService.getMarketsByUserId(user.getId());
            req.setAttribute("result", result);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);

        } else {
            req.setAttribute("result", "User not logged in.");
        }
        req.getRequestDispatcher("vendorProfile.jsp").forward(req, resp);
    }
}
