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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private ProductsRepository productsRepository;

    @Override
    public void init() throws ServletException {
        productsRepository = new ProductsRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        List<Products> searchResults = productsRepository.searchProducts(query);
        request.setAttribute("products", searchResults);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
