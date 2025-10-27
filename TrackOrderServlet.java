package servlets;

import utils.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class TrackOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.trim().isEmpty()) {
            request.setAttribute("status", "⚠️ Please enter a valid Order ID.");
            request.getRequestDispatcher("trackOrder.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM sales WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(orderId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("orderId", rs.getInt("id"));
                request.setAttribute("userId", rs.getInt("user_id"));
                request.setAttribute("productId", rs.getInt("product_id"));
                request.setAttribute("quantity", rs.getInt("quantity"));
                request.setAttribute("price", rs.getDouble("price"));
                request.setAttribute("total", rs.getDouble("total"));
                request.setAttribute("purchasedAt", rs.getTimestamp("purchased_at"));

                // Example progress logic: adjust if you add a 'status' column in 'sales'
                String status = "Order Placed"; // default
                request.setAttribute("progress", status);

                request.setAttribute("status", "🟢 Order found successfully!");
            } else {
                request.setAttribute("status", "❌ No order found with ID: " + orderId);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "❌ Error: " + e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("trackOrder.jsp");
        rd.forward(request, response);
    }
}
