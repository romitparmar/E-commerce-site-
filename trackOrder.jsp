<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Track Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #a8edea, #fed6e3);
            font-family: 'Poppins', sans-serif;
            padding-top: 80px;
        }
        .track-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: auto;
        }
        .status {
            font-weight: 600;
            margin-top: 20px;
        }
        .table {
            margin-top: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        .progress-bar-custom {
            font-weight: 600;
            text-align: center;
        }
        footer {
            background: #111;
            color: #fff;
            text-align: center;
            padding: 15px;
            margin-top: 60px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">🏏 Cricket Shop</a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="ProductServlet">Products</a></li>
            <li class="nav-item"><a class="nav-link" href="CartServlet">Cart</a></li>
            <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
            <li class="nav-item"><a class="nav-link active" href="trackOrder.jsp">Track Order</a></li>
        </ul>
    </div>
</nav>

<div class="track-box">
    <h2 class="text-center mb-4">🔍 Track Your Order</h2>

    <!-- Form -->
    <form action="TrackOrderServlet" method="post">
        <input type="text" name="orderId" class="form-control" placeholder="Enter Order ID" required>
        <button type="submit" class="btn btn-dark w-100 mt-3">Track</button>
    </form>

    <!-- Status Message -->
    <%
        String status = (String) request.getAttribute("status");
        if (status != null) {
    %>
        <div class="status alert alert-info text-center"><%= status %></div>
    <%
        }
    %>

    <!-- Order Details Table -->
    <%
        if (request.getAttribute("orderId") != null) {
    %>
        <table class="table table-bordered mt-4">
            <tr><th>Order ID</th><td><%= request.getAttribute("orderId") %></td></tr>
            <tr><th>User ID</th><td><%= request.getAttribute("userId") %></td></tr>
            <tr><th>Product ID</th><td><%= request.getAttribute("productId") %></td></tr>
            <tr><th>Quantity</th><td><%= request.getAttribute("quantity") %></td></tr>
            <tr><th>Price</th><td>₹<%= request.getAttribute("price") %></td></tr>
            <tr><th>Total</th><td>₹<%= request.getAttribute("total") %></td></tr>
            <tr><th>Purchased At</th><td><%= request.getAttribute("purchasedAt") %></td></tr>
        </table>

        <!-- Progress Bar -->
        <%
            String progress = (String) request.getAttribute("progress"); // Make sure your servlet sets "progress"
            String progressClass = "";
            String progressWidth = "0%";

            if (progress != null && !"N/A".equals(progress)) {
                switch(progress) {
                    case "Order Placed":
                        progressClass = "bg-primary";
                        progressWidth = "25%";
                        break;
                    case "Processing":
                        progressClass = "bg-info";
                        progressWidth = "50%";
                        break;
                    case "Shipped":
                        progressClass = "bg-warning";
                        progressWidth = "75%";
                        break;
                    case "Delivered":
                        progressClass = "bg-success";
                        progressWidth = "100%";
                        break;
                }
        %>
            <div class="progress mt-4" style="height: 30px; border-radius: 20px;">
                <div class="progress-bar progress-bar-custom <%= progressClass %>"
                     role="progressbar"
                     style="width: <%= progressWidth %>;">
                     <%= progress %>
                </div>
            </div>
        <%
            }
        %>
    <%
        } // end if orderId
    %>
</div>

<footer>
    &copy; 2025 Cricket Shop | Order Tracking System
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
