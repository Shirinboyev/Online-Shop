<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create an Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 10px 20px;
            border-bottom: 1px solid #ddd;
        }

        .header a {
            text-decoration: none;
            color: #333;
            margin: 0 10px;
        }

        .form-section {
            display: flex;
            justify-content: space-between;
            padding: 50px 0;
        }

        .form-section img {
            max-width: 50%;
            border-radius: 8px;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }

        .form-container h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #ff5a5f;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #e04e4e;
        }

        .form-container .social-login {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .form-container .social-login button {
            width: auto;
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            color: #333;
            font-size: 14px;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .form-container .social-login button i {
            margin-right: 10px;
        }

        .form-container .social-login button:hover {
            background-color: #f2f2f2;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
        }

        .footer .container {
            display: flex;
            justify-content: space-between;
        }

        .footer .column {
            flex: 1;
            padding: 0 20px;
        }

        .footer .column h4 {
            margin-bottom: 15px;
        }

        .footer .column p, .footer .column a {
            color: white;
            margin-bottom: 10px;
            text-decoration: none;
            display: block;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="logo">
        <a href="#">Exclusive</a>
    </div>
    <nav>
        <a href="/">Home</a>
        <a href="#">Contact</a>
        <a href="#">About</a>
        <a href="/register.jsp">Sign Up</a>
    </nav>
</div>

<div class="container">
    <div class="form-section">
        <img src="https://st3.depositphotos.com/13194036/31763/i/450/depositphotos_317633680-stock-photo-cropped-view-woman-holding-toy.jpg" alt="src/main/webapp/images/signUpImage.jpg">
        <div class="form-container">
            <h1>Log In to Exclusive</h1>
            <form action="//login" method="post">

                <label for="email">Email or Phone Number</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">SignIn</button>
            </form>
            <div class="social-login">
                <button><i class="fab fa-google"></i> Sign up with Google</button>
            </div>
            <p>if you like the account ? <a href="/register">Sign Up</a></p>
        </div>
    </div>
</div>

<div class="footer">
    <div class="container">
        <div class="column">
            <h4>Exclusive</h4>
            <p>Subscribe</p>
            <p>Get 10% off your first order</p>
        </div>
        <div class="column">
            <h4>Support</h4>
            <p>Help center</p>
            <p>Contact us</p>
        </div>
        <div class="column">
            <h4>Account</h4>
            <p>My Account</p>
            <p>Login / Register</p>
            <p>Order Status</p>
        </div>
        <div class="column">
            <h4>Quick Link</h4>
            <p>Privacy Policy</p>
            <p>Terms of Use</p>
            <p>FAQ</p>
        </div>
        <div class="column">
            <h4>Download App</h4>
            <p>Get it on Google Play</p>
            <p>Download on the App Store</p>
        </div>
    </div>
</div>

</body>
</html>
