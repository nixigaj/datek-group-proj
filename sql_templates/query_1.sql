select
    p.product_id,
    p.title,
    p.description,
    p.retail_price * (1-p.sale/100) as price_after_sale
from
    products p
join
    has_products hp on p.product_id = hp.product_id
join
    departments d on hp.title = d.title
where
    d.title = 'men';

select d.title
from departments d
where d.parent_title = :d_title;

select p.sale from products p
where p.product_id = :product_id;
