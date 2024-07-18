<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.lesson.model.user.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminProfile.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/logoutConfirmation.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #eef2f7;
            color: #333;
            position: relative;
        }
        .container {
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .header {
            margin-bottom: 30px;
            text-align: center;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .header h1 {
            font-size: 2.5rem;
            color: #007bff;
        }
        .buttons {
            margin-bottom: 20px;
            text-align: center;
        }
        .buttons .btn {
            margin: 10px;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 30px;
        }
        .list {
            margin-top: 20px;
        }
        .list h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .list ul {
            list-style-type: none;
            padding: 0;
        }
        .list ul li {
            background-color: #f1f3f5;
            margin: 10px 0;
            padding: 15px;
            border-radius: 5px;
            border-left: 5px solid #007bff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: transform 0.3s;
        }
        .list ul li:hover {
            transform: scale(1.02);
        }
        .list ul li .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .list ul li .delete-btn:hover {
            background-color: #c82333;
        }
        #logoutConfirmation {
            text-align: center;
            margin-top: 20px;
        }
        #logoutConfirmation p {
            font-weight: bold;
            font-size: 1.2rem;
        }
        #logoutConfirmation button {
            margin: 5px;
        }
        .logout-button {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
<div class="logout-button">
    <button onclick="showLogoutConfirmation()" class="btn btn-danger">Log Out</button>
</div>
<div class="container animate__animated animate__fadeIn">
    <header class="header">
        <h1>Admin Profile</h1>
    </header>

    <section class="buttons">
        <form action="${pageContext.request.contextPath}/adminProfile" method="get" class="animate__animated animate__fadeInUp">
            <input type="hidden" name="action" value="showUsers">
            <button type="submit" class="btn btn-primary">Show Users</button>
        </form>

        <form action="${pageContext.request.contextPath}/adminProfile" method="get" class="animate__animated animate__fadeInUp">
            <input type="hidden" name="action" value="showVendors">
            <button type="submit" class="btn btn-primary">Show Vendors</button>
        </form>

        <form action="${pageContext.request.contextPath}/adminProfile" method="get" class="animate__animated animate__fadeInUp">
            <input type="hidden" name="action" value="showCustomersMarkets">
            <button type="submit" class="btn btn-primary">Show Customer's Markets</button>
        </form>
    </section>

    <section class="lists">
        <%
            String action = request.getParameter("action");
            if ("showUsers".equals(action)) {
                List<User> users = (List<User>) request.getAttribute("users");
        %>
        <div class="list animate__animated animate__fadeIn">
            <h3>Users List:</h3>
            <ul id="usersList">
                <% for (User user : users) { %>
                <li>
                    <span><%= user.getFullname() %> - <%= user.getEmail() %></span>
                    <button class="delete-btn" onclick="deleteItem(this, '<%= user.getId() %>', 'user')">Delete</button>
                </li>
                <% } %>
            </ul>
        </div>
        <%
        } else if ("showVendors".equals(action)) {
            List<User> customers = (List<User>) request.getAttribute("customers");
        %>
        <div class="list animate__animated animate__fadeIn">
            <h3>Vendor's List:</h3>
            <ul id="vendorsList">
                <% for (User customer : customers) { %>
                <li>
                    <span><%= customer.getFullname() %> - <%= customer.getEmail() %></span>
                    <button class="delete-btn" onclick="deleteItem(this, '<%= customer.getId() %>', 'vendor')">Delete</button>
                </li>
                <% } %>
            </ul>
        </div>
        <%
        } else if ("showCustomersMarkets".equals(action)) {
            List<Market> markets = (List<Market>) request.getAttribute("markets");
        %>
        <div class="list animate__animated animate__fadeIn">
            <h3>Vendor's Markets List:</h3>
            <ul id="marketsList">
                <% for (Market market : markets) { %>
                <li>
                    <span><%= market.getName() %> - Owner ID: <%= market.getOwnerId() %></span>
                </li>
                <% } %>
            </ul>
        </div>
        <%
            }
        %>

        <div id="logoutConfirmation" style="display:none;">
            <p>Are you sure you want to log out?</p>
            <button onclick="confirmLogout()" class="btn btn-danger">Yes</button>
            <button onclick="hideLogoutConfirmation()" class="btn btn-secondary">No</button>
        </div>
    </section>
</div>

<script>
    function deleteItem(button, id, type) {
        if(confirm('Are you sure you want to delete this item?')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/deleteItem',
                type: 'POST',
                data: JSON.stringify({ id: id, type: type }),
                contentType: 'application/json',
                success: function(response) {
                    if(response.success) {
                        const li = button.parentElement;
                        li.parentElement.removeChild(li);
                    } else {
                        const li = button.parentElement;
                        li.parentElement.removeChild(li);
                    }
                },
                error: function() {
                    const li = button.parentElement;
                    li.parentElement.removeChild(li);
                }
            });
        }
    }

    function showLogoutConfirmation() {
        document.getElementById('logoutConfirmation').style.display = 'block';
    }

    function hideLogoutConfirmation() {
        document.getElementById('logoutConfirmation').style.display = 'none';
    }

    function confirmLogout() {
        window.location.href = '${pageContext.request.contextPath}/logout';
    }
</script>
</body>
</html>
