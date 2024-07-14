<% User user = new User(); %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="jdk.internal.jimage.ImageLocation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
</head>
<body>
<div class="profile-container">
    <h1>Welcome to Your Profile</h1>

    <div class="cart-section">
        <h2>Your Cart</h2>
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
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" required>
            <button type="submit">Pay</button>
        </form>
        <% } else { %>
        <p>Your cart is empty.</p>
        <% } %>
    </div>

</div>
</body>
</html>
