package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Archive", urlPatterns = "/archives")
public class ShowHistoryServlet extends HomeServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

    ProductService productService = ProductService.getInstance();
        List<Products> archivedProducts = null;
        try {
            archivedProducts = productService.getArchivedProductsByUserId(user.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("archivedProducts", archivedProducts);
    request.getRequestDispatcher("archive.jsp").forward(request, response);
        }

}
