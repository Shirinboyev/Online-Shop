package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.service.ProductService;

import java.io.IOException;

@WebServlet(name = "DeleteProduct", urlPatterns = "/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    private static final ProductService productService = ProductService.getInstance();

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        boolean isDeleted = productService.deleteProductById(productId);
        if (isDeleted) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
