package uz.pdp.lesson.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.lesson.model.products.Products;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
        HttpSession session = request.getSession();
        List<Products> cart = (List<Products>) session.getAttribute("cart");

        request.setAttribute("cart", cart);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cartPage.jsp");
        dispatcher.forward(request, response);
    }
}