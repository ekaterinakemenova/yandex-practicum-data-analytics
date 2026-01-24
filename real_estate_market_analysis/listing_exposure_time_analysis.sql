/* =====================================================================
   Project: Real Estate Market Analysis (SPb & Leningrad Region)
   
   Author: Ekaterina Kemenova
   Date: 08.09.2025

   Goal:
   Identify the most attractive real estate segments in Saint Petersburg
   and the cities of the Leningrad Region by analyzing listing exposure time, 
   in order to inform market entry strategy.

   Key assumptions:
   - Listing removal ≈ property sale (no explicit sales flag available)
   - Analysis is restricted to cities (type = "город")
   - Only full years are used: 2015–2018
   - Extreme outliers are filtered using percentile-based thresholds

   Output:
   Aggregated statistics by:
   - Region (Saint Petersburg vs Leningrad Region)
   - Listing exposure duration category  (1–30 / 31–90 / 91–180 / 181+ days)
   with counts, shares, and key descriptive metrics.
   ===================================================================== */

-- Identify outliers using percentile-based thresholds:
WITH limits AS (
    SELECT
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY total_area)     AS total_area_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY rooms)          AS rooms_limit,
        PERCENTILE_DISC(0.99) WITHIN GROUP (ORDER BY balcony)        AS balcony_limit,
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_h,
        PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY ceiling_height) AS ceiling_height_limit_l
    FROM real_estate.flats
),
-- Select listing IDs with no outliers:
filtered_id AS (
    SELECT
        id
    FROM real_estate.flats
    WHERE
        total_area < (SELECT total_area_limit FROM limits)
        AND (rooms < (SELECT rooms_limit FROM limits) OR rooms IS NULL)
        AND (balcony < (SELECT balcony_limit FROM limits) OR balcony IS NULL)
        AND (
            (ceiling_height < (SELECT ceiling_height_limit_h FROM limits)
             AND ceiling_height > (SELECT ceiling_height_limit_l FROM limits))
            OR ceiling_height IS NULL
        )
),
-- Categorize listings by exposure duration:
duration_category AS (
    SELECT
        id,
        CASE
            WHEN days_exposition >= 1  AND days_exposition <= 30  THEN '1 month'
            WHEN days_exposition > 30  AND days_exposition <= 90  THEN '1 to 3 months'
            WHEN days_exposition > 90  AND days_exposition <= 180 THEN '3 to 6 months'
            WHEN days_exposition > 180                           THEN '6 plus months'
            ELSE 'non category'
        END AS ad_duration_category
    FROM real_estate.advertisement
    WHERE id IN (SELECT * FROM filtered_id)
),
-- Derive region-level classification:
cities AS (
    SELECT
        city_id,
        city,
        CASE
            WHEN city <> 'Санкт-Петербург' THEN 'Ленинградская область'
            ELSE 'Санкт-Петербург'
        END AS city_type
    FROM real_estate.city
)
-- Aggregate data and calculate key metrics:
SELECT
    city_type,
    ad_duration_category,
    COUNT(id) AS total_apartments,
    ROUND(
        COUNT(id)
        / SUM(COUNT(id)) OVER (PARTITION BY city_type),
        3
    ) * 100 AS total_apartments_share,
    ROUND(AVG(a.last_price / f.total_area)::numeric, 2) AS avg_price_sq_m,
    ROUND(AVG(total_area)::numeric, 2)                  AS avg_area,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY rooms)   AS median_rooms,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY balcony) AS median_balconies,
    ROUND(AVG(ceiling_height)::numeric, 2) AS avg_ceiling_height,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY floors_total) AS median_floors_total,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY floor)        AS median_floor,
    ROUND(
        COUNT(CASE WHEN rooms = 0 THEN 1 END)
        / COUNT(id)::NUMERIC,
        3
    ) * 100 AS studios_share,
    ROUND(SUM(is_apartment) / COUNT(id)::NUMERIC, 3) * 100 AS apartments_share,
    ROUND(SUM(open_plan)   / COUNT(id)::NUMERIC, 3) * 100 AS open_plan_share,
    ROUND(AVG(airports_nearest)::numeric, 2) AS avg_airport_distance_m,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY parks_around3000) AS median_parks_around,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ponds_around3000) AS median_ponds_around
FROM real_estate.flats AS f
LEFT JOIN real_estate.advertisement AS a USING (id)
LEFT JOIN cities AS c USING (city_id)
LEFT JOIN duration_category USING (id)
WHERE
    id IN (SELECT * FROM filtered_id)
    AND a.first_day_exposition BETWEEN '2015-01-01' AND '2018-12-31'
    AND type_id IN (
        SELECT type_id
        FROM real_estate."type"
        WHERE "type" = 'город'
    )
GROUP BY
    ad_duration_category,
    city_type
ORDER BY
    city_type DESC,
    ad_duration_category ASC,
    total_apartments DESC;