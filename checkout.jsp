<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #131921;
            color: white;
            padding: 15px 30px;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }
        .checkout-card {
            background: #fff;
            width: 700px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 30px;
            display: flex;
            flex-direction: row;
        }
        .product-image {
            width: 250px;
            height: 250px;
            object-fit: contain;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 30px;
        }
        .checkout-details {
            flex: 1;
        }
        .checkout-details h2 {
            margin: 0 0 20px 0;
            font-size: 28px;
            color: #111;
        }
        .checkout-details h3 {
            margin: 10px 0;
            font-size: 22px;
            color: #111;
        }
        .price {
            font-size: 24px;
            color: #B12704;
            font-weight: bold;
            margin: 15px 0;
        }
        .qr-section {
            margin-top: 20px;
            text-align: center;
        }
        .qr-section img {
            width: 180px;
            height: 180px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn-done {
            background-color: #FF9900;
            border: none;
            padding: 12px 30px;
            font-size: 18px;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 15px;
        }
        .btn-done:hover {
            background-color: #e68a00;
        }
        .quantity-input {
            width: 60px;
            padding: 5px;
            font-size: 16px;
            margin-right: 10px;
        }
        .continue-shopping {
            display: inline-block;
            margin-top: 20px;
            color: #007185;
            text-decoration: none;
            font-weight: bold;
        }
        .continue-shopping:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="header">Checkout</div>

<div class="container">
<%
    int userId = 1; // Replace with session user_id if available

    String productIdStr = request.getParameter("product_id");
    String productName = request.getParameter("product_name");
    String amountStr = request.getParameter("amount");
    String quantityStr = request.getParameter("quantity");

    if(productIdStr != null && amountStr != null && quantityStr != null) {
        int productId = Integer.parseInt(productIdStr);
        double price = Double.parseDouble(amountStr);
        int quantity = Integer.parseInt(quantityStr);
        double total = price * quantity;
        Timestamp purchasedAt = new Timestamp(System.currentTimeMillis());

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO sales (user_id, product_id, quantity, price, total, purchased_at) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setDouble(5, total);
            ps.setTimestamp(6, purchasedAt);
            ps.executeUpdate();

            // Reduce stock
            PreparedStatement psUpdate = con.prepareStatement(
                "UPDATE products SET stock = stock - ? WHERE id=?"
            );
            psUpdate.setInt(1, quantity);
            psUpdate.setInt(2, productId);
            psUpdate.executeUpdate();
%>
    <div class="checkout-card">
        <img class="product-image" src="<%=request.getContextPath()%>/images/<%= productName %>.webp" alt="<%= productName %>">
        <div class="checkout-details">
            <h2>Payment Successful!</h2>
            <h3><%= productName %></h3>
            <p class="price">₹<%= total %> for <%= quantity %> item(s)</p>
            <a class="continue-shopping" href="products.jsp">Continue Shopping</a>

            
        </div>
    </div>
<%
        } catch(Exception e) {
%>
    <p style="color:red; text-align:center;">Error: <%= e.getMessage() %></p>
<%
        }
    } else {
        // Normal checkout display
        String id = request.getParameter("id");
        if(id != null && !id.isEmpty()) {
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id=?")) {
                ps.setString(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if(rs.next()) {
%>
    <div class="checkout-card">
        <img class="product-image" src="<%=request.getContextPath()%>/images/<%= rs.getString("image_path") %>" alt="<%= rs.getString("name") %>">
        <div class="checkout-details">
            <h2>Checkout</h2>
            <h3><%= rs.getString("name") %></h3>
            <p class="price">₹<%= rs.getBigDecimal("price") %></p>

            <div class="qr-section">
                <p>Scan this QR code to pay via Paytm/UPI</p>
                <img src="<%=request.getContextPath()%>/images/qr.jpg" alt="QR Code">
            </div>

<form action="checkout.jsp" method="get">
    <input type="hidden" name="product_id" value="<%= rs.getInt("id") %>">
    <input type="hidden" name="product_name" value="<%= rs.getString("name") %>">
    <input type="hidden" name="amount" value="<%= rs.getBigDecimal("price") %>">
    <input type="hidden" name="image_path" value="<%= rs.getString("image_path") %>">
    Quantity: <input type="number" name="quantity" class="quantity-input" value="1" min="1" max="<%= rs.getInt("stock") %>">
    <br>
    <button type="submit" class="btn-done">Process Payment</button>
</form>


        </div>
    </div>
<%
                    } else {
%>
    <p style="text-align:center;">Product not found.</p>
<%
                    }
                }
            } catch(Exception e) {
%>
    <p style="text-align:center; color:red;">Error: <%= e.getMessage() %></p>
<%
            }
        } else {
%>
    <p style="text-align:center;">Invalid product ID.</p>
<%
        }
    }
%>
</div>
</body>
</html>
