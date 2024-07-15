package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.ProductsRepository;
import uz.pdp.lesson.service.ProductService;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "Products", urlPatterns = "/myProducts")
public class MyProductServlet extends HomeServlet {
    private static final ProductService productService = ProductService.getInstance();
    private static final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        if (Objects.nonNull(user)) {
            List<Products> products = productService.getProductsByOwnerId(userService.getUserId(user));
            request.setAttribute("products", products);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/myProducts.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
