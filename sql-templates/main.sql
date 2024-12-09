create table if not exists users(
    user_ssn int not null,
    phone_number text not null,
    want_newsletter boolean,
    name text not null,
    address text,
    password text not null,
    primary key(user_ssn)
);

create table if not exists orders(
    user_ssn int not null,
    order_id int not null,
    payment_reference int not null,
    cost int not null,
    tracking_number int not null,
    last_changed_date date,
    status text,
    order_date date,
    primary key(order_id),
    foreign key(user_ssn) references users(user_ssn),
	check(cost >= 0),
    unique(tracking_number)
);

create table if not exists products(
    product_id int not null,
    quantity int not null,
    vat int not null,
    sale int,
    retail_price int not null,
    description text,
    title text not null,
    primary key(product_id),
    check(retail_price > 0),
	check(0 <= sale <= 100)
);

create table if not exists reviews(
    user_ssn int not null,
    product_id int not null,
    stars int not null,
    review_text text,
    primary key(user_ssn, product_id),
    foreign key(user_ssn) references users(user_ssn),
    foreign key(product_id) references products(product_id)

);

create table if not exists order_items(
    product_id int not null,
    order_id int not null,
    primary key(product_id, order_id),
    quantity int,
    check(quantity > 0),
    foreign key(product_id) references products(product_id),
    foreign key(order_id) references orders(order_id)
);

create table if not exists departments(
    title VARCHAR(255) not null,
    parent_title varchar(255),
    root_url text not null,
    breadcrumbs json,
    description text,
    logo text,
    primary key(title),
    foreign key(parent_title) references departments(title)
);
create table if not exists has_products(
    product_id int not null,
    title varchar(255) not null,
    primary key(product_id,title),
    foreign key(title) references departments(title),
    foreign key(product_id) references products(product_id)
);

create table if not exists keywords(
    keyword_id int not null,
    keyword_name text not null,
    primary key(keyword_id)
);

create table if not exists has_keywords(
    keyword_id int not null,
    product_id int not null,
    primary key(keyword_id,product_id),
    foreign key(keyword_id) references keywords(keyword_id),
    foreign key(product_id) references products(product_id)
);
