<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page import="uz.pdp.lesson.repository.ProductsRepository" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <title>Online Market</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
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
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: slideInDown 1s ease-in-out;
        }

        .header .logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        .header .nav {
            display: flex;
            gap: 15px;
        }

        .header .nav a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .header .nav a:hover {
            color: #ffeb3b;
        }

        /* Search Bar Styles */
        .search-bar {
            margin: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .search-bar input {
            width: 70%;
            padding: 10px 40px;
            border: 2px solid #4CAF50;
            border-radius: 25px;
            outline: none;
            font-size: 1em;
            animation: fadeIn 1s ease-in-out;
        }

        .search-bar input:focus {
            border-color: #388E3C;
        }

        .search-bar .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #000;
            font-size: 1.2em;
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
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        .banner button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.3);
            color: white;
            border: none;
            padding: 10px;
            font-size: 1.5em;
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
            animation: fadeInUp 1s ease-in-out;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            width: 23%;
            max-width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s, box-shadow 0.3s;
            animation: fadeIn 1s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            width: 100%;
            height: 300px; /* Increased height for a larger vertical view */
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
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .product-card .product-info .price {
            font-size: 1.3em;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .product-card .product-info .btn {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .product-card .product-info .btn:hover {
            background-color: #388E3C;
        }

        /* Footer Styles */
        .footer {
            background-color: #4CAF50;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            animation: slideInUp 1s ease-in-out;
        }

        .footer p {
            font-size: 1em;
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

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<header class="header animate__animated animate__fadeInDown">
    <div class="container">
        <div class="logo">
            ONLINE MARKET
        </div>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <i class="fas fa-search search-icon"></i>
                <input type="text" name="query" placeholder="Mahsulotlar va turkumlar izlash" required>
                <button type="submit" style="display: none;"></button>
            </form>
        </div>
        <nav class="nav">
            <%
                HttpSession session1 = request.getSession(false);
                User user = (session1 != null) ? (User) session1.getAttribute("user") : null;
                if (user != null) {
                    String role = user.getRole();
                    if ("ADMIN".equalsIgnoreCase(role)) {
            %>
            <a href="/adminProfile" class="btn">Admin Profile</a>
            <%
            } else if ("VENDOR".equalsIgnoreCase(role)) {
            %>
            <a href="/vendorProfile" class="btn">Vendor Profile</a>
            <%
            } else if ("CUSTOMER".equalsIgnoreCase(role)) {
            %>
            <a href="/userProfile" class="btn">User Profile</a>
            <%
                }
            } else {
            %>
            <a href="/login" class="btn">Login</a>
            <a href="/signup" class="btn">SignUp</a>
            <%
                }
            %>
        </nav>
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

<h1 class="animate__animated animate__fadeInUp" style="padding-left: 30px">Tavsiyalar</h1>
<section class="products">
    <%
        @SuppressWarnings("unchecked")
        List<Products> products = (List<Products>) request.getAttribute("products");
        if (products == null) {
            ProductsRepository repo = new ProductsRepository();
            products = repo.getAllProducts();
        }
        if (products != null && !products.isEmpty()) {
            for (Products product : products) {
    %>
    <div class="product-card" data-aos="fade-up">
        <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="Image not found">
        <div class="product-info">
            <h3><%= product.getName() %></h3>
            <div>
                <div class="price"><%= product.getPrice() %> $</div>
                <%
                    User curUser = (User) session.getAttribute("user");
                    if (curUser != null){
                %>
                <form action="${pageContext.request.contextPath}/addToCart" method="post">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    <% if (user != null) { %>
                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                    <% } %>
                    <button type="submit" class="btn">Savatchaga qo'shish</button>
                </form>
                <%} else {%>
                <a href="login"><button type="submit" class="btn">Savatchaga qo'shish</button></a>
                <%}%>
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
</section>

<footer class="footer">
    <section class="contact">
        <div class="container">
            <div class="contact-content">
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.6846892987535!2d106.68562427473483!3d10.762622060915134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317529292f133edb%3A0xeeb5a2a2a2bdee4!2sBen%20Thanh%20Market!5e0!3m2!1sen!2s!4v1625146581905!5m2!1sen!2s"
                            width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </section>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true,
    });
</script>
</body>
</html>
