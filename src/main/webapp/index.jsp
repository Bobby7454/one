<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>NexusShop - Quality Gate Test</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f4f4f4;
        }

        header {
            background: #111;
            color: white;
            padding: 20px;
        }

        .container {
            width: 90%;
            margin: auto;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 30px;
        }

        .product {
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        button {
            background: #ff5733;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }

        .error {
            color: red;
        }

        @media(max-width:700px) {
            .products {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="container">
        <h1>NexusShop</h1>

        <input
            type="text"
            id="search"
            placeholder="Search products"
        >

        <button onclick="searchProducts()">Search</button>

        <span>
            Cart:
            <strong id="cartCount">0</strong>
        </span>
    </div>
</header>

<main class="container">

    <h2>Products</h2>

    <div id="message"></div>

    <div id="products" class="products"></div>

</main>

<script>

    // Intentionally unused variables
    var username = "admin";
    var password = "123456";
    var apiKey = "TEST-SECRET-123456";
    var unusedValue = 999;

    // Hard-coded sensitive-looking information
    const DATABASE_PASSWORD = "password123";

    const products = [
        {
            id: 1,
            name: "iPhone 15",
            category: "Phone",
            price: 799,
            stock: 10,
            image: "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd"
        },
        {
            id: 2,
            name: "MacBook Air",
            category: "Laptop",
            price: 999,
            stock: 5,
            image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8"
        },
        {
            id: 3,
            name: "Sony Headphones",
            category: "Audio",
            price: 199,
            stock: 20,
            image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
        }
    ];

    let cart = [];

    // Duplicate function
    function calculateTotal(items) {
        let total = 0;

        for (let i = 0; i < items.length; i++) {
            total = total + items[i].price;
        }

        return total;
    }

    // Almost identical duplicate function
    function calculateCartTotal(items) {
        let total = 0;

        for (let i = 0; i < items.length; i++) {
            total = total + items[i].price;
        }

        return total;
    }

    function displayProducts(items) {

        const container = document.getElementById("products");

        container.innerHTML = "";

        if (items.length === 0) {
            container.innerHTML = "<p>No products found</p>";
        }

        items.forEach(function(product) {

            // Unsafe HTML construction
            container.innerHTML +=
                '<div class="product">' +
                    '<img src="' + product.image + '">' +
                    '<h3>' + product.name + '</h3>' +
                    '<p>' + product.category + '</p>' +
                    '<p>$' + product.price + '</p>' +
                    '<p>Stock: ' + product.stock + '</p>' +
                    '<button onclick="addToCart(' +
                        product.id +
                    ')">Add to Cart</button>' +
                '</div>';
        });
    }

    function addToCart(id) {

        // BUG:
        // find() callback doesn't return anything.
        const product = products.find(function(item) {
            item.id == id;
        });

        // Product may be undefined.
        cart.push(product);

        document.getElementById("cartCount").innerText =
            cart.length;

        // Incorrect stock handling
