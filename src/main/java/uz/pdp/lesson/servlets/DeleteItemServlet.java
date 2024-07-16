package uz.pdp.lesson.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.service.MarketService;
import uz.pdp.lesson.service.UserService;
import uz.pdp.lesson.service.VendorService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {

    private final UserService userService = new UserService();
    private final VendorService vendorService = new VendorService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> requestBody = mapper.readValue(request.getInputStream(), Map.class);

        String id = requestBody.get("id");
        String type = requestBody.get("type");

        boolean success = false;
        switch (type) {
            case "CUSTOMER":
                success = userService.deleteUser((int) Long.parseLong(id));
                break;
            case "VENDOR":
                success = vendorService.deleteVendor((int)Long.parseLong(id));
                break;
        }

        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("success", success);
        response.setContentType("application/json");
        response.getWriter().write(mapper.writeValueAsString(responseBody));
    }
}