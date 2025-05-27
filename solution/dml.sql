INSERT INTO dim_customer (customer_id, first_name, last_name, age, email, country, postal_code)
SELECT DISTINCT
    sale_customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_seller (seller_id, first_name, last_name, email, country, postal_code)
SELECT DISTINCT
    sale_seller_id,
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_product (
    product_id, name, category, price, quantity,
    weight, color, size, brand, material,
    description, rating, reviews, release_date, expiry_date
)
SELECT DISTINCT
    sale_product_id,
    product_name,
    product_category,
    product_price,
    product_quantity,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_pet (pet_type, pet_category)
SELECT DISTINCT
    customer_pet_type,
    pet_category
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_store (store_name, location, city, state, country, phone, email)
SELECT DISTINCT
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO dim_supplier (name, contact, email, phone, address, city, country)
SELECT DISTINCT
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM mock_data
ON CONFLICT DO NOTHING;

INSERT INTO fact_sales (
    sale_id, sale_date, customer_id, seller_id, product_id,
    store_name, pet_type, supplier_name,
    quantity, total_price
)
SELECT
    id,
    sale_date,
    sale_customer_id,
    sale_seller_id,
    sale_product_id,
    store_name,
    customer_pet_type,
    supplier_name,
    sale_quantity,
    sale_total_price
FROM mock_data
ON CONFLICT DO NOTHING;
