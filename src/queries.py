
# ---------------------------------------------------- #
# Queries
# ---------------------------------------------------- #

query = """
SELECT * FROM {table}"""


get_products = """
SELECT
    p.product_id,
    p.title,
    p.retail_price
FROM
    products p
JOIN
    has_products hp ON p.product_id = hp.product_id
JOIN
    departments d ON hp.title = d.title
WHERE
    d.title = '{department_title}';
"""

get_department_parent_title = """
Select d.title
from departments d
where d.parent_title = '{parent_title}';
"""


get_product_sale = """
select p.sale 
from products p
where p.product_id = '{product_id}';
"""
