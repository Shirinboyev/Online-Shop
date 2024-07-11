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
</form>
</body>
</html>
