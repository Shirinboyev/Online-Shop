<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="uz.pdp.lesson.service.ProductService" %>
<%@ page import="uz.pdp.lesson.model.cart.Cart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Archived Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/archive.css">
</head>
<body>
<div class="container">
    <h1>Archived Products</h1>
    <%
        ProductService productService = ProductService.getInstance();
        HttpSession session1 = request.getSession();
        Integer userId = (Integer) session1.getAttribute("userId");
        Cart cart =  (Cart) session1.getAttribute("cart");

        if (userId != null) {
            List<Products> archivedProducts = (List<Products>) request.getAttribute("archivedProducts");
            if (archivedProducts != null && !archivedProducts.isEmpty() && cart.isPaid()) {
    %>
    <ul>
        <% for (Products product : archivedProducts) { %>
        <li>
            <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>">
            <span><%= product.getName() %></span>
            <span><%= product.getPrice() %>$</span>
        </li>
        <% } %>
    </ul>
    <% } else { %>
    <p>No archived products found.</p>
    <% } %>
    <% } else { %>
    <p>Please log in to view archived products.</p>
    <% } %>
</div>
</body>
</html>
