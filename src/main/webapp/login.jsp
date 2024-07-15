<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logInPage.css">
    <style>
        .inputBx {
            margin-bottom: 15px;
        }
        .inputBx label {
            display: block;
            margin-bottom: 5px;
        }
        .inputBx input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
<div class="ring">
    <i style="--clr:#00ff0a;"></i>
    <i style="--clr:#ff0057;"></i>
    <i style="--clr:#fffd44;"></i>
    <div class="login">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="inputBx">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="inputBx">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="inputBx">
                <label for="prePassword">Pre Password</label>
                <input type="password" id="prePassword" name="prePassword" placeholder="Pre Password" required>
            </div>
            <div class="inputBx">
                <input type="submit" value="Sign in">
            </div>
            <div class="links">
                <a href="#">Forget Password</a>
                <a href="${pageContext.request.contextPath}/signup.jsp">Signup</a>
            </div>
        </form>
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
</body>
</html>
