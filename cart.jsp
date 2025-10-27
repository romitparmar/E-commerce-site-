<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .home-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: #111;
            color: #fff;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
        }

        .home-btn:hover {
            background: #444;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px 20px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background: #111;
            color: #fff;
            font-size: 16px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button {
            padding: 8px 15px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .btn-remove {
            background: #dc3545;
            color: #fff;
            margin-right: 5px;
        }

        .btn-remove:hover {
            background: #c82333;
        }

        .btn-buy {
            background: #28a745;
            color: #fff;
        }

        .btn-buy:hover {
            background: #218838;
        }

        .grand-total {
            font-weight: bold;
            font-size: 18px;
            background: #f1f1f1;
        }
    </style>
</head>
<body>

<!-- Home Button -->
<a href="index.jsp" class="home-btn">🏠 Home</a>

<h2>My Cart</h2>

<table>
    <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total</th>
        <th>Action</th>
    </tr>
<%
    int userId = 1; // replace with session later
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT c.product_id, p.name, p.price, c.quantity " +
        "FROM cart c JOIN products p ON c.product_id = p.id " +
        "WHERE c.user_id=?"
    );
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
    double grandTotal = 0;
    while (rs.next()) {
        int productId = rs.getInt("product_id");
        double price = rs.getDouble("price");
        int qty = rs.getInt("quantity");
        double total = price * qty;
        grandTotal += total;
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= qty %></td>
        <td>₹<%= price %></td>
        <td>₹<%= total %></td>
        <td>
            <form action="removeFromCart" method="post" style="display:inline-block;">
                <input type="hidden" name="product_id" value="<%= productId %>">
                <button type="submit" class="btn-remove">Remove</button>
            </form>
            <form action="checkout.jsp" method="get" style="display:inline-block;">
                <input type="hidden" name="id" value="<%= productId %>">
                <button type="submit" class="btn-buy">Buy Now</button>
            </form>
        </td>
    </tr>
<%
    }
%>
<tr class="grand-total">
    <td colspan="3">Grand Total</td>
    <td>₹<%= grandTotal %></td>
    <td></td>
</tr>
</table>

</body>
</html>
