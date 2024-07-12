<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <title>Online Shop - Home</title>
    <script>
        function addToCart(productId) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "${pageContext.request.contextPath}/addToCart", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        alert("Mahsulot savatchaga qo'shildi!");
                    } else if (xhr.status === 401) {
                        alert("Iltimos, tizimga kiring.");
                        window.location.href = "${pageContext.request.contextPath}/login";
                    } else {
                        alert("Mahsulotni savatchaga qo'shishda xatolik yuz berdi.");
                    }
                }
            };
            xhr.send("productId=" + productId);
        }
    </script>

</head>
<body>
<header class="header">
    <div class="container">
        <div class="logo">
            ONLINE MARKET
        </div>
        <nav class="nav">
            <a href="catalog.jsp" class="btn">Katalog</a>
            <a href="/userProfile">Savat</a>
            <a href="/login">Login</a>
            <a href="/signup">Register</a>
        </nav>
    </div>
</header>

<div class="search-bar">
    <input type="text" placeholder="Mahsulotlar va turkumlar izlash">
</div>

<h1 style="padding-left: 30px">Tavsiyalar</h1>

<section class="products">
    <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/oyoqKiyim.jpg" alt="Product 1">
        <div class="product-info">
            <h3>Yozgi oyoq kiyim</h3>
            <div>
                <div class="price">99,000 UZS</div>
                <button class="btn" onclick="addToCart(1)">Savatchaga qo'shish</button>
            </div>
        </div>
    </div>
   <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/mishka.png" alt="Product 2">
        <div class="product-info">
            <h3>kompyuter uchun mishka</h3>
            <div>
                <div class="price">99,000 UZS</div>
                <button class="btn" onclick="addToCart(1)">Savatchaga qo'shish</button>
            </div>
        </div>
    </div>
   <div class="product-card">
        <img src="${pageContext.request.contextPath}/images/kepka.jpg" alt="Product 3">
        <div class="product-info">
            <h3>Yozgi kepka</h3>
            <div>
                <div class="price">50 000 UZS</div>
                <button class="btn" onclick="addToCart(1)">Savatchaga qo'shish</button>
            </div>
        </div>
    </div>

</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Uzum Market. Barcha huquqlar himoyalangan.</p>
    </div>
</footer>
</body>
</html>
<%--
<%@ page import="uz.pdp.lesson.model.products.Products" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <title>Online Shop - Home</title>
    <script>
        function addToCart(productId) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "${pageContext.request.contextPath}/addToCart", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        alert("Mahsulot savatchaga qo'shildi!");
                    } else if (xhr.status === 401) {
                        alert("Iltimos, tizimga kiring.");
                        window.location.href = "${pageContext.request.contextPath}/login";
                    } else {
                        alert("Mahsulotni savatchaga qo'shishda xatolik yuz berdi.");
                    }
                }
            };
            xhr.send("productId=" + productId);
        }
    </script>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="logo">
            ONLINE MARKET
        </div>
        <nav class="nav">
            <a href="catalog.jsp" class="btn">Katalog</a>
            <a href="/userProfile">Savat</a>
            <a href="/login">Login</a>
            <a href="/signup">Register</a>
        </nav>
    </div>
</header>

<div class="search-bar">
    <input type="text" placeholder="Mahsulotlar va turkumlar izlash">
</div>

<h1 style="padding-left: 30px">Tavsiyalar</h1>

<section class="products">
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
    <p>Hozirda mavjud mahsulotlar yo'q.</p>
    <%
        }
    %>
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Uzum Market. Barcha huquqlar himoyalangan.</p>
    </div>
</footer>
</body>
</html>
--%>