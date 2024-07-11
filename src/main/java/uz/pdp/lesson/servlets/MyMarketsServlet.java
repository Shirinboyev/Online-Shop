
package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.ProductService;
import uz.pdp.lesson.service.UserService;
import uz.pdp.lesson.service.VendorService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyMarket", urlPatterns = "/myMarkets")
public class MyMarketsServlet extends HttpServlet {
    private final ProductService productService = ProductService.getInstance();
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
        req.getRequestDispatcher("/myMarkets.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer ownerId = userService.getUserId(user);
            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);

            int marketId = Integer.parseInt(req.getParameter("marketId"));
            String productName = req.getParameter("productName");
            double productPrice = Double.parseDouble(req.getParameter("productPrice"));
            String productDescription = req.getParameter("productDescription");
            int productCount = Integer.parseInt(req.getParameter("productCount"));
            String productImageUrl = req.getParameter("productImageUrl");

            ProductService productService = ProductService.getInstance();
            productService.addProduct(marketId, productName, productPrice, productDescription, productCount, productImageUrl);
        }

        req.getRequestDispatcher("/myMarkets.jsp").forward(req, resp);
    }
}
