<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="uz.pdp.lesson.enums.Categories" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Market Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/marketDetails.css">
</head>
<body>
<div class="container">
    <% if (request.getAttribute("market") != null) { %>
    <div class="market-details">
        <h1>Your Market: <%= ((Market) request.getAttribute("market")).getName() %></h1>
        <div class="market-item">
            <form action="${pageContext.request.contextPath}/marketDetails" method="post" enctype="multipart/form-data" class="product-form">
                <input type="hidden" name="action" value="addProduct">
                <input type="hidden" name="marketId" value="<%= ((Market) request.getAttribute("market")).getId() %>">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required>
                <label for="productPrice">Product Price:</label>
                <input type="text" id="productPrice" name="productPrice" required>
                <label for="productDescription">Product Description:</label>
                <textarea id="productDescription" name="productDescription" required></textarea>
                <label for="productCount">Product Count:</label>
                <input type="text" id="productCount" name="productCount" required>
                <label for="productImage">Product Image:</label>
                <input type="file" id="productImage" name="productImage" required>
                <label for="productCategory">Product Category:</label>
                <select id="productCategory" name="productCategory" required>
                    <% for (Categories category : Categories.values()) { %>
                    <option value="<%= category.name() %>"><%= category.getDisplayName() %></option>
                    <% } %>
                </select>
                <button type="submit" class="add-btn">Add Product</button>
            </form>
        </div>
    </div>
    <% } else { %>
    <p>No market found.</p>
    <% } %>
</div>
</body>
</html>
