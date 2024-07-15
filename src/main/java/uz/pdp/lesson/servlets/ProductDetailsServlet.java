package uz.pdp.lesson.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.service.ProductService;

import java.io.IOException;

@WebServlet(name = "ProductDetails", urlPatterns = "/productDetails")
public class ProductDetailsServlet extends HttpServlet {
    private static final ProductService productService = ProductService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Products product = productService.getProductById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/productDetails.jsp").forward(request, response);
    }
}
