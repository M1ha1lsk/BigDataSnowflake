CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);

CREATE TABLE dim_seller (
    seller_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    name TEXT,
    category TEXT,
    price NUMERIC,
    quantity INT,
    weight NUMERIC,
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    description TEXT,
    rating NUMERIC,
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

CREATE TABLE dim_supplier (
    name TEXT PRIMARY KEY,
    contact TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    city TEXT,
    country TEXT
);

CREATE TABLE dim_pet (
    pet_type TEXT PRIMARY KEY,
    pet_category TEXT
);

CREATE TABLE dim_store (
    store_name TEXT PRIMARY KEY,
    location TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    phone TEXT,
    email TEXT
);


CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    customer_id INT REFERENCES dim_customer(customer_id),
    seller_id INT REFERENCES dim_seller(seller_id),
    product_id INT REFERENCES dim_product(product_id),
    store_name TEXT REFERENCES dim_store(store_name),
    pet_type TEXT REFERENCES dim_pet(pet_type),
    supplier_name TEXT REFERENCES dim_supplier(name),
    quantity INT,
    total_price NUMERIC
);

