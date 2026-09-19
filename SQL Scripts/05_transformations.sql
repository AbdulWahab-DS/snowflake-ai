USE WAREHOUSE COMPUTE_WH;
USE DATABASE OLIST_DB;
USE SCHEMA RAW;


-- View: VW_DIM_CUSTOMERS

CREATE OR REPLACE VIEW VW_DIM_CUSTOMERS AS
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM CUSTOMERS;


-- View: VW_DIM_PRODUCTS

CREATE OR REPLACE VIEW VW_DIM_PRODUCTS AS
SELECT
    p.product_id,
    pct.product_category_name_english AS product_category,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM PRODUCTS p
LEFT JOIN PRODUCT_CATEGORY_TRANSLATION pct
    ON p.product_category_name = pct.product_category_name;


-- View: VW_FACT_SALES

CREATE OR REPLACE VIEW VW_FACT_SALES AS

WITH payment_summary AS
(
    SELECT
        order_id,
        SUM(payment_value) AS payment_value
    FROM ORDER_PAYMENTS
    GROUP BY order_id
)

SELECT
    o.order_id,
    o.customer_id,
    oi.product_id,
    o.order_status,

    CAST(o.order_purchase_timestamp AS DATE) AS purchase_date,
    YEAR(o.order_purchase_timestamp) AS purchase_year,
    MONTH(o.order_purchase_timestamp) AS purchase_month,
    QUARTER(o.order_purchase_timestamp) AS purchase_quarter,

    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS total_amount,

    ps.payment_value

FROM ORDERS o

INNER JOIN ORDER_ITEMS oi
    ON o.order_id = oi.order_id

LEFT JOIN payment_summary ps
    ON o.order_id = ps.order_id;



SELECT * FROM VW_DIM_CUSTOMERS LIMIT 10;

SELECT * FROM VW_DIM_PRODUCTS LIMIT 10;

SELECT * FROM VW_FACT_SALES LIMIT 10;