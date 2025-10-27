package servlets;

import utils.DBConnection;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");  // match your JSP input name
        String pass = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", rs.getString("email"));
                session.setAttribute("userName", rs.getString("username")); // adjust column name

                // ✅ Add this line to store userId in session
                session.setAttribute("userId", rs.getInt("id")); // adjust "id" to your column name

                response.sendRedirect("products.jsp"); // or ProductServlet
            } else {
                response.sendRedirect("login.jsp?msg=Invalid credentials!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?msg=Error!");
        }
    }
}
