package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.orders.OrderDetails;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.CartService;
import uz.pdp.lesson.service.OrderDetailsService;
import uz.pdp.lesson.service.ProductService;
import uz.pdp.lesson.service.UserService;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "processPayment", value = "/processPayment")
public class ProcessPayment extends HttpServlet {
    UserService userService = UserService.getInstance();
    CartService cartService = CartService.getInstance();
    ProductService productService = ProductService.getInstance();
    OrderDetailsService orderDetailsService = OrderDetailsService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                Integer userId = userService.getUserId(user);
                String cardNumber = req.getParameter("cardNumber");
                Cart cart = cartService.getCartByUserId(userId);

                if (cart != null) {
                    List<CartItem> items = cartService.getCartItems(cart.getId());
                    double sum = 0;

                    for (CartItem item : items) {
                        Products product = productService.getProductById(item.getProductId());
                        sum += item.getQuantity() * product.getPrice();
                    }

                    OrderDetails orderDetails = OrderDetails.builder()
                            .cart_id(cart.getId())
                            .price(sum)
                            .ordered_date(Timestamp.valueOf(LocalDateTime.now()))
                            .build();

                    orderDetailsService.save(orderDetails, items);

                    req.setAttribute("orderDetails", orderDetails);
                    req.setAttribute("user", user);

                    // Forward to processPayment.jsp
                    req.getRequestDispatcher("/processPayment.jsp").forward(req, resp);

                } else {
                    // Handle case where cart is null
                    throw new ServletException("Cart not found for user");
                }

            } catch (SQLException e) {
                throw new ServletException("Error processing payment", e);
            }
        } else {
            // Handle case where user is null
            resp.sendRedirect("/login.jsp"); // Redirect to login page or appropriate error page
        }
    }

}
