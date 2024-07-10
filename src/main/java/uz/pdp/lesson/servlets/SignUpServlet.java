package uz.pdp.lesson.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.lesson.enums.UserRole;
import uz.pdp.lesson.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignUp", urlPatterns = "/signup")
public class SignUpServlet extends HttpServlet {
    UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String prePassword = req.getParameter("prePassword");
        int age = Integer.parseInt(req.getParameter("age"));
        UserRole userRole = UserRole.valueOf(req.getParameter("UserRole"));
        String result = userService.signup(fullname, username, email, password, prePassword, age, userRole);
        PrintWriter writer = resp.getWriter();

        if ("User added".equals(result)) {
            req.setAttribute("message", "User added");
            req.getRequestDispatcher("success.jsp").forward(req, resp);
        } else {
            writer.println("""
                        <html>
                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Sign Up Error</title>
                            <style>
                                body {
                                    display: flex;
                                    justify-content: center;
                                    align-items: center;
                                    height: 100vh;
                                    background-color: #f0f2f5;
                                    font-family: Arial, sans-serif;
                                }
                                .message-box {
                                    background: #fff;
                                    padding: 20px;
                                    border-radius: 8px;
                                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                                    text-align: center;
                                    width: 300px;
                                }
                                .error {
                                    color: red;
                                    font-weight: bold;
                                }
                            </style>
                        </head>
                        <body>
                            <div class="message-box">
                                <p class="error">User already exist</p>
                            </div>
                        </body>
                        </html>
                    """);
        }
        resp.setHeader("Refresh", "1.5; URL=/");
    }
}
