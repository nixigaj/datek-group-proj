-- Insert top-level departments
INSERT INTO departments (title, parent_title, root_url, breadcrumbs, description, logo)
VALUES
    ('Electronics', NULL, '/electronics', '["Home", "Electronics"]', 'All kinds of electronic items.', 'electronics_logo.png'),
    ('Fashion', NULL, '/fashion', '["Home", "Fashion"]', 'Clothing and accessories.', 'fashion_logo.png');

-- Insert child departments for Electronics
INSERT INTO departments (title, parent_title, root_url, breadcrumbs, description, logo)
VALUES
    ('Mobiles', 'Electronics', '/electronics/mobiles', '["Home", "Electronics", "Mobiles"]', 'Mobile phones and accessories.', 'mobiles_logo.png'),
    ('Laptops', 'Electronics', '/electronics/laptops', '["Home", "Electronics", "Laptops"]', 'Laptops and accessories.', 'laptops_logo.png'),
    ('Cameras', 'Electronics', '/electronics/cameras', '["Home", "Electronics", "Cameras"]', 'Cameras and accessories.', 'cameras_logo.png');

-- Insert child departments for Fashion
INSERT INTO departments (title, parent_title, root_url, breadcrumbs, description, logo)
VALUES
    ('Men', 'Fashion', '/fashion/men', '["Home", "Fashion", "Men"]', 'Men clothing and accessories.', 'men_logo.png'),
    ('Women', 'Fashion', '/fashion/women', '["Home", "Fashion", "Women"]', 'Women clothing and accessories.', 'women_logo.png'),
    ('Kids', 'Fashion', '/fashion/kids', '["Home", "Fashion", "Kids"]', 'Kids clothing and accessories.', 'kids_logo.png');

-- Insert products
INSERT INTO products (product_id, quantity, vat, sale, retail_price, description, title)
VALUES
    (1, 50, 18, TRUE, 500, 'Latest model smartphone', 'Smartphone X'),
    (2, 30, 18, FALSE, 1200, 'High-performance laptop', 'Laptop Pro'),
    (3, 20, 18, TRUE, 700, 'Compact digital camera', 'Digital Camera Z'),
    (4, 100, 18, FALSE, 50, 'Cotton T-shirt for men', 'Men T-Shirt'),
    (5, 150, 18, TRUE, 40, 'Fashionable women scarf', 'Women Scarf'),
    (6, 80, 18, FALSE, 20, 'Kids socks pack', 'Kids Socks'),
    (7, 60, 18, FALSE, 200, 'Noise-cancelling headphones', 'Headphones Max'),
    (8, 40, 18, TRUE, 800, 'DSLR camera', 'DSLR Camera Pro'),
    (9, 70, 18, TRUE, 70, 'Casual women top', 'Women Top'),
    (10, 90, 18, FALSE, 15, 'Kids gloves', 'Kids Gloves');

-- Link products to departments
INSERT INTO has_products (product_id, title)
VALUES
    (1, 'Mobiles'),
    (2, 'Laptops'),
    (3, 'Cameras'),
    (4, 'Men'),
    (5, 'Women'),
    (6, 'Kids'),
    (7, 'Electronics'),
    (8, 'Cameras'),
    (9, 'Women'),
    (10, 'Kids');

-- Insert users
INSERT INTO users (user_ssn, phone_number, want_newsletter, name, address, password)
VALUES
    (101, '1234567890', TRUE, 'John Doe', '123 Main Street, Cityville', 'password123'),
    (102, '9876543210', FALSE, 'Jane Smith', '456 Elm Street, Townsville', 'password456');

-- Insert reviews for the same product by both users
INSERT INTO reviews (user_ssn, product_id, stars, review_text)
VALUES
    (101, 1, 5, 'Amazing smartphone with great features!'),
    (102, 1, 4, 'Good value for money. Recommended!');

-- Insert an order for one of the users
INSERT INTO orders (user_ssn, order_id, payment_reference, cost, tracking_number, last_changed_date, status, order_date)
VALUES
    (101, 1, 111222, 500, 333444, '2024-12-05', 'Processing', '2024-12-05');

-- Add products to the order
INSERT INTO order_items (product_id, order_id)
VALUES
    (1, 1);

-- Insert keywords
INSERT INTO keywords (keyword_id, keyword_name)
VALUES
    (1, 'Smartphone'),
    (2, 'Android'),
    (3, 'iOS'),
    (4, 'Laptop'),
    (5, 'Gaming'),
    (6, 'Camera'),
    (7, 'DSLR'),
    (8, 'Clothing'),
    (9, 'Menswear'),
    (10, 'Womenswear'),
    (11, 'Kidswear'),
    (12, 'Fashion Accessories'),
    (13, 'Electronics'),
    (14, 'Mobile Accessories');

-- Insert into has_keywords
INSERT INTO has_keywords (keyword_id, product_id)
VALUES
    -- Mobiles
    (1, 1), -- Smartphone for Product 1
    (2, 1), -- Android for Product 1
    (14, 1), -- Mobile Accessories for Product 1
    (3, 2), -- iOS for Product 2
    (1, 2), -- Smartphone for Product 2

    -- Laptops
    (4, 3), -- Laptop for Product 3
    (5, 3), -- Gaming for Product 3
    (13, 3), -- Electronics for Product 3
    (4, 4), -- Laptop for Product 4
    (13, 4), -- Electronics for Product 4

    -- Cameras
    (6, 5), -- Camera for Product 5
    (7, 5), -- DSLR for Product 5
    (13, 5), -- Electronics for Product 5

    -- Men's Fashion
    (8, 6), -- Clothing for Product 6
    (9, 6), -- Menswear for Product 6
    (12, 6), -- Fashion Accessories for Product 6

    -- Women's Fashion
    (8, 7), -- Clothing for Product 7
    (10, 7), -- Womenswear for Product 7
    (12, 7), -- Fashion Accessories for Product 7

    -- Kids' Fashion
    (8, 8), -- Clothing for Product 8
    (11, 8), -- Kidswear for Product 8
    (12, 8); -- Fashion Accessories for Product 8
