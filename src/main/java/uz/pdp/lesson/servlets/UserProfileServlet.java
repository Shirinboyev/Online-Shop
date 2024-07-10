package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.CartItemRepository;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {
    private CartItemRepository cartRepo;
    private ProductsRepository productsRepository;

    @Override
    public void init() throws ServletException {
        cartRepo = new CartItemRepository();
        productsRepository = new ProductsRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<CartItem> cartItems = cartRepo.getCartItemsByUserId(user.getId());
        List<Products> productsInCart = new ArrayList<>();
        for (CartItem cartItem : cartItems) {
            Products product = productsRepository.getProductById(cartItem.getProductId());
            if (product != null) {
                productsInCart.add(product);
            }
        }

        request.setAttribute("cartItems", productsInCart);
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
