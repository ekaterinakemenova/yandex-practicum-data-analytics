/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Compare planned donations with actual donations to evaluate
   planning effectiveness in the DonorSearch system.

   Key assumptions:
   - A plan is considered "completed" if there exists a donation record
     for the same user on the same date (plan_date = donation_date).
   - Donation plans and actual donations are matched by:
       • user_id
       • date (planned date equals actual donation date)
   - Results are grouped by donation_type to compare planning
     effectiveness across donation types.

   Output:
   - donation_type             — donation type segment
   - total_planned_donations   — number of planned donations
   - total_completed_donations — number of plans matched to actual donations
   - completion_rate           — completion rate of planned donations
   ===================================================================== */
WITH planned_donations AS (
    SELECT DISTINCT
        user_id,
        donation_date AS plan_date,
        donation_type
    FROM donorsearch.donation_plan
),
completed_donations AS (
    SELECT DISTINCT
        user_id,
        donation_date
    FROM donorsearch.donation_anon
),
planned_vs_completed AS (
    SELECT
        pd.user_id,
        pd.plan_date,
        pd.donation_type,
        CASE
            WHEN cd.user_id IS NOT NULL THEN 1
            ELSE 0
        END AS is_completed
    FROM planned_donations AS pd
    LEFT JOIN completed_donations AS cd
        ON  pd.user_id   = cd.user_id
        AND pd.plan_date = cd.donation_date
)
SELECT
    donation_type,
    COUNT(plan_date) AS total_planned_donations,
    SUM(is_completed) AS total_completed_donations,
    ROUND(SUM(is_completed)::numeric / COUNT(plan_date), 3) AS completion_rate
FROM planned_vs_completed
GROUP BY donation_type
ORDER BY donation_type;