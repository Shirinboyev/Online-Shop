<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signupPage.css">
    <title>Create an Account</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Quicksand", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #111;
            width: 100%;
            overflow: hidden;
        }

        .ring {
            position: relative;
            width: 700px; /* Increased size */
            height: 700px; /* Increased size */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .ring i {
            position: absolute;
            inset: 0;
            border: 3px solid #fff; /* Increased border size */
            transition: 0.5s;
        }

        .ring i:nth-child(1) {
            border-radius: 38% 62% 63% 37% / 41% 44% 56% 59%;
            animation: animate 6s linear infinite;
        }

        .ring i:nth-child(2) {
            border-radius: 41% 44% 56% 59%/38% 62% 63% 37%;
            animation: animate 4s linear infinite;
        }

        .ring i:nth-child(3) {
            border-radius: 41% 44% 56% 59%/38% 62% 63% 37%;
            animation: animate2 10s linear infinite;
        }

        .ring:hover i {
            border: 8px solid var(--clr); /* Increased hover border size */
            filter: drop-shadow(0 0 30px var(--clr)); /* Increased shadow size */
        }

        @keyframes animate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        @keyframes animate2 {
            0% {
                transform: rotate(360deg);
            }
            100% {
                transform: rotate(0deg);
            }
        }

        .login {
            position: absolute;
            width: 300px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 20px;
        }

        .login h2 {
            font-size: 2em;
            color: #fff;
        }

        .inputBx {
            position: relative;
            width: 100%;
        }

        .inputBx label {
            display: block;
            margin-bottom: 5px;
            color: #fff;
        }

        .inputBx input, .inputBx select {
            position: relative;
            width: 100%;
            padding: 12px 20px;
            background: transparent;
            border: 2px solid #fff;
            border-radius: 40px;
            font-size: 1.2em;
            color: #fff;
            box-shadow: none;
            outline: none;
        }

        .inputBx input[type="submit"] {
            width: 100%;
            background: linear-gradient(45deg, #ff357a, #fff172);
            border: none;
            cursor: pointer;
        }

        .inputBx input::placeholder {
            color: rgba(255, 255, 255, 0.75);
        }

        .links {
            position: relative;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .links a {
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="ring">
    <i style="--clr:#00ff0a;"></i>
    <i style="--clr:#ff0057;"></i>
    <i style="--clr:#fffd44;"></i>
    <div class="login">
        <h2>Create an Account</h2>
        <form action="${pageContext.request.contextPath}/signup" method="post">
            <div class="inputBx">
                <label for="fullname"></label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter fullname" required>
            </div>
            <div class="inputBx">
                <label for="username"></label>
                <input type="text" id="username" name="username" placeholder="Enter username" required>
            </div>
            <div class="inputBx">
                <label for="email"></label>
                <input type="email" id="email" name="email" placeholder="Enter email" required>
            </div>
            <div class="inputBx">
                <label for="age"></label>
                <input type="number" id="age" name="age" placeholder="Enter age" required>
            </div>
            <div class="inputBx">
                <label for="password"></label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>
            </div>
            <div class="inputBx">
                <label for="prePassword"></label>
                <input type="password" id="prePassword" name="prePassword" placeholder="Enter Pre Password" required>
            </div>
            <div class="inputBx">
                <label for="user_type">Choose User Type:</label>
                <select id="user_type" name="UserRole" required>
                    <option value="CUSTOMER">Customer</option>
                    <option value="VENDOR">Vendor</option>
                </select>
            </div>
            <div class="inputBx">
                <input type="submit" value="Create Account">
            </div>
            <div class="links">
                <a href="#">Forget Password</a>
                <a href="${pageContext.request.contextPath}/login.jsp">LogIn</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
