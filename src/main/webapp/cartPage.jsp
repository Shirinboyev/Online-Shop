<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartPage.css">
    <title>Shopping Cart</title>
</head>
<body>
<h1>Shopping Cart</h1>
<%
    List<Products> cart = (List<Products>) request.getAttribute("cart");
    if (cart != null && !cart.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Products product : cart) {
    %>
    <tr>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %> UZS</td>
        <td>1</td>
        <td><%= product.getPrice() %> UZS</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p>No products in the cart.</p>
<%
    }
%>
</body>
</html>
