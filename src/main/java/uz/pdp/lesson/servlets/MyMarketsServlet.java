
package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.lesson.enums.Categories;
import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.user.User;
import uz.pdp.lesson.service.ProductService;
import uz.pdp.lesson.service.UserService;
import uz.pdp.lesson.service.VendorService;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "MyMarket", urlPatterns = "/myMarkets")
public class MyMarketsServlet extends HttpServlet {
    private static final String MY_PROJECT_PATH = "D:\\Java\\java-codes\\Online-Shop";
    private final ProductService productService = ProductService.getInstance();
    private final VendorService vendorService = VendorService.getInstance();
    private final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer ownerId = userService.getUserId(user);
            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);
        }
        req.getRequestDispatcher("/myMarkets.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer ownerId = userService.getUserId(user);
            Part productImagePart = req.getPart("productImage");
            String fileName = Paths.get(productImagePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("/uploads");
            System.out.println("Upload Path: " + uploadPath);

            byte[] bytes = productImagePart.getInputStream().readAllBytes();
            Base64.Encoder encoder = Base64.getEncoder();
            String base64Img = encoder.encodeToString(bytes);

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            } else {
                System.out.println("Upload directory exists");
            }

            String filePath = uploadPath + File.separator + fileName;
            System.out.println("File uploaded to: " + filePath);

            try (InputStream input = productImagePart.getInputStream()) {
                Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }

            int marketId = Integer.parseInt(req.getParameter("marketId"));
            String productName = req.getParameter("productName");
            double productPrice = Double.parseDouble(req.getParameter("productPrice"));
            String productDescription = req.getParameter("productDescription");
            int productCount = Integer.parseInt(req.getParameter("productCount"));
            String productCategory = req.getParameter("productCategory");

            System.out.println("Market ID: " + marketId);
            System.out.println("Product Name: " + productName);
            System.out.println("Product Price: " + productPrice);
            System.out.println("Product Description: " + productDescription);
            System.out.println("Product Count: " + productCount);
            System.out.println("Product Category: " + productCategory);
            System.out.println("File Path: " + filePath);
            System.out.println("Base64 Image: " + base64Img);

            productService.addProduct(productCategory, marketId, productName, productPrice, productDescription, productCount, filePath, base64Img);
            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);
        }
        resp.sendRedirect("/vendorProfile");
    }


}