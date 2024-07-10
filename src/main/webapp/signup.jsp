<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signupPage.css">
    <title>Create an Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-section {
            display: flex;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            margin-left: 20px;
        }
        .form-container h1 {
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
        }
        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .password-container {
            position: relative;
        }
        .password-container input {
            padding-right: 30px;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .social-login button {
            background-color: #4285F4;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        .social-login button i {
            margin-right: 8px;
        }
        .social-login {
            margin-top: 20px;
        }
        .social-login button:hover {
            background-color: #357ae8;
        }
        p {
            margin-top: 20px;
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
        <a href="/login.jsp">LogIn</a>
    </nav>
</div>

<div class="container">
    <div class="form-section">
        <img src="https://st3.depositphotos.com/13194036/31763/i/450/depositphotos_317633680-stock-photo-cropped-view-woman-holding-toy.jpg" alt="src/main/webapp/images/signUpImage.jpg">
        <div class="form-container">
            <h1>Create an account</h1>
            <form action="/signup" method="post">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter fullname" required>

                <label for="username">Username</label>
                <input type="text" id="username" name="username"  placeholder="Enter username" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter email" required>

                <label for="age">Age</label>
                <input type="number" id="age" name="age"  placeholder="Enter Age" required>

                <label for="password">Password</label>
                <div class="password-container">
                    <input type="password" id="password" name="password"  placeholder="Enter password" required>
                    <i class="far fa-eye toggle-password" title="Show Password"></i>
                </div>

                <label for="prePassword">PrePassword</label>
                <div class="password-container">
                    <input type="password" id="prePassword" name="prePassword" placeholder="Enter PrePassword" required>
                    <i class="far fa-eye toggle-password" title="Show Password"></i>
                </div>

                <label for="user_type">Choose User Type:</label>
                <select id="user_type" name="UserRole" required>
                    <option value="CUSTOMER">Customer</option>
                    <option value="VENDOR">Vendor</option>
                </select><br><br>

                <button type="submit">Create Account</button>
            </form>
            <div class="social-login">
                <button><i class="fab fa-google"></i> Sign up with Google</button>
            </div>
            <p>Already have an account? <a href="/login">Log in</a></p>
            <p style="color: red;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
        </div>
    </div>
</div>
<script>
    document.querySelectorAll('.toggle-password').forEach(item => {
        item.addEventListener('click', function () {
            const passwordField = this.previousElementSibling;
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
            this.setAttribute('title', type === 'password' ? 'Show Password' : 'Hide Password');
        });
    });
</script>
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
