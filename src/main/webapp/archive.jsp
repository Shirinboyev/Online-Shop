<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="backend.model.products.Products" %>
<%@ page import="backend.service.ProductService" %>
<%@ page import="backend.model.cart.Cart" %>
<%@ page import="backend.model.orders.OrderDetails" %>
<%@ page import="backend.service.UserService" %>
<%@ page import="backend.model.user.User" %>
<%@ page import="javax.persistence.criteria.CriteriaBuilder" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Archived Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/archives.css">
</head>
<body>
<div class="container">
    <h1>Archived Products</h1>
    <%
        UserService userService = UserService.getInstance();
        HttpSession session1 = request.getSession(false);
        Integer userId = (Integer) request.getAttribute("userId");
        @SuppressWarnings("unchecked")
        List<OrderDetails> archives = (List<OrderDetails>) request.getAttribute("archives");
        User user = userService.getUserById(userId);
        if (user != null) {
            if (archives != null && !archives.isEmpty()) {
    %>
    <ul>
        <% for (OrderDetails order : archives) { %>
        <li>
            <p>Order Date: <%= order.getOrdered_date() %>
            </p>
            <p>Price: <%= order.getPrice() %> UZS</p>
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
