#!/usr/bin/env python

from lib.utils import *
from lib.query_strings import *
import numpy as np

connection = get_db_conn()
if not connection:
    exit(1)

product_id = input("enter a product ID: ")
result = perform_db_query(connection, get_product_sale.format(product_id = product_id))

if not result:
    print("no product with that ID was found.")
else:
    result = np.array(result)
    print("current sale of {product} is: {sale}%".format(product = result[0][0], sale = result[0][1]))

    new_sale = input("enter the new sale of the product: ")
    perform_db_query(connection, update_sale.format(product_id = product_id, sale = new_sale))

    result = np.array(perform_db_query(connection, get_product_sale.format(product_id = product_id)))
    print("new sale of {product} is: {sale}%".format(product = result[0][0], sale = result[0][1]))
