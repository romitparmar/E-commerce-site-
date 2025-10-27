<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Cricket Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f8f9fa;
        }
        .navbar {
            background-color: #111;
            color: #fff;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .navbar h1 { 
            margin: 0; 
            font-size: 24px; 
            display: inline-block;
        }
        .navbar .nav-left {
            display: flex;
            align-items: center;
        }
        .navbar a.home-btn {
            color: #fff;
            text-decoration: none;
            margin-right: 20px;
            font-weight: bold;
            font-size: 16px;
        }
        .navbar input[type="text"] {
            padding: 10px 15px;
            width: 250px;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            padding: 30px;
        }
        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.2);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: contain;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .card h3 { margin: 15px 0 8px 0; font-size: 18px; }
        .card p { color: #28a745; font-weight: bold; font-size: 16px; }
        .btn-buy {
            margin-top: 12px;
            display: inline-block;
            padding: 10px 20px;
            background: #111;
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background 0.3s;
        }
        .btn-buy:hover { background: #444; }
        /* Category dropdown */
        .category-filter {
            text-align: center;
            margin: 20px 0;
        }
        .category-filter select {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="nav-left">
        <a href="index.jsp" class="home-btn">🏠 Home</a>
        <h1>Cricket Store</h1>
    </div>
</div>

<!-- Category Filter -->
<div class="category-filter">
    <form action="ProductServlet" method="get">
        <label for="category">Filter by category: </label>
        <select name="category" id="category" onchange="this.form.submit()">
            <option value="">All Categories</option>
            <option value="bat" <%= "bat".equals(request.getParameter("category")) ? "selected" : "" %>>Bats</option>
            <option value="ball" <%= "ball".equals(request.getParameter("category")) ? "selected" : "" %>>Balls</option>
            <option value="gloves" <%= "gloves".equals(request.getParameter("category")) ? "selected" : "" %>>Gloves</option>
            <option value="pads" <%= "pads".equals(request.getParameter("category")) ? "selected" : "" %>>Pads</option>
            <option value="shoes" <%= "shoes".equals(request.getParameter("category")) ? "selected" : "" %>>Shoes</option>
            <option value="helmet" <%= "helmet".equals(request.getParameter("category")) ? "selected" : "" %>>Helmet</option>
            <option value="helmet" <%= "helmet".equals(request.getParameter("category")) ? "selected" : "" %>>Jercy</option>
        </select>
    </form>
</div>

<!-- Products Grid -->
<div class="container">

    <!-- MANUALLY PLACED PRODUCTS -->
    <div class="card">
        <img src="<%=request.getContextPath()%>/images/ss7.jpg" alt="Cricket Bat">
        <h3>MRF Cricket Bat</h3>
        <p>₹4500</p>
        <a href="item.jsp?id=1" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/DUKES_RED_BALL.webp" alt="Cricket Ball">
        <h3>Kookaburra Ball</h3>
        <p>₹850</p>
        <a href="item.jsp?id=2" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/sg_pant_edition_glows.webp" alt="Gloves">
        <h3>SG Gloves</h3>
        <p>₹1200</p>
        <a href="item.jsp?id=3" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/sg_pad.webp" alt="Pads">
        <h3>Gray-Nicolls Pads</h3>
        <p>₹2500</p>
        <a href="item.jsp?id=4" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/gt.webp" alt="Jercy">
        <h3>Gujrat Titans</h3>
        <p>₹2500</p>
        <a href="item.jsp?id=4" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/dsc.png" alt="Bat">
        <h3>DSC Devid Warner Addition</h3>
        <p>₹2500</p>
        <a href="item.jsp?id=4" class="btn-buy">View Details</a>
    </div>

    <div class="card">
        <img src="<%=request.getContextPath()%>/images/sg_pad.webp" alt="Pads">
        <h3>Gray-Nicolls Pads</h3>
        <p>₹2500</p>
        <a href="item.jsp?id=4" class="btn-buy">View Details</a>
    </div>

    <!-- New Manual Products -->

<div class="card">
    <img src="<%=request.getContextPath()%>/images/dsc.png" alt="DSC Bat">
    <h3>DSC Cricket Bat</h3>
    <p>₹9500</p>
    <a href="item.jsp?id=11" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/knee_guard.webp" alt="Knee Guard">
    <h3>Knee Guard</h3>
    <p>₹850</p>
    <a href="item.jsp?id=12" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/odi.webp" alt="India Jersey">
    <h3>India Jersey</h3>
    <p>₹1200</p>
    <a href="item.jsp?id=13" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/sg5.webp" alt="SG Bat">
    <h3>SG Bat 2</h3>
    <p>₹2500</p>
    <a href="item.jsp?id=14" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/sg10.webp" alt="SG KL Shoes">
    <h3>SG KL Shoes</h3>
    <p>₹3500</p>
    <a href="item.jsp?id=15" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/sg_wicketKeeper_gloves.webp" alt="Wicketkeeper Gloves">
    <h3>SG Wicketkeeper Gloves</h3>
    <p>₹800</p>
    <a href="item.jsp?id=16" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/srh.webp" alt="SRH Jersey">
    <h3>SRH Jersey</h3>
    <p>₹400</p>
    <a href="item.jsp?id=17" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/sg_shoes2.webp" alt="SG Shoes 1">
    <h3>SG Shoes 1</h3>
    <p>₹800</p>
    <a href="item.jsp?id=18" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/sg_shoes5.webp" alt="SG Shoes 2">
    <h3>SG Shoes 2</h3>
    <p>₹800</p>
    <a href="item.jsp?id=19" class="btn-buy">View Details</a>
</div>

<div class="card">
    <img src="<%=request.getContextPath()%>/images/test_team_jercy.webp" alt="Test1">
    <h3>Test Jercy</h3>
    <p>₹340</p>
    <a href="item.jsp?id=20" class="btn-buy">View Details</a>
</div>
    

    <!-- DYNAMIC PRODUCTS FROM DATABASE -->
    <%
        List<Map<String, Object>> products = (List<Map<String, Object>>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Map<String, Object> product : products) {
    %>
    <div class="card">
        <img src="<%= request.getContextPath() + "/" + product.get("image_path") %>" 
             alt="<%= product.get("name") %>">
        <h3><%= product.get("name") %></h3>
        <p>₹<%= product.get("price") %></p>
        <a href="item.jsp?id=<%= product.get("id") %>" class="btn-buy">View Details</a>
    </div>
    <%
            }
        } else if (request.getParameter("category") != null && !request.getParameter("category").isEmpty()) {
    %>
        <p style="text-align:center; margin-top:20px;">No products found in this category.</p>
    <%
        }
    %>

</div>

</body>
</html>
