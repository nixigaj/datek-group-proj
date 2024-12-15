#!/usr/bin/env python

from getpass import getpass

from lib.constants import CONN_FILE_PATH

db_host = input("enter database server host: ")
db_user = input("enter server username: ")
db_pass = getpass("enter user password: ")
db_name = input("enter database name: ")

if not db_host or not db_user or not db_pass or not db_name:
    print("error: empty property")
    exit(1)

toml_content = \
f"""db_host = "{db_host}"
db_user = "{db_user}"
db_pass = "{db_pass}"
db_name = "{db_name}"
"""

with open(CONN_FILE_PATH, "w") as file:
    file.write(toml_content)
