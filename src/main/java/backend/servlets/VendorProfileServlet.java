package backend.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import backend.model.market.Market;
import backend.model.user.User;
import backend.service.UserService;
import backend.service.VendorService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Vendor", urlPatterns = "/vendorProfile")

public class VendorProfileServlet extends HttpServlet {

    private final VendorService vendorService = VendorService.getInstance();
    private final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer ownerId = userService.getUserId(user);
            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);
        }
        req.getRequestDispatcher("vendorProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String marketName = req.getParameter("marketName");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer ownerId = userService.getUserId(user);
            boolean result = vendorService.addMarket(Market.builder().name(marketName).ownerId(ownerId).build());
            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("result", result ? "Market created successfully." : "Market creation failed.");
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);
        } else {
            req.setAttribute("result", "User not logged in.");
        }
        req.getRequestDispatcher("vendorProfile.jsp").forward(req, resp);
    }
}
