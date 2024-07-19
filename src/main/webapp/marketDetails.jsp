<%@ page import="backend.model.market.Market" %>
<%@ page import="backend.enums.Categories" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Market Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/marketDetails.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.1/gsap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5dc; /* Cream background */
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .market-details {
            text-align: center;
            margin-bottom: 20px;
        }

        .market-details h1 {
            margin-bottom: 20px;
            font-size: 1.8em;
            animation: fadeInDown 1s ease-in-out;
        }

        .market-item {
            text-align: left;
        }

        .product-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            animation: fadeIn 1s ease-in-out;
        }

        .product-form label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .product-form input[type="text"],
        .product-form textarea,
        .product-form select,
        .product-form input[type="file"] {
            padding: 8px;
            font-size: 0.9em; /* Smaller input fields */
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        .product-form textarea {
            resize: vertical;
        }

        .product-form button {
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .product-form button:hover {
            background-color: #45a049;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
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
