import random
import string
import json
from datetime import datetime, timedelta
import mysql.connector

# Database connection
conn = mysql.connector.connect(
    host="95.141.241.25",  # Change as needed
    user="nixigaj",
    password="oGBzpoRfkLCO0GP3Mz3qrFxEhDNjqVwc",
    database="datek"
)
cursor = conn.cursor()


# Generate mock data
def random_string(length):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))


def random_phone_number():
    return ''.join(random.choices(string.digits, k=10))


def random_date(start_date, end_date):
    # Ensure both start_date and end_date are datetime objects
    if isinstance(start_date, datetime.date):
        start_date = datetime.combine(start_date, datetime.min.time())
    if isinstance(end_date, datetime.date):
        end_date = datetime.combine(end_date, datetime.min.time())

    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    return (start_date + timedelta(days=random_days)).date()  # Convert result to date if needed



# Insert data into users
def populate_users(num_users):
    users = []
    for _ in range(num_users):
        user_ssn = random.randint(100000000, 999999999)
        phone_number = random_phone_number()
        want_newsletter = random.choice([True, False])
        name = random_string(10)
        address = random_string(20)
        password = random_string(12)
        users.append((user_ssn, phone_number, want_newsletter, name, address, password))
    cursor.executemany(
        "INSERT INTO users (user_ssn, phone_number, want_newsletter, name, address, password) VALUES (%s, %s, %s, %s, %s, %s)",
        users
    )
    conn.commit()
    return [user[0] for user in users]  # Return user_ssns


# Insert data into products
def populate_products(num_products):
    products = []
    for _ in range(num_products):
        product_id = random.randint(1000, 9999)
        quantity = random.randint(1, 100)
        vat = random.randint(5, 25)
        sale = random.randint(0, 100)
        retail_price = random.randint(10, 1000)
        description = random_string(30)
        title = random_string(15)
        products.append((product_id, quantity, vat, sale, retail_price, description, title))
    cursor.executemany(
        "INSERT INTO products (product_id, quantity, vat, sale, retail_price, description, title) VALUES (%s, %s, %s, %s, %s, %s, %s)",
        products
    )
    conn.commit()
    return [product[0] for product in products]  # Return product_ids


# Insert data into orders
def populate_orders(user_ssns, num_orders):
    orders = []
    for _ in range(num_orders):
        user_ssn = random.choice(user_ssns)
        order_id = random.randint(10000, 99999)
        payment_reference = random.randint(100000, 999999)
        cost = random.randint(50, 500)
        tracking_number = random.randint(1000000000, 9999999999)
        last_changed_date = random_date(datetime(2020, 1, 1), datetime(2023, 12, 31)).date()
        status = random.choice(["Pending", "Shipped", "Delivered", "Cancelled"])
        order_date = random_date(datetime(2018, 1, 1), last_changed_date).date()
        orders.append(
            (user_ssn, order_id, payment_reference, cost, tracking_number, last_changed_date, status, order_date))
    cursor.executemany(
        "INSERT INTO orders (user_ssn, order_id, payment_reference, cost, tracking_number, last_changed_date, status, order_date) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
        orders
    )
    conn.commit()
    return [order[1] for order in orders]  # Return order_ids


# Insert data into departments
def populate_departments(num_departments):
    departments = []
    for _ in range(num_departments):
        title = random_string(10)
        parent_title = random.choice([None] + [d[0] for d in departments])  # Allow hierarchical structure
        root_url = f"/{random_string(5)}"
        breadcrumbs = json.dumps([random_string(5) for _ in range(random.randint(1, 3))])
        description = random_string(20)
        logo = random_string(15)
        departments.append((title, parent_title, root_url, breadcrumbs, description, logo))
    cursor.executemany(
        "INSERT INTO departments (title, parent_title, root_url, breadcrumbs, description, logo) VALUES (%s, %s, %s, %s, %s, %s)",
        departments
    )
    conn.commit()
    return [d[0] for d in departments]  # Return titles


# Populate the database
try:
    user_ssns = populate_users(100)  # Populate 100 users
    product_ids = populate_products(50)  # Populate 50 products
    order_ids = populate_orders(user_ssns, 200)  # Populate 200 orders
    department_titles = populate_departments(10)  # Populate 10 departments
    print("Database populated with mock data!")
except Exception as e:
    print(f"An error occurred: {e}")
    conn.rollback()

# Close the connection
cursor.close()
conn.close()
