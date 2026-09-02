<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NexusShop — Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #f8fafc;
            --primary: #0b1a33;
            --accent: #2a7de1;
            --accent-light: #e6f0ff;
            --muted: #5e6f8d;
            --card: #ffffff;
            --surface: #f1f5f9;
            --success: #22a65e;
            --danger: #e53e3e;
            --radius: 16px;
            --shadow: 0 12px 30px rgba(0, 20, 50, 0.06);
            --transition: all 0.25s cubic-bezier(0.2, 0, 0, 1);
            --container: 1280px;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background: var(--bg);
            color: var(--primary);
            line-height: 1.5;
            padding: 0;
            margin: 0;
        }

        .container {
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* ----- header ----- */
        header {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.03);
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.02);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 10px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 8px;
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
            font-size: 22px;
            letter-spacing: -0.3px;
        }
        .brand .accent {
            color: var(--accent);
        }

        .main-nav ul {
            display: flex;
            gap: 6px;
            list-style: none;
            align-items: center;
        }
        .main-nav li a {
            padding: 8px 14px;
            border-radius: 40px;
            font-weight: 500;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            color: var(--primary);
            transition: var(--transition);
        }
        .main-nav li a:hover,
        .main-nav li a.active {
            background: var(--accent-light);
            color: var(--accent);
        }

        .search-wrapper {
            display: flex;
            align-items: center;
            background: var(--surface);
            border-radius: 40px;
            padding: 4px 4px 4px 18px;
            min-width: 240px;
            transition: var(--transition);
            border: 1px solid transparent;
        }
        .search-wrapper:focus-within {
            border-color: var(--accent);
            background: white;
            box-shadow: 0 0 0 4px rgba(42, 125, 225, 0.08);
        }
        .search-wrapper input {
            border: 0;
            background: transparent;
            outline: none;
            width: 100%;
            font-size: 14px;
            padding: 10px 0;
            color: var(--primary);
        }
        .search-wrapper input::placeholder {
            color: var(--muted);
        }
        .search-wrapper button {
            background: var(--accent);
            border: 0;
            color: white;
            padding: 10px 16px;
            border-radius: 40px;
            font-size: 14px;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .search-wrapper button:hover {
            background: #1a5fc7;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .icon-btn {
            background: transparent;
            border: 0;
            font-size: 18px;
            color: var(--primary);
            cursor: pointer;
            width: 44px;
            height: 44px;
            border-radius: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }
        .icon-btn:hover {
            background: var(--surface);
            color: var(--accent);
        }

        .cart {
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 12px 6px 6px;
            border-radius: 40px;
            background: var(--surface);
            transition: var(--transition);
            font-weight: 500;
        }
        .cart:hover {
            background: var(--accent-light);
        }
        .cart .cart-count {
            background: var(--accent);
            color: white;
            font-size: 11px;
            font-weight: 700;
            min-width: 22px;
            height: 22px;
            border-radius: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 6px;
        }

        .mobile-toggle {
            display: none;
            background: transparent;
            border: 0;
            font-size: 22px;
            cursor: pointer;
            padding: 6px;
        }

        #mobileMenu {
            display: none;
            background: white;
            border-top: 1px solid rgba(0, 0, 0, 0.03);
            padding: 8px 0;
        }
        #mobileMenu ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        #mobileMenu ul a {
            display: block;
            padding: 12px 16px;
            border-radius: 12px;
            font-weight: 500;
            transition: var(--transition);
        }
        #mobileMenu ul a:hover {
            background: var(--surface);
        }

        /* ----- hero ----- */
        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: linear-gradient(145deg, #0b1a33 0%, #1a2f55 100%);
            color: white;
            padding: 72px 20px;
            border-radius: var(--radius);
            margin: 28px auto 0;
            position: relative;
            overflow: hidden;
        }
        .hero::after {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(42, 125, 225, 0.15), transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }
        .hero h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 44px;
            margin-bottom: 16px;
            letter-spacing: -0.02em;
        }
        .hero p {
            max-width: 640px;
            margin: 0 auto 28px;
            opacity: 0.8;
        }
        .hero .btn-group {
            display: flex;
            gap: 12px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 28px;
            border-radius: 40px;
            font-weight: 600;
            border: 0;
            cursor: pointer;
            transition: var(--transition);
            font-size: 15px;
        }
        .btn-primary {
            background: var(--accent);
            color: white;
        }
        .btn-primary:hover {
            background: #1a5fc7;
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(42, 125, 225, 0.25);
        }
        .btn-ghost {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: white;
        }
        .btn-ghost:hover {
            background: rgba(255, 255, 255, 0.18);
        }

        /* ----- sections ----- */
        .section {
            padding: 56px 0;
        }
        .section-header {
            text-align: center;
            margin-bottom: 32px;
        }
        .section-header h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 30px;
            letter-spacing: -0.3px;
        }
        .section-header p {
            color: var(--muted);
            margin-top: 4px;
        }

        /* categories */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 18px;
        }
        .cat-card {
            background: var(--card);
            border-radius: var(--radius);
            padding: 24px 12px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            cursor: pointer;
            border: 1px solid transparent;
        }
        .cat-card:hover {
            transform: translateY(-6px);
            border-color: var(--accent);
            box-shadow: 0 20px 40px rgba(0, 20, 50, 0.06);
        }
        .cat-card .icon {
            font-size: 32px;
            color: var(--accent);
            background: var(--accent-light);
            width: 60px;
            height: 60px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 40px;
            margin-bottom: 12px;
        }
        .cat-card h4 {
            font-size: 15px;
            font-weight: 600;
        }
        .cat-card .muted {
            font-size: 13px;
        }

        /* products */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }
        .product-card {
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(0, 0, 0, 0.02);
        }
        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 24px 48px rgba(0, 20, 50, 0.08);
        }
        .product-card .img-wrap {
            position: relative;
            overflow: hidden;
            background: var(--surface);
            height: 210px;
        }
        .product-card .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }
        .product-card:hover .img-wrap img {
            transform: scale(1.02);
        }
        .product-card .badge {
            position: absolute;
            top: 14px;
            left: 14px;
            background: var(--accent);
            color: white;
            padding: 4px 12px;
            border-radius: 40px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.3px;
        }
        .product-card .body {
            padding: 16px 16px 12px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .product-card .body h5 {
            font-size: 15px;
            font-weight: 600;
            margin: 0;
        }
        .product-card .body .category-tag {
            font-size: 12px;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }
        .price-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 4px;
        }
        .price-row .price {
            font-weight: 700;
            font-size: 18px;
        }
        .price-row .old-price {
            color: var(--muted);
            text-decoration: line-through;
            font-size: 14px;
            margin-left: 6px;
        }
        .rating {
            color: #f5b342;
            font-size: 13px;
        }
        .product-footer {
            padding: 8px 16px 16px;
            display: flex;
            gap: 10px;
        }
        .product-footer .add-btn {
            flex: 1;
            background: var(--primary);
            color: white;
            border: 0;
            padding: 12px;
            border-radius: 40px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .product-footer .add-btn:hover {
            background: var(--accent);
            transform: scale(1.02);
        }
        .product-footer .wish-btn {
            background: var(--surface);
            border: 0;
            width: 48px;
            border-radius: 40px;
            font-size: 16px;
            cursor: pointer;
            transition: var(--transition);
            color: var(--muted);
        }
        .product-footer .wish-btn:hover {
            background: #fee2e2;
            color: var(--danger);
        }

        /* flash deal */
        .deal-card {
            display: flex;
            gap: 24px;
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            align-items: stretch;
        }
        .deal-card .deal-img {
            width: 45%;
            background: var(--surface);
            min-height: 300px;
            object-fit: cover;
        }
        .deal-card .deal-content {
            padding: 32px 28px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .deal-card .deal-content h3 {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
        }
        .timer {
            display: flex;
            gap: 12px;
            margin: 20px 0;
        }
        .time-box {
            background: var(--primary);
            color: white;
            padding: 12px 16px;
            border-radius: 12px;
            min-width: 72px;
            text-align: center;
        }
        .time-box .num {
            font-size: 26px;
            font-weight: 700;
            line-height: 1;
        }
        .time-box .label {
            font-size: 11px;
            opacity: 0.7;
            margin-top: 4px;
        }
        .deal-price {
            font-size: 28px;
            font-weight: 700;
        }
        .deal-price .old {
            font-size: 18px;
            color: var(--muted);
            text-decoration: line-through;
            font-weight: 400;
            margin-left: 10px;
        }
        .stock-badge {
            background: #fef3c7;
            color: #b45309;
            padding: 4px 14px;
            border-radius: 40px;
            font-size: 13px;
            font-weight: 600;
            display: inline-block;
        }

        /* testimonials */
        .testimonials-scroll {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 8px 4px 16px;
            scroll-snap-type: x mandatory;
        }
        .testimonial-card {
            min-width: 300px;
            background: var(--card);
            padding: 20px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            scroll-snap-align: start;
        }
        .testimonial-card .stars {
            color: #f5b342;
            font-size: 14px;
            margin-bottom: 6px;
        }

        /* newsletter */
        .newsletter-box {
            background: var(--primary);
            color: white;
            border-radius: var(--radius);
            padding: 48px 32px;
            text-align: center;
        }
        .newsletter-box h3 {
            font-family: 'Poppins', sans-serif;
            font-size: 28px;
        }
        .newsletter-box p {
            opacity: 0.7;
            margin-bottom: 20px;
        }
        .newsletter-box form {
            display: flex;
            justify-content: center;
            gap: 10px;
            flex-wrap: wrap;
        }
        .newsletter-box input {
            padding: 14px 20px;
            border-radius: 40px;
            border: 0;
            width: 320px;
            max-width: 100%;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.06);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .newsletter-box input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }
        .newsletter-box input:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.1);
        }

        /* footer */
        footer {
            margin-top: 24px;
            padding: 40px 0 28px;
            border-top: 1px solid rgba(0, 0, 0, 0.04);
            color: var(--muted);
        }

        /* responsive */
        @media (max-width: 1024px) {
            .categories-grid {
                grid-template-columns: repeat(3, 1fr);
            }
            .products-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        @media (max-width: 840px) {
            .main-nav {
                display: none;
            }
            .mobile-toggle {
                display: inline-block;
            }
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .deal-card {
                flex-direction: column;
            }
            .deal-card .deal-img {
                width: 100%;
                height: 220px;
            }
            .hero h1 {
                font-size: 32px;
            }
        }
        @media (max-width: 560px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
            .categories-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .search-wrapper {
                min-width: 140px;
            }
            .search-wrapper button span {
                display: none;
            }
            .hero {
                padding: 48px 16px;
            }
        }

        /* utilities */
        .muted {
            color: var(--muted);
        }
        .text-center {
            text-align: center;
        }
        .gap-2 {
            gap: 8px;
        }
    </style>
</head>

<body>
    <header>
        <div class="container header-inner">
            <div style="display:flex;align-items:center;gap:8px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Menu"><i class="fas fa-bars"></i></button>
                <a class="brand" href="#">Nexus<span class="accent">Shop</span></a>
            </div>

            <nav class="main-nav" id="mainNav">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </nav>

            <div style="display:flex;align-items:center;gap:14px;">
                <div class="search-wrapper" role="search">
                    <input type="text" id="searchInput" placeholder="Search products..." aria-label="Search">
                    <button id="searchBtn"><i class="fas fa-search"></i> <span>Search</span></button>
                </div>

                <div class="header-actions">
                    <button class="icon-btn" title="Account"><i class="far fa-user"></i></button>
                    <button class="icon-btn" title="Wishlist"><i class="far fa-heart"></i></button>
                    <a class="cart" href="#" id="cartBtn">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count" id="cartCount">0</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- mobile menu -->
        <div id="mobileMenu">
            <div class="container">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#categories">Categories</a></li>
                    <li><a href="#products">Trending</a></li>
                    <li><a href="#deals">Deals</a></li>
                    <li><a href="#testimonials">Reviews</a></li>
                </ul>
            </div>
        </div>
    </header>

    <main>
        <!-- hero -->
        <section class="container hero">
            <div>
                <h1>New Winter Collection <br> Premium Picks</h1>
                <p>Discover the latest trends in fashion, tech, and accessories — curated for you. Limited-time deals & free shipping on selected items.</p>
                <div class="btn-group">
                    <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Shop Now</button>
                    <button class="btn btn-ghost" id="exploreDeals">Explore Deals</button>
                </div>
            </div>
        </section>

        <!-- categories -->
        <section id="categories" class="section container">
            <div class="section-header">
                <h2>Shop by Category</h2>
                <p>Browse our curated selection</p>
            </div>
            <div class="categories-grid" id="categoriesGrid"></div>
        </section>

        <!-- products -->
        <section id="products" class="section container">
            <div class="section-header">
                <h2>Trending Products</h2>
                <p>Popular picks based on recent activity</p>
            </div>
            <div class="products-grid" id="productsGrid"></div>
        </section>

        <!-- flash deal -->
        <section id="deals" class="section container">
            <div class="section-header">
                <h2>⚡ Flash Sale</h2>
                <p>Limited-time offers — don't miss out!</p>
            </div>
            <div class="deal-card">
                <img class="deal-img" src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air M2">
                <div class="deal-content">
                    <h3>MacBook Air M2</h3>
                    <p class="muted">Thin, light and powerful — now with M2 performance.</p>
                    <div class="timer">
                        <div class="time-box"><div class="num" id="dealDays">0</div><div class="label">Days</div></div>
                        <div class="time-box"><div class="num" id="dealHours">00</div><div class="label">Hours</div></div>
                        <div class="time-box"><div class="num" id="dealMinutes">00</div><div class="label">Min</div></div>
                        <div class="time-box"><div class="num" id="dealSeconds">00</div><div class="label">Sec</div></div>
                    </div>
                    <div style="display:flex;align-items:center;gap:12px;flex-wrap:wrap;">
                        <span class="deal-price">$999 <span class="old">$1,199</span></span>
                        <span style="background:var(--danger);color:white;padding:4px 14px;border-radius:40px;font-weight:700;">-17%</span>
                        <span class="stock-badge"><i class="fas fa-box"></i> Only 12 left</span>
                    </div>
                    <div style="margin-top:20px;">
                        <button class="btn btn-primary" id="buyDeal"><i class="fas fa-bolt"></i> Buy Now</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- testimonials -->
        <section id="testimonials" class="section container">
            <div class="section-header">
                <h2>What our customers say</h2>
                <p>Real reviews from verified buyers</p>
            </div>
            <div class="testimonials-scroll" id="testimonialsContainer">
                <div class="testimonial-card">
                    <div class="stars">★★★★★</div>
                    <p>"Fast shipping and excellent support. The product exceeded expectations!"</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:12px;">
                        <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=60&h=60&q=80" alt="Ava" style="width:44px;height:44px;border-radius:50%;object-fit:cover;">
                        <div><strong>Ava Martin</strong><div class="muted" style="font-size:13px;">Verified buyer</div></div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="stars">★★★★☆</div>
                    <p>"Great selection and smooth checkout. Will definitely shop again."</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:12px;">
                        <img src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=60&h=60&q=80" alt="Michael" style="width:44px;height:44px;border-radius:50%;object-fit:cover;">
                        <div><strong>Michael Lee</strong><div class="muted" style="font-size:13px;">Frequent buyer</div></div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="stars">★★★★★</div>
                    <p>"Amazing quality and the customer service is top notch. Highly recommend!"</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:12px;">
                        <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=60&h=60&q=80" alt="Sophia" style="width:44px;height:44px;border-radius:50%;object-fit:cover;">
                        <div><strong>Sophia Chen</strong><div class="muted" style="font-size:13px;">Verified buyer</div></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- newsletter -->
        <section class="section container">
            <div class="newsletter-box">
                <h3>Stay in the loop</h3>
                <p>Subscribe to get exclusive offers & new arrivals</p>
                <form id="newsletterForm">
                    <input type="email" id="newsletterEmail" placeholder="Enter your email" required>
                    <button class="btn btn-primary" type="submit"><i class="fas fa-paper-plane"></i> Subscribe</button>
                </form>
                <div id="newsletterMsg" style="margin-top:14px;font-size:14px;display:none;"></div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container" style="display:flex;flex-wrap:wrap;gap:32px;justify-content:space-between;">
            <div>
                <div style="font-weight:700;font-size:20px;">NexusShop</div>
                <p class="muted" style="max-width:280px;margin-top:6px;">Modern e-commerce demo built with HTML, CSS & JavaScript.</p>
                <div style="display:flex;gap:12px;margin-top:14px;">
                    <a href="#" class="icon-btn"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="icon-btn"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="icon-btn"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div style="display:flex;gap:48px;flex-wrap:wrap;">
                <div><strong>Company</strong><div class="muted" style="line-height:2;">About<br>Careers<br>Press</div></div>
                <div><strong>Support</strong><div class="muted" style="line-height:2;">Help Center<br>Shipping & Returns<br>Contact</div></div>
            </div>
        </div>
        <div class="container text-center muted" style="margin-top:24px;font-size:13px;border-top:1px solid rgba(0,0,0,0.03);padding-top:20px;">
            &copy; <span id="year"></span> NexusShop. All rights reserved.
        </div>
    </footer>

    <script>
        // ----- data -----
        const CATEGORIES = [
            { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt' },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop' },
            { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt' },
            { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones' },
            { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints' },
            { id: 'accessories', name: 'Accessories', icon: 'fa-watch' }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New',
                img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=400&q=80',
                category: 'phones' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, rating: 4, reviews: 86, img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=400&q=80',
                category: 'laptops' },
            { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: '-25%',
                img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=400&q=80',
                category: 'accessories' },
            { id: 4, title: 'Nike Air Max 270', price: 150, rating: 4, reviews: 53, img: 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=400&q=80',
                category: 'footwear' },
            { id: 5, title: 'Sony A7 IV Camera', price: 2499, rating: 5, reviews: 42, img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=400&q=80',
                category: 'gadgets' },
            { id: 6, title: 'Chanel No. 5', price: 120, rating: 5, reviews: 189, img: 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=400&q=80',
                category: 'accessories' },
            { id: 7, title: 'Travel Backpack', price: 79, oldPrice: 99, rating: 4, reviews: 67, img: 'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=400&q=80',
                category: 'accessories' },
            { id: 8, title: 'Sony WH-1000XM5', price: 399, rating: 5, reviews: 156, img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=400&q=80',
                category: 'gadgets' }
        ];

        // ----- state -----
        let cartCount = 0;
        const cartCountEl = document.getElementById('cartCount');
        const categoriesGrid = document.getElementById('categoriesGrid');
        const productsGrid = document.getElementById('productsGrid');
        const searchInput = document.getElementById('searchInput');

        // ----- render -----
        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(cat => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `
                    <div class="icon"><i class="fas ${cat.icon}"></i></div>
                    <h4>${cat.name}</h4>
                    <div class="muted">Explore</div>
                `;
                el.addEventListener('click', () => {
                    searchInput.value = cat.name;
                    filterProducts(cat.name);
                    document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
                });
                categoriesGrid.appendChild(el);
            });
        }

        function renderProducts(list) {
            productsGrid.innerHTML = '';
            list.forEach(p => {
                const card = document.createElement('div');
                card.className = 'product-card';
                const stars = '★'.repeat(Math.round(p.rating)) + '☆'.repeat(5 - Math.round(p.rating));
                card.innerHTML = `
                    <div class="img-wrap">
                        <img src="${p.img}" alt="${p.title}" loading="lazy">
                        ${p.badge ? `<span class="badge">${p.badge}</span>` : ''}
                    </div>
                    <div class="body">
                        <h5>${p.title}</h5>
                        <div class="category-tag">${p.category}</div>
                        <div class="price-row">
                            <span><span class="price">$${p.price.toLocaleString()}</span> ${p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}</span>
                            <span class="rating">${stars} <span style="color:var(--muted);font-size:12px;">(${p.reviews})</span></span>
                        </div>
                    </div>
                    <div class="product-footer">
                        <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add</button>
                        <button class="wish-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
                    </div>
                `;
                productsGrid.appendChild(card);
            });

            document.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = Number(btn.dataset.id);
                    addToCart(id);
                });
            });
        }

        function filterProducts(query) {
            const q = query.trim().toLowerCase();
            if (!q) { renderProducts(PRODUCTS); return; }
            const filtered = PRODUCTS.filter(p =>
                p.title.toLowerCase().includes(q) ||
                p.category.toLowerCase().includes(q)
            );
            renderProducts(filtered);
        }

        // ----- cart -----
        function addToCart(id) {
            const p = PRODUCTS.find(x => x.id === id);
            if (!p) return;
            cartCount++;
            cartCountEl.textContent = cartCount;
            const btn = document.querySelector(`.add-btn[data-id="${id}"]`);
            if (btn) {
                const orig = btn.innerHTML;
                btn.innerHTML = '<i class="fas fa-check"></i> Added';
                btn.disabled = true;
                setTimeout(() => { btn.innerHTML = orig;
                    btn.disabled = false; }, 1200);
            }
        }

        // ----- deal timer -----
        (function setupTimer() {
            const now = new Date();
            const target = new Date(now.getTime() + (24 * 60 + 38) * 60 * 1000);
            function tick() {
                const diff = target - new Date();
                if (diff <= 0) return;
                document.getElementById('dealDays').textContent = Math.floor(diff / (24 * 3600 * 1000));
                document.getElementById('dealHours').textContent = String(Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000))).padStart(2,'0');
                document.getElementById('dealMinutes').textContent = String(Math.floor((diff % (3600 * 1000)) / (60 * 1000))).padStart(2,'0');
                document.getElementById('dealSeconds').textContent = String(Math.floor((diff % (60 * 1000)) / 1000)).padStart(2,'0');
            }
            tick();
            setInterval(tick, 1000);
        })();

        // ----- events -----
        document.getElementById('searchBtn').addEventListener('click', () => filterProducts(searchInput.value));
        searchInput.addEventListener('keydown', e => { if (e.key === 'Enter') filterProducts(e.target.value); });

        document.getElementById('mobileToggle').addEventListener('click', () => {
            const menu = document.getElementById('mobileMenu');
            menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
        });

        document.getElementById('shopNow').addEventListener('click', () => {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
        });
        document.getElementById('exploreDeals').addEventListener('click', () => {
            document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
        });
        document.getElementById('buyDeal').addEventListener('click', () => {
            cartCount++;
            cartCountEl.textContent = cartCount;
            alert('🔥 Deal added to cart!');
        });

        document.getElementById('newsletterForm').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('newsletterEmail').value.trim();
            const msg = document.getElementById('newsletterMsg');
            if (!email || !email.includes('@')) {
                msg.style.display = 'block';
                msg.textContent = 'Please enter a valid email address.';
                msg.style.color = '#fca5a5';
                return;
            }
            msg.style.display = 'block';
            msg.textContent = '✅ Thanks! You are subscribed.';
            msg.style.color = '#a7f3d0';
            document.getElementById('newsletterEmail').value = '';
            setTimeout(() => msg.style.display = 'none', 3000);
        });

        // ----- init -----
        renderCategories();
        renderProducts(PRODUCTS);
        document.getElementById('year').textContent = new Date().getFullYear();
    </script>
</body>
</html>
