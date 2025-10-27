<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<html>
<head>
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f8f9fa;
        }

        .navbar {
            background: #111;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .product-container {
            display: flex;
            gap: 40px;
            margin: 40px auto;
            padding: 20px;
            max-width: 1000px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .product-container img {
            width: 400px;
            height: 400px;
            object-fit: contain;
            border-radius: 10px;
        }

        .details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .details h2 {
            margin: 0 0 10px 0;
            font-size: 26px;
        }

        .details p {
            margin: 8px 0;
            font-size: 16px;
            color: #555;
        }

        .price {
            font-size: 22px;
            color: #28a745;
            font-weight: bold;
            margin: 15px 0;
        }

        .btn-buy {
            display: inline-block;
            padding: 12px 25px;
            background: #111;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-size: 16px;
            transition: background 0.3s;
        }

        .btn-buy:hover {
            background: #444;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>Cricket Store</h1>
    <a href="products.jsp" style="color:#fff; text-decoration:none;">⬅ Back to Store</a>
</div>

<%
    String id = request.getParameter("id");
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
%>
    <div class="product-container">
        <!-- FIXED image path to point inside /images folder -->
        <img src="<%=request.getContextPath()%>/images/<%= rs.getString("image_path") %>" alt="<%= rs.getString("name") %>">

        <div class="details">
    <h2><%= rs.getString("name") %></h2>
    <p>Category: <%= rs.getString("category") %></p>
    <div class="price">₹<%= rs.getBigDecimal("price") %></div>
    <p>Stock: <%= rs.getInt("stock") %> available</p>

    <form action="cart.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        <input type="hidden" name="name" value="<%= rs.getString("name") %>">
        <input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
        <input type="hidden" name="quantity" value="1">
        <button type="submit" class="btn-buy">Add to Cart</button>
    </form>
</div>

    </div>
<%
    } else {
%>
    <p style="padding:20px; text-align:center;">Product not found.</p>
<%
    }
    rs.close();
    ps.close();
    con.close();
%>

</body>
</html>
