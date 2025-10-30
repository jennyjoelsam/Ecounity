<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoUnity</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f0f8f4; /* Light greenish background */
            overflow-x: hidden; /* Prevent horizontal scroll */
        }
        header {
            background: transparent;
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }
        .logo {
            color: #fff; /* White color for EcoUnity text */
            font-size: 32px; /* Increased size */
            font-weight: 900;
            display: flex;
            align-items: center;
        }
        .logo img {
            height: 40px;
            margin-right: 10px;
            background-color: transparent;
        }
        nav {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            flex-grow: 1;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
        }
        nav ul li {
            margin-left: 20px;
            position: relative;
        }
        nav ul li a {
            color: #fff; /* White color for nav items */
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 8px;
            transition: color 0.3s ease;
            font-family: 'Poppins', sans-serif;
        }
        nav ul li a:hover {
            color: #d3d3d3; /* Lighter gray on hover */
        }
        .dropdown {
            position: absolute;
            top: 100%;
            left: 0;
            background: rgba(255, 255, 255, 0.9);
            display: none;
            flex-direction: column;
            min-width: 150px;
            border-radius: 5px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        nav ul li:hover .dropdown {
            display: flex;
        }
        .dropdown a {
            padding: 10px;
            color: #333;
            white-space: nowrap;
        }
        .dropdown a:hover {
            background: #2a7d50; /* Green hover */
            color: #fff;
        }
        .hero {
            background: url('bg.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;

        }
        .content {
            position: relative;
            z-index: 1;
        }
        .content h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .content h1 {
            font-size: 56px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #2a7d50; /* Green button */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background: #1c5d36; /* Darker green on hover */
        }

        /* New Styles for Dropdown SVG Icon */
        .dropdown-icon {
            width: 12px;
            height: 12px;
            margin-left: 5px;
        }

        /* New Sections Below Hero */
        .about-section {
            background-color: #fff;
            padding: 60px 50px;
            text-align: center;
        }
        .about-section h2 {
            font-size: 32px;
            margin-bottom: 30px;
            color: #2a7d50; /* Green color */
        }
        .cards-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
        }
        .card {
            background-color: #f9f9f9;
            width: 280px;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .card h3 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2a7d50; /* Green header */
        }
        .card p {
            font-size: 16px;
            margin-bottom: 15px;
        }
        .card .btn {
            background: #2a7d50;
            font-size: 16px;
        }
        .card .btn:hover {
            background: #1c5d36;
        }

        /* Scrollable section */
        .scroll-section {
            padding: 60px 50px;
            background-color: #f0f8f4;
            text-align: center;
        }
        .scroll-section h2 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #2a7d50; /* Green text */
        }

        /* New Style for Scrolling Navbar */
        .scrolled {
            background-color: #1c5d36; /* Dark green when scrolled */
        }
    </style>
</head>
<body>
    <header id="navbar">
        <div class="logo">
            <img src="logo.avif" alt="EcoUnity Logo">
            ECOUNITY
        </div>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Events</a></li>
                <li><a href="#">Ecoguide</a></li>
                <li><a href="#">Ecohub</a></li>
                <li><a href="#">My Profile</a></li>
                <li>
                    <a href="#">More <svg class="dropdown-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"></path></svg></a>
                    <div class="dropdown">
                        <a href="#">About Us</a>
                        <a href="#">Eco-Store</a>
                    </div>
                </li>
            </ul>
        </nav>
    </header>
    <section class="hero">
        <div class="overlay"></div>
        <div class="content">
            <h2>Building a Greener Future Together</h2>
            <h1>ECOUNITY</h1>
            <a href="#" class="btn">LEARN MORE</a>
        </div>
    </section>

    <!-- About Section -->
    <section class="about-section">
        <h2>Our Mission</h2>
        <p>EcoUnity is dedicated to building a greener and more sustainable future by promoting eco-friendly products and practices.</p>

        <!-- Cards for Eco-friendly initiatives -->
        <div class="cards-container">
            <div class="card">
                <h3>Eco-Friendly Products</h3>
                <p>Explore our range of eco-conscious products designed to reduce waste and promote sustainability.</p>
                <a href="#" class="btn">Discover More</a>
            </div>
            <div class="card">
                <h3>Events & Campaigns</h3>
                <p>Join us in our mission by participating in events and campaigns that support a greener planet.</p>
                <a href="#" class="btn">Get Involved</a>
            </div>
            <div class="card">
                <h3>Learn & Grow</h3>
                <p>Stay informed with our educational resources about sustainability, eco-living, and green innovations.</p>
                <a href="#" class="btn">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Scrollable Section (Optional) -->
    <section class="scroll-section">
        <h2>Join the Movement</h2>
        <p>We believe in the power of community. Join EcoUnity today to be part of the solution for a greener tomorrow.</p>
        <a href="#" class="btn">Sign Up Now</a>
    </section>

    <script>
        window.addEventListener("scroll", function () {
            const navbar = document.getElementById("navbar");
            if (window.scrollY > 50) {
                navbar.classList.add("scrolled");
            } else {
                navbar.classList.remove("scrolled");
            }
        });
    </script>
</body>
</html>
