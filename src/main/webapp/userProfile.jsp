<%--
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
            <input type="hidden" name="userId" value="<%= user.getId() %>">
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

    &lt;%&ndash;        <a href="/">&ndash;%&gt;
&lt;%&ndash;            <button type="submit" style="color: #28a745">GO TO SHOP</button>&ndash;%&gt;
&lt;%&ndash;        </a>&ndash;%&gt;
    </h1>

    <button onclick="showLogoutConfirmation()" class="btn">Log Out</button>

    <div id="logoutConfirmation" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()">Yes</button>
        <button onclick="hideLogoutConfirmation()">No</button>
    </div>
</div>
</body>
</html>--%>


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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
</head>
<body>
<div class="profile-container container">
    <h1 class="text-center my-4">Welcome to Your Profile</h1>
    <% ProductService productService = ProductService.getInstance(); %>
    <div class="user-info mb-5">
        <h3>User Information</h3>
        <%
            User user = (User) request.getAttribute("user");
            if (user != null) {
        %>
        <ul class="list-group">
            <li class="list-group-item"><strong>Full Name:</strong> <%= user.getFullname() %></li>
            <li class="list-group-item"><strong>Username:</strong> <%= user.getUsername() %></li>
            <li class="list-group-item"><strong>Email:</strong> <%= user.getEmail() %></li>
            <li class="list-group-item"><strong>Age:</strong> <%= user.getAge() %></li>
        </ul>
        <% } else { %>
        <p class="text-danger">User information not available.</p>
        <% } %>
    </div>
    <div class="cart-section mb-5">
        <h2>Your Cart</h2>
        <%
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            List<Products> products = new ArrayList<>();
            if (items != null && !items.isEmpty()) {
                int totalSum = 0;
        %>
        <ul class="list-group">
            <%
                for (CartItem item : items) {
                    int productId = item.getProductId();
                    Products product = productService.getProductById(productId);
                    products.add(product);
                    totalSum += product.getPrice();
            %>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <img src="data:image/jpeg;base64,<%=product.getImageBase64()%>" alt="Image not found">
                <span><%= product.getName() %></span>
                <span class="badge badge-primary badge-pill"><%= product.getPrice() %> UZS</span>
            </li>
            <%
                }
            %>
        </ul>
        <p class="total-amount mt-3">Total: <strong><%= totalSum %> UZS</strong></p>
        <form action="processPayment" method="post" class="payment-form mt-3">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Pay</button>
        </form>
        <% } else { %>
        <p class="text-warning">Your cart is empty.</p>
        <% } %>
    </div>
    <form action="/home" method="get" class="text-center mb-3">
        <button type="submit" class="btn btn-primary">GO TO SHOP</button>
    </form>
    <button onclick="showLogoutConfirmation()" class="btn btn-danger">Log Out</button>
    <div id="logoutConfirmation" class="mt-3" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()" class="btn btn-danger">Yes</button>
        <button onclick="hideLogoutConfirmation()" class="btn btn-secondary">No</button>
    </div>
</div>
</body>
</html>

