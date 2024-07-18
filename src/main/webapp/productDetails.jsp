<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Details</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetails.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script>
    function deleteProduct(productId) {
      if (confirm("Are you sure you want to delete this product?")) {
        fetch(`${pageContext.request.contextPath}/deleteProduct?productId=${productId}`, {
          method: 'DELETE'
        }).then(response => {
          if (response.ok) {
            window.location.href = '${pageContext.request.contextPath}/myProducts';
          } else {
            alert('Failed to delete the product');
          }
        });
      }
    }
  </script>
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #ececec, #f5f5f5);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      padding: 0;
    }

    .container {
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      padding: 25px;
      max-width: 600px;
      width: 90%;
      animation: fadeIn 1s ease-in-out;
      text-align: center;
    }

    .product-details {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .product-image {
      width: 100%;
      max-width: 400px;
      height: auto;
      border-radius: 12px;
      margin-bottom: 20px;
      transition: transform 0.3s ease;
    }

    .product-image:hover {
      transform: scale(1.05);
    }

    .product-title {
      font-size: 2.2em;
      color: #333;
      margin-bottom: 15px;
    }

    .product-price, .product-description, .product-category, .product-count, .product-market-id {
      font-size: 1.1em;
      color: #666;
      margin: 5px 0;
    }

    .delete-button {
      background-color: #ff4b5c;
      color: #ffffff;
      border: none;
      padding: 12px 24px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 1.1em;
      margin-top: 20px;
      display: inline-flex;
      align-items: center;
      transition: background-color 0.3s ease;
    }

    .delete-button i {
      margin-right: 8px;
    }

    .delete-button:hover {
      background-color: #e0434e;
    }

    .back-button {
      background-color: #6c757d;
      color: #ffffff;
      border: none;
      padding: 12px 24px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 1.1em;
      margin-top: 20px;
      display: inline-flex;
      align-items: center;
      transition: background-color 0.3s ease;
    }

    .back-button i {
      margin-right: 8px;
    }

    .back-button:hover {
      background-color: #5a6268;
    }

    @media (max-width: 600px) {
      .container {
        padding: 15px;
      }

      .product-title {
        font-size: 1.8em;
      }

      .delete-button, .back-button {
        padding: 10px 20px;
        font-size: 1em;
      }
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
<div class="container animate__animated animate__fadeIn">
  <%
    Products product = (Products) request.getAttribute("product");
    if (product != null) {
  %>
  <div class="product-details">
    <img src="data:image/jpeg;base64,<%=product.getImageBase64()%>" alt="Image not found">
    <h2 class="product-title"><%= product.getName() %></h2>
    <p class="product-price">Price: $<%= product.getPrice() %></p>
    <p class="product-description">Description: <%= product.getDescription() %></p>
    <p class="product-category">Category: <%= product.getCategory() %></p>
    <p class="product-count">Count: <%= product.getCount() %></p>
    <p class="product-market-id">Market Id: <%=product.getMarketId() %></p>
    <form action="${pageContext.request.contextPath}/myProducts" method="get">
      <button type="submit" class="back-button"><i class="fas fa-arrow-left"></i>Back</button>
    </form>
  </div>
  <%
  } else {
  %>
  <p>Product not found.</p>
  <%
    }
  %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
