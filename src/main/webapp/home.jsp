<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Online Shop</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }

        .header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .nav a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .hero {
            background-image: url('https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2022/11/23073428/sl-market-cart-sale-percent-1200x600.jpg');
            background-size: cover;
            background-position: center;
            text-align: center;
            padding: 100px 20px;
            color: #fff;
        }

        .hero h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.2em;
            margin-bottom: 40px;
        }

        .hero .btn {
            background-color: #ff5a5f;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 1em;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .hero .btn:hover {
            background-color: #e04e4e;
        }

        .about, .info {
            padding: 50px 20px;
            text-align: center;
        }

        .about h2, .info h2 {
            font-size: 2em;
            margin-bottom: 20px;
        }

        .about p, .info p {
            font-size: 1.2em;
        }

        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        .footer p {
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="logo">
            <h1>Online Shop</h1>
        </div>
        <nav class="nav">
            <a href="/login">Login</a>
            <a href="/register">Register</a>
        </nav>
    </div>
</header>

<section class="hero">
    <div class="container">
        <h1>Welcome to Our Online Shop</h1>
        <p>Discover amazing products and great deals!</p>
        <a href="/shop" class="btn">Start Shopping</a>
    </div>
</section>

<section class="about">
    <div class="container">
        <h2>About Us</h2>
        <p>Learn more about our company and values.</p>
    </div>
</section>

<section class="info">
    <div class="container">
        <h2>Company Info</h2>
        <p>We strive to provide the best shopping experience for our customers.</p>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Online Shop. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
