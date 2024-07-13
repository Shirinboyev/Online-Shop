<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <title>Online Market</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        .header {
            background-color: #3f51b5;
            color: #fff;
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            animation: fadeInDown 1s ease-in-out;
        }

        .header .logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        .header .nav {
            display: flex;
            gap: 20px;
        }

        .header .nav a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .header .nav a:hover {
            text-decoration: underline;
        }

        /* Search Bar Styles */
        .search-bar {
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .search-bar input {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Banner Styles */
        .banner {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
            overflow: hidden;
        }

        .banner img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out;
        }

        .banner button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.2);
            color: white;
            border: none;
            padding: 10px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s;
        }

        .banner button:hover {
            background: rgba(0, 0, 0, 0.1);
        }

        .banner .prev {
            left: 10px;
        }

        .banner .next {
            right: 10px;
        }

        /* Products Styles */
        .products {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding: 20px 0;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            width: 200px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding-bottom: 10px;
            transition: transform 0.3s;
            animation: fadeInUp 1s ease-in-out;
        }

        .product-card:hover {
            transform: translateY(-10px);
        }

        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .product-card .product-info {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .product-card .product-info h3 {
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        .product-card .product-info .price {
            font-size: 1.2em;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .product-card .product-info .btn {
            background-color: #3f51b5;
            color: #fff;
            padding: 10px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .product-card .product-info .btn:hover {
            background-color: #303f9f;
        }

        /* Footer Styles */
        .footer {
            background-color: #3f51b5;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            animation: fadeInUp 1.5s ease-in-out;
        }

        .footer p {
            font-size: 0.9em;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
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
<header class="header">
    <div class="container">
        <div class="logo">
            ONLINE MARKET
        </div>
        <nav class="nav">
            <a href="catalog.jsp" class="btn">Katalog</a>
            <a href="/userProfile" class="btn">Savat</a>
            <a href="/login" class="btn">Login</a>
            <a href="/signup" class="btn">Register</a>
        </nav>
    </div>
    <div class="search-bar">
        <input type="text" placeholder="Mahsulotlar va turkumlar izlash">
    </div>
</header>
<div class="banner">
    <button class="prev" onclick="prevImage()">&lt;</button>
    <img src="${pageContext.request.contextPath}/images/phones.jpg" alt="Banner Image" id="bannerImage">
    <button class="next" onclick="nextImage()">&gt;</button>
</div>

<script>
    let currentImageIndex = 0;
    const images = [
        "${pageContext.request.contextPath}/images/phones.jpg",
        "${pageContext.request.contextPath}/images/homePage.jpg",
    ];

    function showImage(index) {
        const image = document.getElementById('bannerImage');
        if (index >= 0 && index < images.length) {
            image.src = images[index];
            currentImageIndex = index;
        }
    }

    function nextImage() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
        showImage(currentImageIndex);
    }

    function prevImage() {
        currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
        showImage(currentImageIndex);
    }
</script>

<h1 style="padding-left: 30px">Tavsiyalar</h1>
<section class="products">
    <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/sampleProduct.jpg" alt="Sample Product">
        <div class="product-info">
            <h3>Sample Product</h3>
            <div>
                <div class="price">50000 UZS</div>
                <button class="btn" onclick="addToCart(1)">Savatchaga qo'shish</button>
            </div>
        </div>
    </div>
</section>
<%--<section class="products">
    <%
        List<Products> products = (List<Products>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Products product : products) {
    %>
    <div class="product-card">
        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
        <div class="product-info">
            <h3><%= product.getName() %></h3>
            <div>
                <div class="price"><%= product.getPrice() %> UZS</div>
                <button class="btn" onclick="addToCart(<%= product.getId() %>)">Savatchaga qo'shish</button>
            </div>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>No products found.</p>
    <%
        }
    %>
</section>--%>

<script>
    function addToCart(productId) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/addToCart", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert("Product added to cart successfully!");
            }
        };
        xhr.send("productId=" + productId);
    }
</script>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Uzum Market. Barcha huquqlar himoyalangan.</p>
    </div>
</footer>
</body>
</html>
