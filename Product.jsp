<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="mb-4 text-center">Available Products</h2>

    <div class="row g-4">
        <%
            // Assume servlet sets "productList" as a request attribute containing ResultSet-like data
            List<Map<String, Object>> productList = (List<Map<String, Object>>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
                for (Map<String, Object> product : productList) {
                    String name = (String) product.get("name");
                    Double price = (Double) product.get("price");
                    String image = (String) product.get("image_path");

                    if (image == null || image.trim().isEmpty()) {
                        image = "images/default.webp"; // fallback image
                    }

                    String imagePath = request.getContextPath() + "/" + image;
        %>
            <div class="col-md-3">
                <div class="card shadow-sm h-100">
                    <img src="<%= imagePath %>" class="card-img-top" alt="<%= name %>" style="height:180px; object-fit:contain;">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%= name %></h5>
                        <p class="text-success fw-bold">₹<%= price %></p>
                        <a href="CartServlet?action=add&id=<%= product.get("id") %>" class="btn btn-dark btn-sm">Add to Cart</a>
                    </div>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <p class="text-center">No products available.</p>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
