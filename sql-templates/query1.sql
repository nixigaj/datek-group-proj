SELECT
    p.product_id,
    p.title,
    p.description,
    p.retail_price
FROM
    products p
JOIN
    has_products hp ON p.product_id = hp.product_id
JOIN
    departments d ON hp.title = d.title
WHERE
    d.title = 'Men';


Select d.parent_title
from departments d
where d.title = :d_title


