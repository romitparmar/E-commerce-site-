package servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import utils.DBConnection;

public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("product_id"));
        int userId = 1; // replace with session user_id if you have login system

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM cart WHERE user_id=? AND product_id=?"
            );
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();

            // Redirect back to cart page
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
