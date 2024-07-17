<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="uz.pdp.lesson.model.cart.CartItem" %>
<%@ page import="uz.pdp.lesson.service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
    <script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
</head>
<body>
<div class="profile-container">
    <h1>Welcome to Your Profile</h1>
    <%ProductService productService = ProductService.getInstance();%>
    <div class="user-info">
        <h3>User Information</h3>
        <%
            User user = (User) request.getAttribute("user");
            if (user != null) {
        %>
        <ul>
            <li><strong>Full Name:</strong> <%= user.getFullname() %></li>
            <li><strong>Username:</strong> <%= user.getUsername() %></li>
            <li><strong>Email:</strong> <%= user.getEmail() %></li>
            <li><strong>Age:</strong> <%= user.getAge() %></li>
        </ul>
        <% } else { %>
        <p>User information not available.</p>
        <% } %>
    </div>
    <div class="cart-section">
        <h2>Your Cart</h2>
        <%
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            List<Products> products = new ArrayList<>();
            if (items != null && !items.isEmpty()) {
                int totalSum = 0;
        %>
        <ul class="cart-list">
            <%
                for (CartItem item : items) {
                    int productId = item.getProductId();
                    Products product = productService.getProductById(productId);
                    products.add(product);
                    totalSum += product.getPrice();
            %>
            <li><%= product.getName() %> - <%= product.getPrice() %> UZS</li>
            <%
                }
            %>
        </ul>
        <p class="total-amount">Total: <%= totalSum %> UZS</p>
        <form action="processPayment" method="post" class="payment-form">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>
            <button type="submit">Pay</button>
        </form>
        <% } else { %>
        <p>Your cart is empty.</p>
        <% } %>
    </div>

    <h1>
        <form action="/home" method="get">
            <button type="submit" style="color: #28a745">GO TO SHOP</button>
        </form>

    <%--        <a href="/">--%>
<%--            <button type="submit" style="color: #28a745">GO TO SHOP</button>--%>
<%--        </a>--%>
    </h1>

    <button onclick="showLogoutConfirmation()" class="btn">Log Out</button>

    <div id="logoutConfirmation" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()">Yes</button>
        <button onclick="hideLogoutConfirmation()">No</button>
    </div>
</div>
</body>
</html>