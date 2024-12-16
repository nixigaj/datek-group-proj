get_products = """
select
    p.product_id,
    p.title,
    p.retail_price * (1-p.sale/100) as price_after_sale
from products p
join
    has_products hp on p.product_id = hp.product_id
join
    departments d on hp.title = d.title
where
    d.title = %s;
"""

get_department_parent_title = """
select d.title
from departments d
where d.parent_title = %s;
"""

get_product_sale = """
select p.title, p.sale 
from products p
where p.product_id = %s;
"""

update_sale = """
update products p
set p.sale = %s
where p.product_id = %s;
"""
