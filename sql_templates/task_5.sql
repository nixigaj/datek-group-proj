# query 1:
select description as welcome_text
from departments
where parent_title is null
limit 1;

# query 2:
select title, root_url, description, logo
from departments
where parent_title is null;

# query 3:
select product_id, title, retail_price, description
from products
where sale > 0
order by retail_price
limit 10;

# query 4:
select distinct  p.title
from products p
join has_keywords hk on p.product_id = hk.product_id
where hk.keyword_id in (
    select keyword_id
    from has_keywords
    where product_id = 1
) and p.product_id != 1;

#query 5
select
    p.title,
    p.description,
    p.retail_price,
    avg(r.stars)
from
    products p
join
    has_products hp on p.product_id = hp.product_id
join
    departments d on hp.title = d.title
join
    reviews r on p.product_id = r.product_id
where
    d.title = 'mobiles';

select
    p.title,
    p.sale
from
    products p
order by p.sale desc
