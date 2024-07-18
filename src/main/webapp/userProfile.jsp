<%--
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="uz.pdp.lesson.model.cart.CartItem" %>
<%@ page import="uz.pdp.lesson.service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            gsap.from('.profile-container', {duration: 1, y: -100, opacity: 0, ease: 'bounce'});
        });

        function showLogoutConfirmation() {
            document.getElementById('logoutConfirmation').style.display = 'block';
        }

        function hideLogoutConfirmation() {
            document.getElementById('logoutConfirmation').style.display = 'none';
        }

        function confirmLogout() {
            window.location.href = '/logout';
        }
    </script>
</head>
<body>
<div class="profile-container container mt-5">
    <h1 class="text-center my-4">Welcome to Your Profile</h1>
    <%
        ProductService productService = ProductService.getInstance();
        User user = (User) request.getAttribute("user");
    %>
    <div class="user-info mb-5">
        <h3>User Information</h3>
        <% if (user != null) { %>
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
            if (items != null && !items.isEmpty()) {
                List<Products> products = new ArrayList<>();
                int totalSum = 0;
        %>
        <ul class="list-group">
            <% for (CartItem item : items) {
                int productId = item.getProductId();
                Products product = productService.getProductById(productId);
                products.add(product);
                totalSum += product.getPrice();
            %>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>" class="product-image">
                <span><%= product.getName() %></span>
                <span class="badge badge-primary badge-pill"><%= product.getPrice() %>$</span>
            </li>
            <% } %>
        </ul>
        <p class="total-amount mt-3">Total: <strong><%= totalSum %>$</strong></p>
        <form action="processPayment" method="post" class="payment-form mt-3">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="number" id="cardNumber" name="cardNumber" class="form-control" required>
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
    <form action="/archives">
        <button>Archive</button>
    </form>
    <div id="logoutConfirmation" class="mt-3" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()" class="btn btn-danger">Yes</button>
        <button onclick="hideLogoutConfirmation()" class="btn btn-secondary">No</button>
    </div>
</div>
</body>
</html>
--%>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="uz.pdp.lesson.model.cart.CartItem" %>
<%@ page import="uz.pdp.lesson.service.ProductService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .profile-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .user-info ul, .cart-section ul {
            list-style: none;
            padding: 0;
        }
        .product-image {
            width: 50px;
            height: 50px;
            border-radius: 5px;
        }
        .total-amount {
            font-size: 1.2em;
            color: #28a745;
        }
        .payment-form {
            margin-top: 20px;
        }
        .btn {
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .btn:hover {
            transform: scale(1.05);
        }
        #logoutConfirmation {
            background: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            gsap.from('.profile-container', {duration: 1, y: -100, opacity: 0, ease: 'bounce'});
        });

        function showLogoutConfirmation() {
            gsap.to('#logoutConfirmation', {duration: 0.5, scale: 1, opacity: 1, display: 'block'});
        }

        function hideLogoutConfirmation() {
            gsap.to('#logoutConfirmation', {duration: 0.5, scale: 0.5, opacity: 0, display: 'none'});
        }

        function confirmLogout() {
            window.location.href = '/logout';
        }
    </script>
</head>
<body>
<div class="profile-container container mt-5">
    <h1 class="text-center my-4">Welcome to Your Profile</h1>
    <%
        ProductService productService = ProductService.getInstance();
        User user = (User) request.getAttribute("user");
    %>
    <div class="user-info mb-5">
        <h3>User Information</h3>
        <% if (user != null) { %>
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
            if (items != null && !items.isEmpty()) {
                List<Products> products = new ArrayList<>();
                int totalSum = 0;
        %>
        <ul class="list-group">
            <% for (CartItem item : items) {
                int productId = item.getProductId();
                Products product = productService.getProductById(productId);
                products.add(product);
                totalSum += product.getPrice();
            %>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>" class="product-image">
                <span><%= product.getName() %></span>
                <span class="badge badge-primary badge-pill"><%= product.getPrice() %>$</span>
            </li>
            <% } %>
        </ul>
        <p class="total-amount mt-3">Total: <strong><%= totalSum %>$</strong></p>
        <form action="processPayment" method="post" class="payment-form mt-3">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="number" id="cardNumber" name="cardNumber" class="form-control" required>
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
    <form action="/archives" method="get" class="text-center mb-3">
        <button type="submit" class="btn btn-info mt-3">Archive</button>
    </form>
    <div id="logoutConfirmation" class="mt-3" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()" class="btn btn-danger">Yes</button>
        <button onclick="hideLogoutConfirmation()" class="btn btn-secondary">No</button>
    </div>
</div>
</body>
</html>
