package uz.pdp.lesson.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import uz.pdp.lesson.model.cart.Cart;
import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.ProductsRepository;
import uz.pdp.lesson.service.CartService;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@MultipartConfig
@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {

    private ProductsRepository productsRepository;
    private CartService cartService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        productsRepository = new ProductsRepository();
        cartService = CartService.getInstance();
        userService = UserService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("user", user);
        Cart cartByUserId =null;
        Integer userId = userService.getUserId(user);
        try {
            cartByUserId = cartService.getCartByUserId(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<CartItem> items = cartByUserId.getItems();
        request.setAttribute("cartByUserId", cartByUserId);
        request.setAttribute("items", items);

        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
