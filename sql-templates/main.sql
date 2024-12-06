create table if not exists users(
    user_ssn int,
    phone_number int,
    want_newsletter boolean,
    name text,
    address text,
    password text,
    primary key(user_ssn)
);

create table if not exists orders(
    user_ssn int not null,
    order_id int not null,
    payment_reference int,
    cost int,
    tracking_number int,
    last_changed_date date,
    status text,
    order_date date,
    primary key(order_id),
    foreign key(user_ssn) references users(user_ssn)
);



create table if not exists products(
    product_id int not null,
    quantity int not null,
    vat int not null,
    sale boolean,
    retail_price int not null,
    description text,
    title text not null,
    primary key(product_id)

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


