
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
import java.util.Base64;
import java.util.List;

@MultipartConfig
@WebServlet(name = "MyMarket", urlPatterns = "/myMarkets")
public class MyMarketsServlet extends HttpServlet {
    private static final String MY_PROJECT_PATH = "C:\\Users\\gayra\\OneDrive\\Desktop\\file\\Shopping-Project";
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
            String uploadPath = MY_PROJECT_PATH + "/src/main/webapp/uploads";
            byte[] bytes = productImagePart.getInputStream().readAllBytes();
            Base64.Encoder encoder = Base64.getEncoder();
            String base64Img = encoder.encodeToString(bytes);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            } else {
                System.out.println("Upload directory exists");
            }

            String filePath = uploadPath + File.separator + fileName;
            System.out.println("File uploaded to: " + filePath);
            try {
                Files.copy(productImagePart.getInputStream(), Paths.get(filePath));
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

            productService.addProduct(productCategory, marketId, productName, productPrice, productDescription, productCount, filePath,base64Img);

            List<Market> markets = vendorService.getMarketsByUserId(ownerId);
            req.setAttribute("markets", markets);
            req.setAttribute("user", user);
        }
        resp.sendRedirect("/vendorProfile");
    }

}
