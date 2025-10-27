<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Success</title>
    <style>
        body { font-family: Arial, sans-serif; text-align:center; background:#f8f9fa; }
        .success-card { max-width:500px; margin:50px auto; padding:20px; background:white; border-radius:10px; box-shadow:0 2px 6px rgba(0,0,0,0.2); }
        a { display:inline-block; margin-top:15px; padding:10px 15px; text-decoration:none; border-radius:5px; }
        .track { background:#007bff; color:white; }
        .shop { background:#28a745; color:white; }
    </style>
</head>
<body>
    <div class="success-card">
        <h2>✅ Payment Successful!</h2>
        <p>Your order has been placed successfully.</p>

        <%
            String orderId = request.getParameter("orderId");
            if(orderId == null || orderId.isEmpty()){
                out.println("<p style='color:red;'>Order ID not found!</p>");
            }
        %>

        <a class="track" href="OrderTracking.jsp?orderId=<%= orderId %>">Track My Order</a>
        <br><br>
        <a class="shop" href="products.jsp">Continue Shopping</a>
    </div>
</body>
</html>
