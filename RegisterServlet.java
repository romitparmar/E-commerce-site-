package servlets;

import utils.*;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username"); // match your register.jsp input
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try  {
            Connection con = DBConnection.getConnection();
            // Check if email or username already exists
            PreparedStatement checkStmt = con.prepareStatement(
                "SELECT * FROM users WHERE email=? OR username=?");
            checkStmt.setString(1, email);
            checkStmt.setString(2, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // User already exists
                response.sendRedirect("register.jsp?msg=User already exists!");
                return;
            }

            // Insert new user
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username, email, password, role) VALUES(?, ?, ?, 'user')");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password); // Optional: Hash password for security

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("login.jsp?msg=Registration successful! Login now.");
            } else {
                response.sendRedirect("register.jsp?msg=Registration failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=Error occurred!");
        }
    }
}
