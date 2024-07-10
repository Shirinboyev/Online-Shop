package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.IOException;

@WebServlet("/userProfile")
public class UserProfileServlet extends HttpServlet {

    private ProductsRepository productsRepository;

    @Override
    public void init() throws ServletException {

        productsRepository = new ProductsRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }


//        request.setAttribute("cartItems", );
//        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
