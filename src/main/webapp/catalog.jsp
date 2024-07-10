<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="uz.pdp.lesson.enums.Categories" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/catalog.css">

    <title>Katalog</title>
    <link>
</head>
<body>
<div class="container">
    <h1>Katalog</h1>
    <div class="category-list">
        <%
            for (Categories category : Categories.values()) {
        %>
        <div class="category-card">
            <h3><%= category.getDisplayName() %></h3>
            <p><%= category.getDescription() %></p>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
