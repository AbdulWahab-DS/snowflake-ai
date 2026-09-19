USE WAREHOUSE COMPUTE_WH;
USE DATABASE OLIST_DB;
USE SCHEMA RAW;


-- 1. CUSTOMERS
CREATE TABLE CUSTOMERS (
    customer_id VARCHAR,
    customer_unique_id VARCHAR,
    customer_zip_code_prefix VARCHAR,
    customer_city VARCHAR,
    customer_state VARCHAR
);


-- 2. ORDERS
CREATE TABLE ORDERS (
    order_id VARCHAR,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP_NTZ,
    order_approved_at TIMESTAMP_NTZ,
    order_delivered_carrier_date TIMESTAMP_NTZ,
    order_delivered_customer_date TIMESTAMP_NTZ,
    order_estimated_delivery_date TIMESTAMP_NTZ
);


-- 3. ORDER ITEMS
CREATE TABLE ORDER_ITEMS (
    order_id VARCHAR,
    order_item_id NUMBER,
    product_id VARCHAR,
    seller_id VARCHAR,
    shipping_limit_date TIMESTAMP_NTZ,
    price NUMBER(10,2),
    freight_value NUMBER(10,2)
);


-- 4. ORDER PAYMENTS
CREATE TABLE ORDER_PAYMENTS (
    order_id VARCHAR,
    payment_sequential NUMBER,
    payment_type VARCHAR,
    payment_installments NUMBER,
    payment_value NUMBER(10,2)
);


-- 5. PRODUCTS
CREATE TABLE PRODUCTS (
    product_id VARCHAR,
    product_category_name VARCHAR,
    product_name_length NUMBER,
    product_description_length NUMBER,
    product_photos_qty NUMBER,
    product_weight_g NUMBER,
    product_length_cm NUMBER,
    product_height_cm NUMBER,
    product_width_cm NUMBER
);


-- 6. PRODUCT CATEGORY TRANSLATION
CREATE TABLE PRODUCT_CATEGORY_TRANSLATION (
    product_category_name VARCHAR,
    product_category_name_english VARCHAR
);