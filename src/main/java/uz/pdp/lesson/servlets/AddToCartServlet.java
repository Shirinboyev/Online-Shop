package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.CartService;
import uz.pdp.lesson.service.ProductService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private ProductService productService = ProductService.getInstance();
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:5432/", "postgres", "1111");
            cartService = new CartService(connection);
        } catch (SQLException e) {
            throw new ServletException("Unable to connect to the database", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = 1;

            try {
                Products product = productService.getProductById(productId);
                if (product != null) {
                    cartService.addProductToCart(user.getId(), product, quantity);
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write("Product added to cart successfully!");
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    response.getWriter().write("Product not found.");
                }
            } catch (SQLException e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("An error occurred while adding the product to the cart.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.getWriter().write("Please log in to add products to cart.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("addToCart.jsp").forward(req, resp);
    }
}
