-- SQL-myyntianalyysi
-- Kuvitteellisen yrityksen myyntitietokannan analysointi


-- 1. Mitkä ovat 10 myydyintä tuotetta?

SELECT
    p.product_name AS Tuote,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)),
        2
    ) AS Myynti
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Myynti DESC
LIMIT 10;


-- 2. Ketkä ovat parhaat asiakkaat?

SELECT
    c.customer_name AS Asiakas,
    c.city AS Kaupunki,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)),
        2
    ) AS Myynti,
    COUNT(DISTINCT o.order_id) AS Tilauksia
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY Myynti DESC
LIMIT 10;


-- 3. Miten myynti kehittyy kuukausittain?

SELECT
    strftime('%Y-%m', o.order_date) AS Kuukausi,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)),
        2
    ) AS Myynti
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY strftime('%Y-%m', o.order_date)
ORDER BY Kuukausi;


-- 4. Mikä tuoteryhmä tuottaa eniten?

SELECT
    c.category_name AS Tuoteryhma,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)),
        2
    ) AS Myynti,
    ROUND(
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)
            - oi.quantity * p.unit_cost
        ),
        2
    ) AS Kate
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY Kate DESC;
