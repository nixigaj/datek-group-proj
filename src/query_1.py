#!/usr/bin/env python

from lib.utils import *
from lib.query_strings import *
import pandas as pd
import numpy as np

connection = get_db_conn()
if not connection:
    exit(1)

department = input("enter department for query: ")
result = perform_db_query(connection, get_department_parent_title.format(parent_title=department))

if not result:
    result = perform_db_query(connection, get_products.format(department_title=department))

    if result:
        result = np.array(result)
        output = pd.DataFrame(result, columns=["ID", "Title", "Price"])
        print(output)
    else:
        print("no products found for this department")
else:
    print(result)
