#import pandas as pd
from getpass import getpass
from funcs import *
from queries import *
import pandas as pd
import numpy as np

# ---------------------------------------------------- #
# main code
# ---------------------------------------------------- #

host_name = "95.141.241.25"
user_name = input("Enter username: ")
user_password = input("Enter password: ")#getpass("Enter password: ")
database = "datek"

connection = create_server_connection(host_name, user_name, user_password, database)

product_id = input("Enter a product ID: ")
result = perform_database_query(connection, get_product_sale.format(product_id = product_id))

if not result:
    print("No product with that ID was found.")
else:
    result = np.array(result)
    print("current sale of {product} is: {sale}%".format(product = result[0][0], sale = result[0][1]))

    new_sale = input("Input the new sale of the product: ")
    perform_database_query(connection, update_sale.format(product_id = product_id, sale = new_sale))

    result = np.array(perform_database_query(connection, get_product_sale.format(product_id = product_id)))
    print("New sale of {product} is: {sale}%".format(product = result[0][0], sale = result[0][1]))



