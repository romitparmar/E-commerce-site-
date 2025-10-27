package servlets;

import utils.DBConnection;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Available Products</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("</head><body class='bg-light'>");

        out.println("<div class='container py-5'>");
        out.println("<h2 class='mb-4'>Available Products</h2>");

        // --- Category filter form ---
        String selectedCategory = request.getParameter("category");
        out.println("<form method='get' class='mb-4'>");
        out.println("<select name='category' class='form-select w-auto d-inline' onchange='this.form.submit()'>");
        out.println("<option value=''" + (selectedCategory == null ? " selected" : "") + ">All Categories</option>");
        out.println("<option value='bat'" + ("bat".equals(selectedCategory) ? " selected" : "") + ">Bats</option>");
        out.println("<option value='ball'" + ("ball".equals(selectedCategory) ? " selected" : "") + ">Balls</option>");
        out.println("<option value='gloves'" + ("gloves".equals(selectedCategory) ? " selected" : "") + ">Gloves</option>");
        out.println("<option value='pads'" + ("pads".equals(selectedCategory) ? " selected" : "") + ">Pads</option>");
        out.println("<option value='shoes'" + ("shoes".equals(selectedCategory) ? " selected" : "") + ">Shoes</option>");
        out.println("<option value='helmet'" + ("helmet".equals(selectedCategory) ? " selected" : "") + ">Helmet</option>");
        out.println("</select>");
        out.println("</form>");

        out.println("<div class='row g-4'>");

        try (Connection conn = DBConnection.getConnection()) {

            if (conn == null) {
                out.println("<p class='text-danger'>❌ Database connection failed.</p>");
                return;
            }

            // --- Modify query if category is selected ---
            String query = "SELECT * FROM products";
            if (selectedCategory != null && !selectedCategory.isEmpty()) {
                query += " WHERE category = ?";
            }

            try (PreparedStatement ps = conn.prepareStatement(query)) {

                if (selectedCategory != null && !selectedCategory.isEmpty()) {
                    ps.setString(1, selectedCategory);
                }

                try (ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String image = rs.getString("image_path");

                    if (image == null || image.trim().isEmpty()) {
                    image = "default.webp";
                        }

                    String imagePath = request.getContextPath() + "/images/" + image;


                        out.println("<div class='col-md-3'>");
                        out.println("<div class='card h-100 shadow-sm'>");
                        out.println("<img src='" + imagePath + "' class='card-img-top' style='height:180px; object-fit:contain;' alt='" + name + "'>");
                        out.println("<div class='card-body text-center'>");
                        out.println("<h5 class='card-title'>" + name + "</h5>");
                        out.println("<p class='text-success fw-bold'>₹" + price + "</p>");
                        out.println("<a href='" + request.getContextPath() + "/CartServlet?action=add&id=" + id + "' class='btn btn-dark btn-sm'>Add to Cart</a>");
                        out.println("</div></div></div>");
                    }

                }

            }

        } catch (SQLException e) {
            out.println("<p class='text-danger'>❌ SQL Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (Exception e) {
            out.println("<p class='text-danger'>❌ Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        }

        out.println("</div>"); // row
        out.println("</div>"); // container

        out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script>");
        out.println("</body></html>");
    }
}
