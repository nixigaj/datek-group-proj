#import pandas as pd
from getpass import getpass
from funcs import *
from queries import *

# ---------------------------------------------------- #
# main code
# ---------------------------------------------------- #

host_name = "95.141.241.25"
user_name = input("Enter username: ")
user_password = getpass("Enter password: ")
database = "datek"

connection = create_server_connection(host_name, user_name, user_password, database)

print(perform_database_query(connection, query1.format(department_title = "Men")))




