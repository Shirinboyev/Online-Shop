package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import uz.pdp.lesson.enums.Categories;
import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.MarketRepository;
import uz.pdp.lesson.repository.ProductsRepository;

import java.io.*;
import java.util.Base64;

@WebServlet(name = "MarketDetailsServlet", urlPatterns = "/marketDetails")
@MultipartConfig
public class MarketDetailsServlet extends HttpServlet {
    private final MarketRepository marketRepo = new MarketRepository();
    private final ProductsRepository productRepo = new ProductsRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int marketId = Integer.parseInt(request.getParameter("marketId"));
        Market market = marketRepo.getMarketById(marketId);

        if (market != null) {
            request.setAttribute("market", market);
            request.getRequestDispatcher("/marketDetails.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Market not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addProduct".equals(action)) {
            addProduct(request, response);
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productDescription = request.getParameter("productDescription");
        String productCount = request.getParameter("productCount");
        String productCategory = request.getParameter("productCategory");
        int marketId = Integer.parseInt(request.getParameter("marketId"));

        Part filePart = request.getPart("productImage");
        String fileName = filePart.getSubmittedFileName();
        String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) uploadDirFile.mkdirs();
        String filePath = uploadDir + File.separator + fileName;
        filePart.write(filePath);

        // Convert image file to Base64
        String base64Img = encodeFileToBase64(filePath);

        Products product = new Products();
        product.setName(productName);
        product.setPrice(Integer.parseInt(productPrice));
        product.setDescription(productDescription);
        product.setCount(Integer.parseInt(productCount));
        product.setCategory(String.valueOf(Categories.valueOf(productCategory)));
        product.setImageUrl(filePath);
        product.setImageBase64(base64Img); // Set Base64 encoded image data
        product.setMarketId(marketId);

        productRepo.save(product);

        response.sendRedirect("/myMarkets");
    }

    private String encodeFileToBase64(String filePath) {
        String base64Image = null;
        try (InputStream inputStream = new FileInputStream(filePath)) {
            byte[] bytes = inputStream.readAllBytes();
            base64Image = Base64.getEncoder().encodeToString(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return base64Image;
    }
}
