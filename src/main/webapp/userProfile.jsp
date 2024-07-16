<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.4/css/bulma.min.css">
    <!-- Anime.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
        }
        .profile-container {
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            opacity: 0;
            transform: translateY(30px);
        }
        .user-info ul, .cart-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .user-info li, .cart-list li {
            padding: 15px;
            border-bottom: 1px solid #eee;
            font-size: 16px;
        }
        .user-info li:last-child, .cart-list li:last-child {
            border-bottom: none;
        }
        .total-amount {
            font-weight: bold;
            font-size: 1.2em;
            margin-top: 15px;
        }
        .payment-form {
            margin-top: 20px;
        }
        .btn-logout {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ff3860;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        #logoutConfirmation {
            display: none;
            margin-top: 10px;
            text-align: center;
        }
        #logoutConfirmation p {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<!-- Logout Button -->
<button onclick="showLogoutConfirmation()" class="btn-logout"><i class="fas fa-sign-out-alt"></i></button>

<div class="container profile-container">
    <h1 class="title is-3">Welcome to Your Profile</h1>
    <div class="user-info">
        <h3 class="title is-4">User Information</h3>
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
        <h2 class="title is-4">Your Cart</h2>
        <%
            List<Products> cartItems = (List<Products>) request.getAttribute("cartItems");
            if (cartItems != null && !cartItems.isEmpty()) {
                int totalSum = 0;
        %>
        <ul class="cart-list">
            <%
                for (Products product : cartItems) {
                    totalSum += product.getPrice();
            %>
            <li><%= product.getName() %> - <%= product.getPrice() %> UZS</li>
            <%
                }
            %>
        </ul>
        <p class="total-amount">Total: <%= totalSum %> UZS</p>
        <form action="processPayment" method="post" class="payment-form">
            <div class="field">
                <label class="label" for="cardNumber">Card Number:</label>
                <div class="control">
                    <input type="text" class="input" id="cardNumber" name="cardNumber" required>
                </div>
            </div>
            <button type="submit" class="button is-primary">Pay</button>
        </form>
        <% } else { %>
        <p>Your cart is empty.</p>
        <% } %>
    </div>

    <div class="text-center">
        <form action="/home" method="get">
            <button type="submit" class="button is-success">Go to Shop</button>
        </form>
    </div>

    <div id="logoutConfirmation" class="mt-3">
        <p>Are you sure you want to log out?</p>
        <button onclick="confirmLogout()" class="button is-primary">Yes</button>
        <button onclick="hideLogoutConfirmation()" class="button is-light">No</button>
    </div>
</div>

<!-- Anime.js -->
<script>
    function showLogoutConfirmation() {
        document.getElementById('logoutConfirmation').style.display = 'block';
        anime({
            targets: '.profile-container',
            translateY: [30, 0],
            opacity: [0, 1],
            duration: 1000,
            easing: 'easeOutQuad'
        });
    }

    function hideLogoutConfirmation() {
        document.getElementById('logoutConfirmation').style.display = 'none';
    }

    function confirmLogout() {
        // Perform logout action here (e.g., redirect to logout servlet)
        window.location.href = '/logout';
    }

    // Animate profile container on page load
    anime({
        targets: '.profile-container',
        translateY: [30, 0],
        opacity: [0, 1],
        duration: 1000,
        easing: 'easeOutQuad'
    });
</script>

<!-- Font Awesome (for logout icon) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
