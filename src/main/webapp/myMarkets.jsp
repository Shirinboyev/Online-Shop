<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Markets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myMarkets.css">
</head>
<body>
<div class="container">
    <h2>Your Markets</h2>
    <form action="vendorProfile">
        <button>Go to profile</button>
    </form>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="market-list">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="market-item">
            <form action="${pageContext.request.contextPath}/marketDetails" method="get" style="display: inline-block;">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit" class="market-name-btn"><%= market.getName() %></button>
            </form>
            <form action="${pageContext.request.contextPath}/deleteMarket" method="post" style="display: inline-block;">
                <input type="hidden" name="marketId" value="<%= market.getId() %>">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p>No markets created yet.</p>
    <% } %>
</div>
</body>
</html>
