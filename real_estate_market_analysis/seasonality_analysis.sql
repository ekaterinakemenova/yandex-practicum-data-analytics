/* =====================================================================
   Project: Real Estate Market Analysis (SPb & Leningrad Region)

   Author: Ekaterina Kemenova
   Date: 08.09.2025

   Goal:
   Identify seasonal patterns in the real estate market across the region
   (Saint Petersburg + cities of the Leningrad Region) by analyzing monthly
   listing publication and removal activity, in order to support marketing
   planning and optimal market entry timing.

   Key assumptions:
   - Listing removal ≈ property sale (no explicit sales flag available)
   - Analysis is restricted to cities (type = "город")
   - Only full years are used: 2015–2018
   - Extreme outliers are filtered using percentile-based thresholds
   - Monthly aggregation is used to capture seasonality

   Output:
   Monthly aggregation (published vs. removed/sold):
   - Number of listings (counts and shares)
   - Rank of months by activity
   - Average price per sq. meter
   - Average total area
   ===================================================================== */
   
-- Identify outliers using percentile-based thresholds:
WITH limits AS (
    SELECT
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY total_area)       AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms)           AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony)         AS balcony_limit,
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY ceiling_height)  AS ceiling_height_limit_h,
        PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY ceiling_height)  AS ceiling_height_limit_l
    FROM real_estate.flats
),
-- Select listings with no outliers (and keep core fields required for seasonality analysis):
filtered_id AS (
    SELECT
        f.id,
        f.total_area,
        a.first_day_exposition,
        a.days_exposition,
        a.last_price
    FROM real_estate.flats AS f
    LEFT JOIN real_estate.advertisement AS a USING (id)
    WHERE
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND (
            (ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
             AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits))
            OR ceiling_height IS NULL
        )
        AND a.first_day_exposition BETWEEN '2015-01-01' AND '2018-12-31'
        AND f.type_id IN (
            SELECT type_id
            FROM real_estate."type"
            WHERE "type" = 'город'
        )
),
-- Aggregate monthly listing publications:
ads_published AS (
    SELECT
        EXTRACT(MONTH FROM first_day_exposition)                     AS month_published,
        COUNT(id)                                                   AS total_ads_published,
        ROUND(AVG(last_price / total_area)::numeric, 2)             AS avg_price_sq_m,
        ROUND(AVG(total_area)::numeric, 2)                          AS avg_area
    FROM filtered_id
    GROUP BY month_published
),
-- Aggregate monthly listing removals (proxy for sales timing):
ads_sold AS (
    SELECT
        EXTRACT(MONTH FROM first_day_exposition + days_exposition::integer) AS month_sold,
        COUNT(id)                                                          AS total_ads_sold,
        ROUND(AVG(last_price / total_area)::numeric, 2)                    AS avg_price_sq_m,
        ROUND(AVG(total_area)::numeric, 2)                                 AS avg_area
    FROM filtered_id
    WHERE
        (first_day_exposition + days_exposition::integer)
            BETWEEN '2015-01-01' AND '2018-12-31'
    GROUP BY month_sold
)
-- Combine publication and removal seasonality into a single monthly view:
SELECT
    CASE
        WHEN p.month_published = 1  THEN 'January'
        WHEN p.month_published = 2  THEN 'February'
        WHEN p.month_published = 3  THEN 'March'
        WHEN p.month_published = 4  THEN 'April'
        WHEN p.month_published = 5  THEN 'May'
        WHEN p.month_published = 6  THEN 'June'
        WHEN p.month_published = 7  THEN 'July'
        WHEN p.month_published = 8  THEN 'August'
        WHEN p.month_published = 9  THEN 'September'
        WHEN p.month_published = 10 THEN 'October'
        WHEN p.month_published = 11 THEN 'November'
        WHEN p.month_published = 12 THEN 'December'
    END AS MONTH,
    p.total_ads_published,
    ROUND(p.total_ads_published / SUM(p.total_ads_published) OVER (), 3) * 100 AS total_ads_published_share,
    RANK() OVER (ORDER BY total_ads_published DESC)                            AS published_rank,
    p.avg_price_sq_m,
    p.avg_area,
    s.total_ads_sold,
    ROUND(s.total_ads_sold / SUM(s.total_ads_sold) OVER (), 3) * 100           AS total_ads_sold_share,
    RANK() OVER (ORDER BY total_ads_sold DESC)                                 AS sold_rank,
    s.avg_price_sq_m,
    s.avg_area
FROM ads_published AS p
FULL JOIN ads_sold AS s ON p.month_published = s.month_sold
ORDER BY p.month_published;