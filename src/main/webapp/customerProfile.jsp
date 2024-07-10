<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerProfile.css">
</head>
<body>
<h1>Welcome to Your Profile</h1>

<h2>Create a New Market</h2>
<form action="/customerProfile" method="post">
    <label for="marketName">Market Name: </label>
    <input type="text" id="marketName" name="marketName"  required>
    <button type="submit">Create Market</button>
</form>

<% if (request.getAttribute("result") != null) { %>
<p><%= request.getAttribute("result") %></p>
<% } %>
</body>
</html>
