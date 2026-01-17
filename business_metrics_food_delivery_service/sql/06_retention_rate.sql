/*
Project: Business metrics dashboard for a food delivery service (Saransk, May–June 2021)
Metric: Retention Rate — share of users who return to the app within the first 7 days after registration
*/

-- Select new users based on their first visit date
WITH new_users AS (
    SELECT DISTINCT
           first_date,
           user_id
    FROM analytics_events
    JOIN cities ON analytics_events.city_id = cities.city_id
    WHERE first_date BETWEEN '2021-05-01' AND '2021-06-24'
      AND city_name = 'Саранск'
),

-- Select all active users by event date
active_users AS (
    SELECT DISTINCT
           log_date,
           user_id
    FROM analytics_events
    JOIN cities ON analytics_events.city_id = cities.city_id
    WHERE log_date BETWEEN '2021-05-01' AND '2021-06-30'
      AND city_name = 'Саранск'
),

-- Calculate user lifetime in days since first visit
daily_retention AS (
    SELECT
           user_id,
           first_date,
           log_date::date - first_date::date AS day_since_install
    FROM new_users
    JOIN active_users USING (user_id)
    WHERE log_date >= first_date
)

SELECT
       day_since_install,
       COUNT(DISTINCT user_id) AS retained_users,
       ROUND(
           COUNT(DISTINCT user_id)::numeric
           / MAX(COUNT(DISTINCT user_id)) OVER (),
           2
       ) AS retention_rate
FROM daily_retention
WHERE day_since_install <= 7
GROUP BY day_since_install
ORDER BY day_since_install;