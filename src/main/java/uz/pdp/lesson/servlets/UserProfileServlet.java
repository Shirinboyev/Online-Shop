package uz.pdp.lesson.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {

    private ProductsRepository productsRepository;

    @Override
    public void init() throws ServletException {

        productsRepository = new ProductsRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser"); // Foydalanuvchi sessiyasidan ma'lumot olish
        if (user == null) {
            // Foydalanuvchi sessiyada mavjud bo'lmasa, uni ma'lumotlar bazasidan olish yoki login sahifasiga yo'naltirish
            // Masalan:
            // user = userService.getUserById(userId);
            response.sendRedirect("login.jsp");
            return;
        }
        request.setAttribute("user", user);

        List<Products> cartItems = (List<Products>) session.getAttribute("cartItems");
        request.setAttribute("cartItems", cartItems);

        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
