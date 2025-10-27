package servlets;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import utils.DBConnection;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        int userId = 1; // later replace with session user id

        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            addToCart(userId, productId);
        }

        // after action, forward to cart.jsp
        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.forward(request, response);
    }

    private void addToCart(int userId, int productId) {
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) {
                System.out.println("❌ DB Connection failed!");
                return;
            }

            // Check if item already exists
            PreparedStatement check = con.prepareStatement(
                "SELECT quantity FROM cart WHERE user_id=? AND product_id=?"
            );
            check.setInt(1, userId);
            check.setInt(2, productId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // update quantity
                int qty = rs.getInt("quantity");
                PreparedStatement update = con.prepareStatement(
                    "UPDATE cart SET quantity=? WHERE user_id=? AND product_id=?"
                );
                update.setInt(1, qty + 1);
                update.setInt(2, userId);
                update.setInt(3, productId);
                int rows = update.executeUpdate();
                System.out.println("🔄 Updated rows = " + rows);
            } else {
                // insert new row
                PreparedStatement insert = con.prepareStatement(
                    "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)"
                );
                insert.setInt(1, userId);
                insert.setInt(2, productId);
                insert.setInt(3, 1);
                int rows = insert.executeUpdate();
                System.out.println("✅ Inserted rows = " + rows);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
