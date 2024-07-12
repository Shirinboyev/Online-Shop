
<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Markets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myMarkets.css">
    <style>
        .container {
            margin: 20px auto;
            width: 80%;
            padding: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .market-list {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .market-item {
            background-color: #fff;
            padding: 15px;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            max-width: 600px;
        }
        .market-item form {
            display: flex;
            flex-direction: column;
        }
        .market-item label {
            margin: 5px 0 2px;
            color: #555;
        }
        .market-item input, .market-item textarea, .market-item button {
            margin: 5px 0 15px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }
        .market-item button {
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Markets</h2>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="market-list">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="market-item">

            <form action="${pageContext.request.contextPath}/myMarkets" method="post" class="product-form">
                <input type="hidden" name="action" value="addProduct">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required>
                <label for="productPrice">Product Price:</label>
                <input type="text" id="productPrice" name="productPrice" required>
                <label for="productDescription">Product Description:</label>
                <textarea id="productDescription" name="productDescription" required></textarea>
                <label for="productCount">Product Count:</label>
                <input type="text" id="productCount" name="productCount" required>
                <label for="productImageUrl">Product Image URL:</label>
                <input type="text" id="productImageUrl" name="productImageUrl" required>
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit" class="add-btn">Add Product</button>
            </form>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p>No markets created yet.</p>
    <% } %>
</div>
</body>
</html>
