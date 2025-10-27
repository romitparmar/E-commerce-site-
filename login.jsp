<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 400px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }
        h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 25px;
            text-align: center;
        }
        .form-control {
            border-radius: 25px;
            padding: 12px 20px;
        }
        .btn-primary {
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            background: #111;
            border: none;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #333;
        }
        .alert {
            border-radius: 12px;
            text-align: center;
        }
        p.mt-2 a {
            color: #111;
            font-weight: 600;
            text-decoration: none;
        }
        p.mt-2 a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-card">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <% String msg = request.getParameter("msg");
           if(msg != null) { %>
            <div class="alert alert-warning"><%= msg %></div>
        <% } %>
        <button type="submit" class="btn btn-primary w-100">Login</button>
        <p class="mt-2 text-center">Don't have an account? <a href="register.jsp">Register</a></p>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
