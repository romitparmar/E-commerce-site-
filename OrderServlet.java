package servlets;

import utils.DBConnection;
import java.io.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class OrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession();

        // 1️⃣ Get logged-in user
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp?msg=Please login first!");
            return;
        }

        // 2️⃣ Get cart
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("ProductServlet"); // <-- corrected
            return;
        }

        // 3️⃣ Calculate total amount safely
        double totalAmount = 0;
        for (Map<String, Object> item : cart) {
            double price = ((Number) item.get("price")).doubleValue();
            int quantity = ((Number) item.get("quantity")).intValue();
            totalAmount += price * quantity;
        }

        try (Connection conn = DBConnection.getConnection()) {

            // 4️⃣ Insert into orders table
            String orderSql = "INSERT INTO orders(user_id, total_amount, order_date, status) VALUES (?, ?, NOW(), ?)";
            PreparedStatement psOrder = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setDouble(2, totalAmount);
            psOrder.setString(3, "Processing");
            psOrder.executeUpdate();

            ResultSet rs = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) orderId = rs.getInt(1);

            // 5️⃣ Insert each cart item into sales table
            String salesSql = "INSERT INTO sales(user_id, product_id, quantity, price, total, purchased_at, order_id) VALUES (?, ?, ?, ?, ?, NOW(), ?)";
            PreparedStatement psSales = conn.prepareStatement(salesSql);
            for (Map<String, Object> item : cart) {
                psSales.setInt(1, userId);
                psSales.setInt(2, ((Number) item.get("product_id")).intValue());
                psSales.setInt(3, ((Number) item.get("quantity")).intValue());
                psSales.setDouble(4, ((Number) item.get("price")).doubleValue());
                psSales.setDouble(5, ((Number) item.get("price")).doubleValue() * ((Number) item.get("quantity")).intValue());
                psSales.setInt(6, orderId);
                psSales.addBatch();
            }
            psSales.executeBatch();

            // 6️⃣ Clear cart and redirect to tracking page
            session.removeAttribute("cart");
            response.sendRedirect("track_order.jsp?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
