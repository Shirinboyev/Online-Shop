<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerProfile.css">
</head>
<body>
<h1>Welcome to Your Profile</h1>

<h2>Your Cart</h2>
<%
    List<Products> cartItems = (List<Products>) request.getAttribute("cartItems");
    if (cartItems != null && !cartItems.isEmpty()) {
%>
<ul>
    <%
        int totalSum = 0;
        for (Products product : cartItems) {
            totalSum += product.getPrice();
            out.println("<li>" + product.getName() + " - " + product.getPrice() + " UZS</li>");
        }
    %>
</ul>
<p>Total: <%= totalSum %> UZS</p>
<form action="processPayment" method="post">
    <label for="cardNumber">Card Number:</label>
    <input type="text" id="cardNumber" name="cardNumber" required>
    <button type="submit">Pay</button>
</form>
<% } else { %>
<p>Your cart is empty.</p>
<% } %>
</body>
</html>
