/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025
   
   Task:
   Analyze the distribution of confirmed donation volume across
   age and gender segments to understand how donation activity
   varies by demographic group.

   Key assumptions:
   - Age is calculated in full years using the current date.
   - Only donors with a known birth date are included.
   - Donors are segmented into the following age groups:
       • 18–24
       • 25–34
       • 35–44
       • 45–54
       • 55+
       
   Output:
   - gender                     — donor gender
   - age_group                  — donor age segment
   - total_confirmed_donations  — total confirmed donations in the segment
   - total_confirmed_donations_share — share of total confirmed donations
   ===================================================================== */
SELECT
    gender,
    CASE
        WHEN EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) BETWEEN 18 AND 24 THEN '18-24'
        WHEN EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) BETWEEN 25 AND 34 THEN '25-34'
        WHEN EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) BETWEEN 35 AND 44 THEN '35-44'
        WHEN EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) BETWEEN 45 AND 54 THEN '45-54'
        WHEN EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) >= 55 THEN '55+'
    END AS age_group,
    SUM(confirmed_donations) AS total_confirmed_donations,
    ROUND(SUM(confirmed_donations)::numeric / SUM(SUM(confirmed_donations)) OVER (), 3) AS total_confirmed_donations_share
FROM donorsearch.user_anon_data
WHERE birth_date IS NOT NULL
GROUP BY 1, 2
ORDER BY total_confirmed_donations DESC;