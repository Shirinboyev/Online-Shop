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
    <!-- Add other products similarly -->
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Uzum Market. Barcha huquqlar himoyalangan.</p>
    </div>
</footer>
</body>
</html>
