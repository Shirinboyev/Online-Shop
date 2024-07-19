package backend.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import backend.model.products.Products;
import backend.model.user.User;
import backend.service.ProductService;
import backend.service.UserService;

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
        User user = (User) session.getAttribute("user");
        if (Objects.nonNull(user)) {
            List<Products> products = productService.getProductsByOwnerId(user.getId());
            request.setAttribute("products", products);
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