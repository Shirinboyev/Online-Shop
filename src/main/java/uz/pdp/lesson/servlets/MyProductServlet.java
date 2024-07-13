package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.IOException;
import java.util.List;

@MultipartConfig
@WebServlet(name = "Products", urlPatterns = "/myProducts")
public class MyProductServlet extends HomeServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductsRepository productRepo = new ProductsRepository();
        List<Products> products = productRepo.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/myProducts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
