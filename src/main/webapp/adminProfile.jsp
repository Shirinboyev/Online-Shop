<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminProfile.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Admin Profile</h1>
    </header>

    <section class="buttons">
        <form action="${pageContext.request.contextPath}/adminProfile" method="get">
            <input type="hidden" name="action" value="showUsers">
            <button type="submit" class="btn">Show Users</button>
        </form>

        <form action="${pageContext.request.contextPath}/adminProfile" method="get">
            <input type="hidden" name="action" value="showCustomers">
            <button type="submit" class="btn">Show Customers</button>
        </form>

        <form action="${pageContext.request.contextPath}/adminProfile" method="get">
            <input type="hidden" name="action" value="showCustomersMarkets">
            <button type="submit" class="btn">Show Customer's Markets</button>
        </form>
    </section>

    <section class="lists">
        <%
            String action = request.getParameter("action");
            if ("showUsers".equals(action)) {
                List<User> users = (List<User>) request.getAttribute("users");
        %>
        <div class="list">
            <h3>Users List:</h3>
            <ul>
                <% for (User user : users) { %>
                <li><%= user.getFullname() %> - <%= user.getEmail() %></li>
                <% } %>
            </ul>
        </div>
        <%
        } else if ("showCustomers".equals(action)) {
            List<User> customers = (List<User>) request.getAttribute("customers");
        %>
        <div class="list">
            <h3>Customers List:</h3>
            <ul>
                <% for (User customer : customers) { %>
                <li><%= customer.getFullname() %> - <%= customer.getEmail() %></li>
                <% } %>
            </ul>
        </div>
        <%
        } else if ("showCustomersMarkets".equals(action)) {
            List<Market> markets = (List<Market>) request.getAttribute("markets");
        %>
        <div class="list">
            <h3>Customer's Markets List:</h3>
            <ul>
                <% for (Market market : markets) { %>
                <li><%= market.getName() %> - Owner ID: <%= market.getOwnerId() %></li>
                <% } %>
            </ul>
        </div>
        <%
            }
        %>
    </section>
</div>
</body>
</html>
