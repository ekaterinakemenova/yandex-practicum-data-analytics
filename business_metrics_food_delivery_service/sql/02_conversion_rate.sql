/*
Project: Business metrics dashboard for a food delivery service (Saransk, May–June 2021)
Metric: Conversion rate (CR) — share of registered users who placed at least one order among registered users, by day
*/

SELECT
    e.log_date,
    ROUND(
        COUNT(DISTINCT user_id) FILTER (WHERE e.event = 'order')
        / COUNT(DISTINCT user_id)::NUMERIC,
        2
    ) AS cr
FROM analytics_events AS e
JOIN cities AS c USING (city_id)
WHERE c.city_name = 'Саранск'
  AND e.log_date BETWEEN '2021-05-01' AND '2021-06-30'
GROUP BY e.log_date
ORDER BY e.log_date;