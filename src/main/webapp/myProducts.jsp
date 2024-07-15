<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myProducts.css">
</head>
<body>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/">
        <h1>want to shop?</h1>
    </a>
</div>
<div class="container">
    <h1>My Products</h1>
    <div class="product-list">
        <%
            @SuppressWarnings("unchecked")
            List<Products> products = (List<Products>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Products product : products) {
        %>
        <div class="product-item">
            <img src="data:image/jpeg;base64,<%=product.getImageBase64()%>" style="width: 150px; height: 150px;" alt="Image not found">
            <h2><%= product.getName() %></h2>
            <p>Price: $<%= product.getPrice() %></p>
        </div>
        <%
            }
        } else {
        %>
        <p>No products found.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
