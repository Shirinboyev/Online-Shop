package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("home get");
        ProductsRepository productRepo = new ProductsRepository();
        List<Products> products = productRepo.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
