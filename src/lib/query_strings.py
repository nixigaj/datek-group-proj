get_products = """
SELECT
    p.product_id,
    p.title,
    p.retail_price * (1-p.sale/100) as price_after_sale
FROM products p
JOIN
    has_products hp ON p.product_id = hp.product_id
JOIN
    departments d ON hp.title = d.title
WHERE
    d.title = %s;
"""

get_department_parent_title = """
SELECT d.title
FROM departments d
WHERE d.parent_title = %s;
"""

get_product_sale = """
SELECT p.title, p.sale 
FROM products p
WHERE p.product_id = %s;
"""

update_sale = """
UPDATE products p
SET p.sale = %s
WHERE p.product_id = %s;
"""
