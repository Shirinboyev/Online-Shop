<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shop - Home</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header {
            background-color: #3f51b5;
            color: #fff;
            padding: 15px 0;
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
        }

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
        }

        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .product-card .product-info {
            padding: 15px;
        }

        .product-card .product-info h3 {
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        .product-card .product-info p {
            color: #666;
            margin-bottom: 10px;
        }

        .product-card .product-info .price {
            font-size: 1.2em;
            color: #4CAF50; /* Green color for the price */
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

        .footer {
            background-color: #3f51b5;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        .footer p {
            font-size: 0.9em;
        }

        .single-row {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            gap: 20px;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="logo">
            <a href="/">Online Shop </a>
        </div>
        <nav class="nav">
            <a href="/login">Login</a>
            <a href="/signup">Register</a>
            <a href="/orders">Orders</a>
        </nav>
    </div>
</header>

<div class="search-bar">
    <input type="text" placeholder="Search for products and categories">
</div>

<section class="products single-row">
    <div class="product-card">
        <img src="images/oyoqKiyim.jpg" alt="Product 1">
        <div class="product-info">
            <h3>Yozgi oyoq kiyim</h3>
            <div class="price">99,000 UZS</div>
            <a href="#" class="btn">Add to Cart</a>
        </div>
    </div>
    <div class="product-card">
        <img src="images/kepka.jpg" alt="Product 2">
        <div class="product-info">
            <h3>Quyoshdan ximoya uchun kepka</h3>
            <div class="price">59,000 UZS</div>
            <a href="#" class="btn">Add to Cart</a>
        </div>
    </div>
    <div class="product-card">
        <img src="images/anorsuv.jpg" alt="Product 3">
        <div class="product-info">
            <h3>Anor suvi</h3>
            <div class="price">12,000 UZS</div>
            <a href="#" class="btn">Add to Cart</a>
        </div>
    </div>
    <div class="product-card">
        <img src="images/mishka.png" alt="Product 4">
        <div class="product-info">
            <h3>Komputer uchun mishka</h3>
            <div class="price">139,000 UZS</div>
            <a href="#" class="btn">Add to Cart</a>
        </div>
    </div>
    <div class="product-card">
        <img src="images/kiyim.jpg" alt="Product 5">
        <div class="product-info">
            <h3>Boshdan oyoq sarpo</h3>
            <div class="price">199,000 UZS</div>
            <a href="#" class="btn">Add to Cart</a>
        </div>
    </div>
    <!-- Add more products as needed -->
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Online Shop. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
