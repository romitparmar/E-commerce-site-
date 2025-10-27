<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #28a745;
        }
        p {
            font-size: 18px;
        }
        .btn-home {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 25px;
            border: none;
            background: #111;
            color: #fff;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-home:hover {
            background: #444;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h2>Payment Successful!</h2>
    <p>Product: <%= request.getParameter("product_name") %></p>
    <p>Amount Paid: ₹<%= request.getParameter("amount") %></p>
    <a href="products.jsp"><button class="btn-home">Back to Store</button></a>
</div>
</body>
</html>
