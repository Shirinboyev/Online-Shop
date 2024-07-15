<!DOCTYPE html>
<html>
<head>
    <title>Create a New Market</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createMarket.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fafafa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 100%;
            text-align: center;
            color: #333;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            margin-bottom: 10px;
            color: #555;
            font-size: 16px;
            display: block;
            text-align: left;
            width: 100%;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #5b9dd9;
        }

        button {
            background-color: #03a9f4;
            color: #fff;
            border: none;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #039be5;
        }

        .back-button {
            background-color: #e91e63;
            color: #fff;
            margin-top: 10px;
        }

        .back-button:hover {
            background-color: #d81b60;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Create a New Market</h2>
    <form action="${pageContext.request.contextPath}/vendorProfile" method="post">
        <input type="hidden" name="action" value="createMarket">
        <label for="marketName">Market Name:</label>
        <input type="text" id="marketName" name="marketName" required>
        <button type="submit">Create Market</button>
    </form>
</div>

</body>
</html>
