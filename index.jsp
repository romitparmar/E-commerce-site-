<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cricket Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f5f5f5; }

        /* Navbar Styling */
        .navbar { box-shadow: 0 3px 8px rgba(0,0,0,0.2); }

        /* Hero Section */
        .hero {
            position: relative;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
            margin-bottom: 50px;
        }
        .hero img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(55%);
            transition: transform 1.2s ease;
        }
        .hero:hover img { transform: scale(1.05); }
        .hero-text {
            position: absolute;
            text-align: center;
            color: #fff;
            z-index: 2;
            animation: fadeInUp 1.2s ease forwards;
        }
        .hero-text h1 { font-size: 3.5rem; font-weight: 800; text-shadow: 2px 2px 10px rgba(0,0,0,0.6);}
        .hero-text p { font-size: 1.3rem; margin-top: 15px; text-shadow: 1px 1px 8px rgba(0,0,0,0.5); }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(50px);}
            100% { opacity: 1; transform: translateY(0);}
        }

        /* Categories Section */
        .category-card { 
            transition: transform 0.3s, box-shadow 0.3s; 
            border-radius: 15px;
            background: #fff;
        }
        .category-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .category-card img { 
            height: 200px; 
            object-fit: contain; 
            padding: 15px; 
        }
        .category-card h5 { font-weight: 600; margin-top: 10px; }

        /* Featured Products Section */
        .card { border-radius: 15px; transition: transform 0.3s, box-shadow 0.3s; }
        .card:hover { transform: translateY(-8px); box-shadow: 0 15px 25px rgba(0,0,0,0.2);}
        .card-img-top { height: 220px; object-fit: contain; padding: 15px; }

        footer {
            background: #111; color:#fff; padding:25px 0; text-align:center;
            box-shadow: 0 -3px 10px rgba(0,0,0,0.2); margin-top:50px;
        }

        /* Button Styling */
        .btn-dark { border-radius: 25px; transition: all 0.3s; }
        .btn-dark:hover { background: #333; transform: scale(1.05); }

    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="fas fa-baseball-ball"></i> Cricket Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="ProductServlet">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="CartServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <li class="nav-item"><a class="nav-link" href="blog.jsp">More</a></li>
                <li class="nav-item"><a class="nav-link" href="trackOrder.jsp">Track Order</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <img src="images/images1.jpeg" alt="Cricket Banner">
    <div class="hero-text">
        <h1>Gear Up for Cricket Season</h1>
        <p>Shop the latest cricket bats, balls, gloves & apparel</p>
    </div>
</section>

<!-- Categories Section -->
<div class="container py-5">
    <h2 class="text-center mb-4 fw-bold">Shop by Category</h2>
    <div class="row g-4">
        <%-- Repeatable Category Cards --%>
        <div class="col-md-3">
            <div class="card category-card text-center shadow-sm">
                <img src="images/club_company.webp" class="card-img-top" alt="Ball">
                <h5>Ball</h5>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card category-card text-center shadow-sm">
                <img src="images/sg_BAT_HARDIK_ADDITION.webp" class="card-img-top" alt="Bat">
                <h5>Bat</h5>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card category-card text-center shadow-sm">
                <img src="images/sg_gloves4.webp" class="card-img-top" alt="Gloves">
                <h5>Gloves</h5>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card category-card text-center shadow-sm">
                <img src="images/odi.webp" class="card-img-top" alt="Jersey">
                <h5>Jersey</h5>
            </div>
        </div>
        <%-- Add remaining categories here similarly --%>
    </div>
</div>

<!-- Featured Products Section -->
<div class="container py-5">
    <h2 class="text-center mb-4 fw-bold">Featured Products</h2>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <img src="images/ss7.jpg" class="card-img-top" alt="MRF Bat">
                <div class="card-body text-center">
                    <h5 class="card-title">MRF Cricket Bat</h5>
                    <p class="text-success fw-bold">₹4500</p>
                    <a href="<%= (userId != null) ? "item.jsp?id=1" : "login.jsp" %>" class="btn btn-dark btn-sm">Buy Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <img src="images/DUKES_RED_BALL.webp" class="card-img-top" alt="SG Ball">
                <div class="card-body text-center">
                    <h5 class="card-title">SG Leather Ball</h5>
                    <p class="text-success fw-bold">₹650</p>
                    <a href="<%= (userId != null) ? "item.jsp?id=2" : "login.jsp" %>" class="btn btn-dark btn-sm">Buy Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card shadow-sm h-100">
                <img src="images/sg_pant_edition_glows.webp" class="card-img-top" alt="Nike Gloves">
                <div class="card-body text-center">
                    <h5 class="card-title">Nike Batting Gloves</h5>
                    <p class="text-success fw-bold">₹1200</p>
                    <a href="<%= (userId != null) ? "item.jsp?id=3" : "login.jsp" %>" class="btn btn-dark btn-sm">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Cricket Shop | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
