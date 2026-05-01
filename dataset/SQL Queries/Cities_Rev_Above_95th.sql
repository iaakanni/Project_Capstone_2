SELECT 
    l."City",
    l."State",
    ROUND(SUM(o."Amount"), 2) AS total_revenue
FROM orders_fact o
JOIN locations l ON o."Location_ID" = l."Location_ID"
GROUP BY l."City", l."State"
HAVING SUM(o."Amount") > (
    SELECT PERCENTILE_CONT(0.95) 
    WITHIN GROUP (ORDER BY city_revenue)
    FROM (
        SELECT 
            l2."City",
            SUM(o2."Amount") AS city_revenue
        FROM orders_fact o2
        JOIN locations l2 ON o2."Location_ID" = l2."Location_ID"
        GROUP BY l2."City"
    ) city_totals
)
ORDER BY total_revenue DESC;