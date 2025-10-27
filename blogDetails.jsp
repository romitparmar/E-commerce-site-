<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String title = "";
    String image = "";
    String content = "";

    switch (id) {
        case "1":
            title = "Top 5 Cricket Bats for 2025";
            image = "images/MRF1.jpg";
            content = "Discover the top-performing cricket bats for 2025 tested by experts from brands like MRF, SG, and Kookaburra. Learn which one matches your style — whether you’re a power hitter or a technical player.";
            break;
        case "2":
            title = "Choosing the Perfect Cricket Ball";
            image = "images/KUKABURA_PINK_BALL.webp";
            content = "Choosing a good cricket ball depends on seam quality, weight, and bounce. This guide compares top models from Kookaburra and SG to help you make the right choice for your pitch.";
            break;
        case "3":
            title = "Essential Gear Every Cricketer Needs";
            image = "images/GRAY_NICOLLS1.webp";
            content = "A complete breakdown of must-have cricket gear — from pads and gloves to the latest protective helmets and shoes. Ideal for both beginners and professionals.";
            break;
        case "4":
            title = "How to Maintain Your Cricket Bat";
            image = "images/sg_BAT_HARDIK_ADDITION.webp";
            content = "Learn how to oil, knock, and store your cricket bat properly. These maintenance tips will help you extend its life and performance season after season.";
            break;
        case "5":
            title = "Fitness Tips for Aspiring Cricketers";
            image = "images/trainning_jercy.jpg";
            content = "Fitness plays a huge role in cricket. This blog covers practical exercises for batting balance, bowling power, and fielding agility.";
            break;
        case "6":
            title = "Helmet Buying Guide: Safety First";
            image = "images/h1.webp";
            content = "Your safety matters. Learn how to choose a cricket helmet that fits perfectly and meets the latest ICC protection standards.";
            break;
        default:
            title = "Blog Not Found";
            image = "images/default.jpg";
            content = "The blog you’re looking for doesn’t exist or has been removed.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= title %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            color: #333;
            background: linear-gradient(135deg, #d4fc79 0%, #96e6a1 100%);
            background-attachment: fixed;
            animation: fadeIn 1.2s ease-in;
        }

        /* Navbar */
        .navbar {
            background: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(8px);
        }

        .navbar-brand {
            font-weight: 700;
        }

        /* Blog Container */
        .blog-container {
            margin: 120px auto;
            max-width: 900px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
            padding: 50px 40px;
            animation: fadeUp 1.2s ease;
        }

        .blog-title {
            text-align: center;
            font-weight: 700;
            color: #111;
            margin-bottom: 25px;
            font-size: 2.2rem;
        }

        .blog-img {
            display: block;
            margin: 0 auto 30px;
            width: 70%;
            max-width: 600px;
            border-radius: 14px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }

        .blog-img:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .blog-content {
            line-height: 1.9;
            font-size: 1.1rem;
            color: #444;
            text-align: justify;
            margin-top: 10px;
        }

        .btn-back {
            display: block;
            margin: 40px auto 0;
            width: 230px;
            border-radius: 30px;
            padding: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background-color: #00b09b;
            border-color: #00b09b;
            color: #fff;
            transform: scale(1.05);
        }

        footer {
            background: #111;
            color: #fff;
            text-align: center;
            padding: 18px 0;
            margin-top: 80px;
            letter-spacing: 0.5px;
            font-size: 15px;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .blog-container {
                padding: 30px;
                margin: 90px 20px;
            }
            .blog-title {
                font-size: 1.8rem;
            }
            .blog-img {
                width: 90%;
            }
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
            </ul>
        </div>
    </div>
</nav>

<!-- Blog Section -->
<div class="container">
    <div class="blog-container">
        <h1 class="blog-title"><%= title %></h1>
        <img src="<%= image %>" alt="<%= title %>" class="blog-img">
        <div class="blog-content">
            <p><%= content %></p>
        </div>
        <a href="blog.jsp" class="btn btn-outline-dark btn-back">← Back to Blogs</a>
    </div>
</div>

<!-- Footer -->
<footer>
    &copy; 2025 Cricket Shop | Designed with 🏏 Passion
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
