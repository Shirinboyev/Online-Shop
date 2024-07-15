<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Details</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetails.css">
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
</head>
<body>
<div class="container">
  <%
    Products product = (Products) request.getAttribute("product");
    if (product != null) {
  %>
  <div class="product-details">
    <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" style="width: 300px; height: 300px;" alt="Image not found">
    <h2><%= product.getName() %></h2>
    <p>Price: $<%= product.getPrice() %></p>
    <p>Description: <%= product.getDescription() %></p>
    <p>Category: <%= product.getCategory() %></p>
    <p>Count: <%= product.getCount() %></p>
    <button onclick="deleteProduct(<%= product.getId() %>)">Delete</button>
  </div>
  <%
  } else {
  %>
  <p>Product not found.</p>
  <%
    }
  %>
</div>
</body>
</html>
