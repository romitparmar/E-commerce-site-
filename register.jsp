<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | SportsHub</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #00b09b, #96c93d);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            color: #fff;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-control {
            border-radius: 10px;
            border: none;
            padding: 12px;
            font-size: 15px;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(255,255,255,0.6);
            outline: none;
        }

        .btn-success {
            border-radius: 25px;
            font-weight: 600;
            background: #00b09b;
            border: none;
            transition: 0.3s ease;
            letter-spacing: 1px;
        }

        .btn-success:hover {
            background: #0c9e82;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .alert {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: #fff;
            text-align: center;
            border-radius: 10px;
        }

        p.mt-2 a {
            text-decoration: none;
            font-weight: 600;
            color: #fff;
            transition: color 0.2s;
        }

        p.mt-2 a:hover {
            color: #d4f4e6;
            text-decoration: underline;
        }

        /* floating animation for background glow */
        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            animation: float 6s infinite ease-in-out;
        }

        .circle:nth-child(1) {
            width: 150px; height: 150px;
            top: 10%; left: 15%;
            animation-delay: 0s;
        }

        .circle:nth-child(2) {
            width: 100px; height: 100px;
            bottom: 20%; right: 20%;
            animation-delay: 3s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(20px); }
        }
    </style>
</head>

<body>
    <!-- Decorative floating elements -->
    <div class="circle"></div>
    <div class="circle"></div>

    <div class="glass-card">
        <h2>Create Account</h2>

        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter email" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>

            <% String msg = request.getParameter("msg");
               if(msg != null) { %>
                <div class="alert"><%= msg %></div>
            <% } %>

            <button type="submit" class="btn btn-success w-100 mt-3">Register</button>

            <p class="mt-3 text-center">Already have an account? 
                <a href="login.jsp">Login</a>
            </p>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
