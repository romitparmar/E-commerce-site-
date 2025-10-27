package servlets;

import utils.DBConnection;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CancelOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE orders SET status='Cancelled' WHERE id=?");
            ps.setInt(1, orderId);
            ps.executeUpdate();

            response.getWriter().println("<h3>Order Cancelled Successfully!</h3><a href='products.jsp'>Go Back</a>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
