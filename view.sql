CREATE VIEW vw_customer_type AS
SELECT
    customer_id,
    CASE
        WHEN COUNT(*) > 1 THEN 'Repeat'
        ELSE 'One time'
    END AS customer_type
FROM sales
GROUP BY customer_id;



CREATE VIEW vw_customer_activity AS
SELECT 
    customer_id,
    MAX(order_date) AS last_purchase_date,
    CASE
        WHEN MAX(order_date) < DATE_SUB('2025-12-31', INTERVAL 3 MONTH)
        THEN 'inactive'
        ELSE 'active'
    END AS customer_status
FROM sales
GROUP BY customer_id;



CREATE VIEW vw_customer_revenue AS
SELECT
    customer_id,
    SUM(total_revenue) AS total_revenue
FROM sales
GROUP BY customer_id;

