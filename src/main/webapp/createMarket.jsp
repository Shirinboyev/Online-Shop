<!DOCTYPE html>
<html>
<head>
    <title>Create a New Market</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createMarket.css">
</head>
<body>
<h2>Create a New Market</h2>
<form action="${pageContext.request.contextPath}/vendorProfile" method="post">
    <input type="hidden" name="action" value="createMarket">
    <label for="marketName">Market Name:</label>
    <input type="text" id="marketName" name="marketName" required>
    <button type="submit">Create Market</button>
<button class="back-button" onclick="goBack()"> Go Back</button>
<script>
    function goBack() {
        window.location.href = '${pageContext.request.contextPath}/vendorProfile';
    }
</script>
</form>
</body>
</html>
<%--
<!DOCTYPE html>
<html>
<head>
    <title>Create a New Market</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createMarket.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light blue background color */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        button.back-button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        button.back-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<h2>Create a New Market</h2>
<form action="${pageContext.request.contextPath}/vendorProfile" method="post">
    <input type="hidden" name="action" value="createMarket">
    <label for="marketName">Market Name:</label>
    <input type="text" id="marketName" name="marketName" required>
    <button type="submit">Create Market</button>
</form>

<button class="back-button" onclick="goBack()">Orqaga</button>

<script>
    function goBack() {
        window.location.href = '${pageContext.request.contextPath}/vendorProfile';
    }
</script>

</body>
</html>

--%>
