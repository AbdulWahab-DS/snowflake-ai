USE WAREHOUSE COMPUTE_WH;
USE DATABASE OLIST_DB;
USE SCHEMA RAW;

-- 1. Total Sales
SELECT
    SUM(total_amount) AS total_sales
FROM VW_FACT_SALES;


-- 2. Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM VW_FACT_SALES;


-- 3. Top 10 Products by Sales
SELECT
    p.product_category,
    f.product_id,
    SUM(f.total_amount) AS total_sales
FROM VW_FACT_SALES f
LEFT JOIN VW_DIM_PRODUCTS p
    ON f.product_id = p.product_id
GROUP BY
    p.product_category,
    f.product_id
ORDER BY total_sales DESC
LIMIT 10;


-- 4. Sales by Category
SELECT
    p.product_category,
    SUM(f.total_amount) AS total_sales
FROM VW_FACT_SALES f
LEFT JOIN VW_DIM_PRODUCTS p
    ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_sales DESC;


-- 5. Monthly Sales
SELECT
    purchase_year,
    purchase_month,
    SUM(total_amount) AS total_sales
FROM VW_FACT_SALES
GROUP BY
    purchase_year,
    purchase_month
ORDER BY
    purchase_year,
    purchase_month;


-- 6. Sales by Customer State
SELECT
    c.customer_state,
    SUM(f.total_amount) AS total_sales
FROM VW_FACT_SALES f
LEFT JOIN VW_DIM_CUSTOMERS c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_sales DESC;


-- 7. Order Status Analysis
SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders
FROM VW_FACT_SALES
GROUP BY order_status
ORDER BY total_orders DESC;