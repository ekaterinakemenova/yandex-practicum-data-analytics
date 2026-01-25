/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Evaluate how the bonus system is associated with donation activity
   among registered donors in the DonorSearch system.

   Output:
   - bonus_use                  — donor group by bonus usage
   - total_donors               — number of donors in the group
   - total_confirmed_donations  — total confirmed donations in the group
   - avg_confirmed_donations    — average confirmed donations per donor
   ===================================================================== */
SELECT
    CASE
        WHEN id IN (
            SELECT user_id
            FROM donorsearch.user_anon_bonus
        ) THEN 'used bonus'
        WHEN id NOT IN (
            SELECT user_id
            FROM donorsearch.user_anon_bonus
        ) THEN 'not used bonus'
        ELSE 'other'
    END AS bonus_use,
    COUNT(DISTINCT id) AS total_donors,
    SUM(confirmed_donations) AS total_confirmed_donations,
    ROUND(AVG(confirmed_donations), 2) AS avg_confirmed_donations
FROM donorsearch.user_anon_data
GROUP BY bonus_use;