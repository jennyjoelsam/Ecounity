<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Unity</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #e0f7e9, #cce5cc);
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: background 0.5s ease;
        }
        .dark-mode {
            background: linear-gradient(to right, #2d2d2d, #1a1a1a);
            color: white;
        }
        header {
            background: linear-gradient(to right, #2d6a4f, #1b4332);
            padding: 15px 0;
            text-align: center;
            color: white;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            max-width: 1200px;
            margin: auto;
        }
        nav h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }
        #search-bar {
            padding: 10px;
            width: 300px;
            border-radius: 20px;
            border: none;
            outline: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .dark-mode #search-bar {
            background: #444;
            color: white;
        }
        ul {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 20px;
        }
        ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s;
        }
        ul li a:hover {
            color: #b7e4c7;
        }
        .container {
            display: flex;
            max-width: 1200px;
            margin-top: 100px;
            width: 100%;
            gap: 20px;
        }
        .sidebar {
            width: 280px;
            background: linear-gradient(to bottom, #d8f3dc, #b7e4c7);
            padding: 20px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            font-size: 14px;
            color: #2d6a4f;
            max-height: 250px;
        }
        .sidebar h2 {
            font-size: 20px;
            color: #1b4332;
            text-align: center;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            flex-grow: 1;
            padding: 20px;
        }
        .product {
            background: white;
            padding: 15px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .product:hover {
            transform: translateY(-5px);
        }
        .product img {
            width: 80%;
            max-width: 140px;
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .product img:hover {
            transform: scale(1.1);
        }
        .product h2 {
            font-size: 18px;
            margin: 10px 0;
        }
        .product p {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }
        .add-to-cart, .buy-now {
            background: linear-gradient(to right, #2d6a4f, #1b4332);
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 20px;
            width: 100%;
            margin-top: 5px;
            transition: background 0.3s;
        }
        .add-to-cart:hover, .buy-now:hover {
            background: #1b4d3e;
        }
        .toggle-theme {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            background: #1b4332;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <h1>Eco-Shop</h1>
            <input type="text" placeholder="Search products..." id="search-bar">
            <button class="toggle-theme" onclick="toggleTheme()">Toggle Dark Mode</button>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>
    <script>
        function toggleTheme() {
            document.body.classList.toggle("dark-mode");
        }
    </script>
    <div class="container">
        <aside class="sidebar">
            <h2>Why Choose Eco-Friendly Products?</h2>
            <p>Eco-friendly products help reduce pollution and promote sustainability.</p>
            <ul>
                <li>Reduces waste</li>
                <li>Safer for the environment</li>
                <li>Encourages sustainability</li>
            </ul>
        </aside>
        <main>
            <section class="product-grid">
                <div class="product">
                    <img src="images/jutebag.jpg" alt="Jute Bag">
                    <h2>Jute Bag</h2>
                    <p>Reusable and biodegradable jute bag.</p>
                    <button class="add-to-cart">Add to Cart</button>
                    <button class="buy-now">Buy Now</button>
                </div>
                <div class="product">
                    <img src="images/paperbag.jpeg" alt="Paper Bag">
                    <h2>Paper Bag</h2>
                    <p>Eco-friendly paper bag made from recycled materials.</p>
                    <button class="add-to-cart">Add to Cart</button>
                    <button class="buy-now">Buy Now</button>
                </div>
                <div class="product">
                    <img src="images/bamboobottle.jpeg" alt="Bamboo Bottle">
                    <h2>Bamboo Bottle</h2>
                    <p>Sustainable bamboo water bottle, BPA-free.</p>
                    <button class="add-to-cart">Add to Cart</button>
                    <button class="buy-now">Buy Now</button>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
