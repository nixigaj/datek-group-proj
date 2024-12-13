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

department = input("Input department for query: ")
result = perform_database_query(connection, get_department_parent_title .format(parent_title = department))

if not result:
    result = np.array(perform_database_query(connection, get_products.format(department_title = department)))
    output = pd.DataFrame(result, columns=np.array(["ID", "Title", "Price"]))
    print(output)

else:
    print(result)



