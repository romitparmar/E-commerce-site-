<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🏏 Cricket Shop | Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #eafaf1, #f8f9fa);
            color: #333;
            overflow-x: hidden;
        }

        .navbar {
            background: rgba(0,0,0,0.85);
            backdrop-filter: blur(10px);
        }
        .navbar-brand { font-weight: 700; letter-spacing: 1px; }
        .nav-link { color: #f8f9fa !important; font-weight: 500; margin: 0 8px; transition: color 0.3s ease; }
        .nav-link:hover { color: #00b09b !important; }

        .hero {
            position: relative;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            background: #111;
            color: white;
        }
        .hero img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(55%) blur(1px);
            transform: scale(1.05);
        }
        .hero-text {
            position: relative;
            z-index: 2;
            text-align: center;
            animation: fadeInUp 1.5s ease;
        }
        .hero-text h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-shadow: 0 2px 10px rgba(0,0,0,0.4);
        }
        .hero-text p { font-size: 1.1rem; opacity: 0.9; }

        .blog-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: all 0.4s ease;
        }
        .blog-card:hover { transform: translateY(-10px) scale(1.02); box-shadow: 0 10px 35px rgba(0,0,0,0.15); }
        .blog-card img { height: 230px; object-fit: cover; transition: transform 0.4s ease; }
        .blog-card:hover img { transform: scale(1.05); }
        .card-body { padding: 20px; }
        .card-title { font-weight: 600; color: #111; }
        .card-text { color: #555; font-size: 15px; }

        .btn-outline-dark {
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .btn-outline-dark:hover {
            background: #00b09b;
            border-color: #00b09b;
            color: #fff;
        }

        h2.section-title {
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
            color: #111;
            position: relative;
        }
        h2.section-title::after {
            content: '';
            width: 80px;
            height: 3px;
            background: #00b09b;
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        footer {
            background: #111;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin-top: 70px;
            font-size: 15px;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">🏏 Cricket Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductServlet">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="CartServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link active" href="blog.jsp">Blog</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <img src="images/img.jpeg" alt="Cricket Banner">
    <div class="hero-text">
        <h1>Cricket Insights & Tips</h1>
        <p>Your hub for expert reviews, gear advice, and player stories</p>
    </div>
</section>

<!-- Blog Section -->
<div class="container py-5">
    <h2 class="section-title">Latest Blog Posts</h2>
    <div class="row g-4">
        <%
            String[][] blogs = {
                {"1", "Top 5 Cricket Bats for 2025", "Explore our expert picks for the best cricket bats in 2025 — from power hitters to lightweight models.", "images/MRF1.jpg"},
                {"2", "Choosing the Perfect Cricket Ball", "Learn what makes a great cricket ball — seam quality, core material, and durability explained.", "images/KUKABURA_PINK_BALL.webp"},
                {"3", "Essential Gear Every Cricketer Needs", "From pads to gloves, make sure your cricket kit is ready for every practice and match.", "images/GRAY_NICOLLS1.webp"},
                {"4", "How to Maintain Your Cricket Bat", "Keep your bat in perfect shape — learn the best tips for oiling, knocking, and storing your bat.", "images/sg_BAT_HARDIK_ADDITION.webp"},
                {"5", "Fitness Tips for Aspiring Cricketers", "Improve your strength, agility, and stamina — get match-fit with these key training routines.", "images/trainning_jercy.jpg"},
                {"6", "Helmet Buying Guide: Safety First", "Pick the safest cricket helmet — learn how to choose the perfect balance of comfort and protection.", "images/h1.webp"}
            };
            for (String[] blog : blogs) {
        %>
        <div class="col-md-4">
            <div class="card blog-card">
                <img src="<%= blog[3] %>" class="card-img-top" alt="<%= blog[1] %>">
                <div class="card-body">
                    <h5 class="card-title"><%= blog[1] %></h5>
                    <p class="card-text"><%= blog[2] %></p>
                    <a href="blogDetails.jsp?id=<%= blog[0] %>" class="btn btn-outline-dark btn-sm">Read More</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>Cricket Shop | Designed with 🏏 passion for projects</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
