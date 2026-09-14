<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buggy Shop</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        header {
            background: #222;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
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
            border-radius: 10px;
        }

        .product img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        button {
            background: #ff6347;
            color: white;
            border: 0;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        input {
            padding: 10px;
            width: 250px;
        }
    </style>
</head>

<body>

<header>
    <h2>BuggyShop</h2>
    <div>
        🛒 Cart: <span id="cartCount">0</span>
    </div>
</header>

<main>

    <input
        type="text"
        id="search"
        placeholder="Search products..."
    >

    <button id="searchButton">Search</button>

    <div class="products" id="products"></div>

</main>

<script>

    const products = [
        {
            id: 1,
            name: "iPhone 15",
            price: 799,
            image: "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd"
        },
        {
            id: 2,
            name: "MacBook Air",
            price: 999,
            image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8"
        },
        {
            id: 3,
            name: "Headphones",
            price: 199,
            image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
        }
    ];

    let cart = [];

    const productContainer =
        document.getElementById("products");

    const cartCount =
        document.getElementById("cartCount");

    const searchInput =
        document.getElementById("search");

    function displayProducts(items) {

        productContainer.innerHTML = "";

        items.forEach(function(product) {

            productContainer.innerHTML += `
                <div class="product">

                    <img src="${product.image}" alt="${product.name}">

                    <h3>${product.name}</h3>

                    <p>$${product.price}</p>

                    <button onclick="addToCart(${product.id})">
                        Add to Cart
                    </button>

                </div>
            `;
        });
    }

    function addToCart(id) {

        const product = products.find(function(item) {
            item.id === id;
        });

        cart.push(product);

        cartCount.innerText = cart.length;
    }

    document
        .getElementById("searchButton")
        .addEventListener("click", function() {

            const query = searchInput.value.toLowerCase();

            const results = products.filter(function(product) {
                product.name.toLowerCase().includes(query);
            });

            displayProducts(results);
        });

    displayProducts(products);

</script>

</body>
</html>
