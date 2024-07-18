<%@ page import="uz.pdp.lesson.model.market.Market" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Markets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
        }
        .container {
            margin-top: 50px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 20px;
            animation: fadeIn 0.5s ease-in-out;
        }
        h2 {
            color: #343a40;
        }
        .market-item {
            transition: transform 0.2s;
            cursor: pointer;
        }
        .market-item:hover {
            transform: scale(1.02);
        }
        .btn-custom {
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            opacity: 0.8;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Your Markets</h2>
    <form action="vendorProfile" class="text-center mb-4">
        <button class="btn btn-success btn-custom"><i class="fas fa-user"></i> Go to Profile</button>
    </form>
    <% if (request.getAttribute("markets") != null) { %>
    <div class="row">
        <% for (Market market : (List<Market>) request.getAttribute("markets")) { %>
        <div class="col-md-4 mb-4">
            <div class="card market-item">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= market.getName() %></h5>
                    <div class="d-flex justify-content-between">
                        <form action="${pageContext.request.contextPath}/marketDetails" method="get">
                            <input type="hidden" name="marketId" value="<%= market.getId() %>">
                            <button type="submit" class="btn btn-primary btn-custom"><i class="fas fa-plus-circle"></i> Add Product</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/deleteMarket" method="post">
                            <input type="hidden" name="marketId" value="<%= market.getId() %>">
                            <button type="submit" class="btn btn-danger btn-custom"><i class="fas fa-trash-alt"></i> Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <% } else { %>
    <p class="text-center">No markets created yet.</p>
    <% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
