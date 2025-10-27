<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<%
    String orderIdStr = request.getParameter("orderId");
    if (orderIdStr == null) {
        out.println("<h3>No order ID!</h3>");
        return;
    }
    int orderId = Integer.parseInt(orderIdStr);

    String status = "";
    double total = 0;
    String orderDate = "";

    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM orders WHERE id=?");
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            status = rs.getString("status");
            total = rs.getDouble("total_amount");
            orderDate = rs.getString("order_date");
        } else {
            out.println("<h3>No order found!</h3>");
            return;
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
%>

<h2>Order Tracking</h2>
<p>Order ID: <%= orderId %></p>
<p>Total: ₹<%= total %></p>
<p>Date: <%= orderDate %></p>
<p>Status: <%= status %></p>
