SELECT 
    p."Products_ID",
    p."Category",
    p."Sub-Category",
    ROUND(AVG(monthly_sales), 2) AS avg_monthly_sales
FROM products p
JOIN (
    SELECT 
        o."Products_ID",
        d."Year",
        d."Month",
        SUM(o."Amount") AS monthly_sales
    FROM orders_fact o
    JOIN dates d ON o."Date_ID" = d."Date_ID"
    GROUP BY o."Products_ID", d."Year", d."Month"
) monthly ON p."Products_ID" = monthly."Products_ID"
GROUP BY p."Products_ID", p."Category", p."Sub-Category"
ORDER BY avg_monthly_sales DESC;