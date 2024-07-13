<%@ page import="uz.pdp.lesson.model.user.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logInPage.css">
    <title>Create an Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


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
        <a href="/signup.jsp">Sign Up</a>
    </nav>
</div>
<div class="container">
    <div class="form-section">
        <img src="https://st3.depositphotos.com/13194036/31763/i/450/depositphotos_317633680-stock-photo-cropped-view-woman-holding-toy.jpg" alt="src/main/webapp/images/signUpImage.jpg">
        <div class="form-container">
            <h1>Log In to Exclusive</h1>
            <form action="/login" method="post">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter email" required>

                <label for="password">Password</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" placeholder="Enter Password" required>
                    <i class="far fa-eye toggle-password" id="togglePassword"></i>
                </div>

                <label for="prePassword">Pre Password</label>
                <div class="password-container">
                    <input type="password" id="prePassword" name="prePassword" placeholder="Enter Prepassword" required>
                    <i class="far fa-eye toggle-password" id="togglePrePassword"></i>
                </div>

                <button type="submit">Sign In</button>
            </form>
            <div class="social-login">
                <button><i class="fab fa-google"></i> Sign up with Google</button>
            </div>
            <p>if you like the account ? <a href="/signup">Sign Up</a></p>
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
