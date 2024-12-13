from mysql import connector
from mysql.connector import Error

# ---------------------------------------------------- #
# Function definitions
# ---------------------------------------------------- #

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

def perform_database_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as err:
        print(f"Error: '{err}'")



