package backend.servlets;

import backend.service.MarketService;
import backend.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/deleteMarket")
public class DeleteMarketServlet extends HttpServlet {
    private final MarketService marketService = MarketService.getInstance();
    private final ProductService productService = ProductService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int marketId = Integer.parseInt(request.getParameter("marketId"));

        // First, delete all products related to the market
        productService.deleteProductsByMarketId(marketId);

        // Then, delete the market
        marketService.deleteMarket(marketId);

        // Redirect back to the markets page
        response.sendRedirect(request.getContextPath() + "/myMarkets");
    }
}
