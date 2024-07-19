package backend.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import backend.model.products.Products;
import backend.service.ProductService;

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
