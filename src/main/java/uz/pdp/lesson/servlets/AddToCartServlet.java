package uz.pdp.lesson.servlets;

import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.service.CartService;
import uz.pdp.lesson.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private CartService cartService;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shopping", "postgres", "1111");
            cartService = CartService.getInstance();
            productService = ProductService.getInstance();
        } catch (SQLException e) {
            throw new ServletException("Unable to establish database connection", e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userIdStr = req.getParameter("userId");
        String productIdStr = req.getParameter("productId");

        if (userIdStr == null || productIdStr == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Required parameters are missing.");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            int productId = Integer.parseInt(productIdStr);

            Products product = productService.getProductById(productId);

            if (product != null) {
                try {
                    cartService.addProductToCart(userId, product, 1);
                    resp.setStatus(HttpServletResponse.SC_OK);
                    resp.sendRedirect("home.jsp");
                } catch (SQLException e) {
                    throw new ServletException("Error adding product to cart", e);
                }
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric parameters.");
        }
    }

}
