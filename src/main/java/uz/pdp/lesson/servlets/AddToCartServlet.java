package uz.pdp.lesson.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.CartItemRepository;
import uz.pdp.lesson.service.CartService;

import java.io.IOException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private CartItemRepository cartRepo;

    @Override
    public void init() throws ServletException {
        cartRepo = new CartItemRepository();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));

        CartItem cartItem = new CartItem();
        cartItem.setUserId(user.getId());
        cartItem.setProductId(productId);
        cartItem.setQuantity(1);

        cartRepo.save(cartItem);

        response.setStatus(HttpServletResponse.SC_OK);
    }
}