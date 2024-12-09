# Query 1:
SELECT description AS welcome_text
FROM departments
WHERE parent_title IS NULL;

# Query 2:

SELECT title, root_url, description, logo
FROM departments
WHERE parent_title IS NULL;

# Query 3:

SELECT product_id, title, retail_price, description
FROM products
WHERE sale > 0
ORDER BY retail_price
LIMIT 10;

# Query 4:

SELECT DISTINCT p.title
FROM products p
JOIN has_keywords hk ON p.product_id = hk.product_id
WHERE hk.keyword_id IN (
    SELECT keyword_id
    FROM has_keywords
    WHERE product_id = :product_id
) AND p.product_id != :product_id;


#Query 5

SELECT
    p.title,
    p.description,
    p.retail_price,
    AVG(r.stars)
FROM
    products p
JOIN
    has_products hp ON p.product_id = hp.product_id
JOIN
    departments d ON hp.title = d.title
JOIN
    reviews r ON p.product_id = r.product_id
WHERE
    d.title = 'mobiles';


#Query 6

SELECT
    p.title,
    p.sale
FROM
    products p
ORDER BY p.sale DESC


