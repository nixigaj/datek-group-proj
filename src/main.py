from mysql import connector
from mysql.connector import Error
import pandas as pd
import numpy as np


def create_server_connection(host_name, user_name, user_password, database_name):
    connection = None
    try:
        connection = connector.connect(
        host = host_name,
        user = user_name,
        passwd = user_password,
        database = database_name,
    )
        print("MySQL database connection successful")
    except Error as err:
        print(f"Error: '{err}'")
    return connection


host_name = "95.141.241.25"
user_name = input("Enter username: ")
user_password = input("Enter your password: ")
database = "datek"

create_server_connection(host_name, user_name, user_password, database)
