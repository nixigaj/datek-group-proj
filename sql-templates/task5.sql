# Query 1:
SELECT description AS welcome_text
FROM departments
WHERE parent_title IS NULL
LIMIT 1;

# Query 2:

SELECT title, root_url, description, logo
FROM departments
WHERE parent_title IS NULL;

# Query 3:

SELECT product_id, title, retail_price, description
FROM products
WHERE sale = TRUE
ORDER BY retail_price ASC
LIMIT 10;

# Query 4:

SELECT DISTINCT  p.title
FROM products p
JOIN has_keywords hk ON p.product_id = hk.product_id
WHERE hk.keyword_id IN (
    SELECT keyword_id
    FROM has_keywords
    WHERE product_id = 101
) AND p.product_id != 101;


#Query 5

SELECT DISTINCT
