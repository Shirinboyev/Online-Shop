<%@ page import="backend.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="backend.model.products.Products" %>
<%@ page import="backend.model.cart.CartItem" %>
<%@ page import="backend.service.ProductService" %>
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
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        .header {
            background-color: #343a40;
            padding: 20px;
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .header .btn {
            color: #ffffff;
            background-color: #343a40;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-left: 10px;
        }

        .header .btn:hover {
            background-color: #343a40;
            transform: scale(1.05);
        }

        .profile-container {
            max-width: 800px;
            margin: 80px auto 40px auto; /* Add top margin for fixed header */
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .profile-container:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .profile-container h1, .profile-container h2 {
            color: #343a40;
            margin-bottom: 20px;
        }

        .profile-container .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 10px;
            border: 1px solid #e9ecef;
            border-radius: 4px;
            transition: background-color 0.3s ease, border 0.3s ease;
        }

        .profile-container .list-group-item:hover {
            background-color: #e9ecef;
            border-color: #dee2e6;
        }

        .profile-container .img-thumbnail {
            max-width: 50px;
            max-height: 50px;
            object-fit: cover;
            border-radius: 50%;
        }

        .profile-container .total-amount {
            font-size: 1.2em;
            font-weight: bold;
        }

        .profile-container .btn {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .profile-container .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .payment-form {
            display: flex;
            align-items: center;
        }

        .payment-form .form-group {
            display: flex;
            align-items: center;
            gap: 10px; /* Space between inputs */
        }

        .payment-form .form-control.card-number {
            flex: 1; /* Takes up available space */
        }

        .payment-form .form-control.card-code {
            width: 80px; /* Smaller width for card code */
        }

        #logoutConfirmation {
            text-align: center;
            margin-top: 20px;
        }

        .form-group label {
            margin-right: 10px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            gsap.from('.profile-container', {duration: 1, y: -100, opacity: 0, ease: 'bounce'});

            // Add input mask for card number
            const cardNumberInput = document.getElementById('cardNumber');
            cardNumberInput.addEventListener('input', function(e) {
                e.target.value = e.target.value.replace(/\D/g, '')
                    .replace(/(.{4})/g, '$1-')
                    .replace(/-$/, '')
                    .slice(0, 19); // Ensure the length does not exceed 19 characters including dashes
            });

            // Validate and format card code
            const cardCodeInput = document.getElementById('cardCode');
            cardCodeInput.addEventListener('input', function(e) {
                let value = e.target.value.replace(/\D/g, '');
                if (value.length > 4) {
                    value = value.slice(0, 4);
                }
                if (value.length > 2) {
                    value = value.slice(0, 2) + '/' + value.slice(2);
                }
                const [day, month] = value.split('/').map(Number);
                if (day >= 31) {
                    value = '31/';
                }
                if (month >= 99) {
                    value = value.slice(0, 3) + '99';
                }

                e.target.value = value;
            });
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
<div class="header">
    <form action="/home" method="get">
        <button type="submit" class="btn btn-primary">GO TO SHOP</button>
    </form>
    <button onclick="showLogoutConfirmation()" class="btn btn-danger">Log Out</button>
    <form action="/archives" method="get">
        <button type="submit" class="btn btn-info">Archive</button>
    </form>
</div>
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
                <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>" class="img-thumbnail">
                <span><%= product.getName() %></span>
                <span class="badge badge-primary badge-pill"><%= product.getPrice() %>$</span>
            </li>
            <% } %>
        </ul>
        <p class="total-amount mt-3">Total: <strong><%= totalSum %>$</strong></p>
        <form action="processPayment" method="post" class="payment-form mt-3">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" class="form-control card-number" pattern="(\d{4}-){3}\d{4}" maxlength="19" required>
                <label for="cardCode">Code:</label>
                <input type="text" id="cardCode" name="cardCode" class="form-control card-code" maxlength="5" required>
                <button type="submit" class="btn btn-success">Pay</button>
            </div>
        </form>
        <% } else { %>
        <p class="text-warning">Your cart is empty.</p>
        <% } %>
    </div>

    <div id="logoutConfirmation" class="mt-3" style="display:none;">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()" class="btn btn-danger">Yes</button>
        <button onclick="hideLogoutConfirmation()" class="btn btn-secondary">No</button>
    </div>
</div>
</body>
</html>
