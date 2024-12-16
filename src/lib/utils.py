from mysql import connector
from mysql.connector import Error
import tomllib
from .constants import *

def get_db_conn():
    try:
        with open(CONN_FILE_PATH, 'rb') as toml_file:
            config = tomllib.load(toml_file)

        host_name = config.get('db_host')
        user_name = config.get('db_user')
        user_password = config.get('db_pass')
        database_name = config.get('db_name')

        if not all([host_name, user_name, user_password, database_name]):
            raise ValueError(f"missing required database configuration in {CONN_FILE_PATH}")

        connection = connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=database_name,
        )
        return connection

    except (FileNotFoundError, ValueError, KeyError) as file_err:
        print(f"file error: {file_err}")
    except Error as db_err:
        print(f"database connection error: '{db_err}'")
    return None

def perform_db_query(connection, query, params=None):
    cursor = connection.cursor()

    try:
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        result = cursor.fetchall()
        connection.commit()
        return result

    except Error as err:
        print(f"Error: '{err}'")
        connection.rollback()
    return None
