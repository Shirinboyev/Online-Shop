<%--
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
    <a href="${pageContext.request.contextPath}/vendorProfile">
        <h1>Go to profile</h1>
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
            <form action="${pageContext.request.contextPath}/deleteProduct" method="post">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
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
--%>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myProducts.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
            padding: 10px 20px;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
        }
        .container {
            margin-top: 50px;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-item {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 250px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .product-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
        }
        .product-item img {
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .product-item h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .product-item p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .details-btn {
            background-color: #00ff0a ;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
        .details-btn:hover{
            background-color: #00ff0a;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="${pageContext.request.contextPath}/vendorProfile">Go to Profile</a>
</div>
<div class="container">
    <h1 class="text-center mb-5">My Products</h1>
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
            <div class="d-flex justify-content-between">
                <form action="${pageContext.request.contextPath}/deleteProduct" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
                <form action="${pageContext.request.contextPath}/productDetails" method="get">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <button type="submit" class="details-btn">Details</button>
                </form>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="text-center">No products found.</p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
