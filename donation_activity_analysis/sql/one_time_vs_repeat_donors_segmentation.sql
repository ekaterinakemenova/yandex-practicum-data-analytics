/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Compare one-time donors with repeat donors by segmenting donors
   based on the number of confirmed donations and calculating
   key activity metrics for each segment.

   Key assumptions:
   - Only donors with at least one confirmed donation are included
     (confirmed_donations >= 1).
   - Donors are segmented by confirmed donation count:
       • one_time:         1 donation
       • repeat_2_3:       2–3 donations
       • repeat_4_9:       4–9 donations
       • repeat_10_plus:   10+ donations

   Output:
   - donor_segment                   — donor activity segment
   - total_donors                    — number of donors in the segment
   - donors_share                    — segment share of donors
   - avg_confirmed_donations_per_donor
   - median_confirmed_donations_per_donor
   - total_confirmed_donations       — total confirmed donations in segment
   - confirmed_donations_share       — segment share of confirmed donations
   ===================================================================== */ 
SELECT
    CASE
        WHEN confirmed_donations = 1 THEN 'one_time'
        WHEN confirmed_donations BETWEEN 2 AND 3 THEN 'repeat_2_3'
        WHEN confirmed_donations BETWEEN 4 AND 9 THEN 'repeat_4_9'
        WHEN confirmed_donations >= 10 THEN 'repeat_10_plus'
    END AS donor_segment,
    COUNT(id) AS total_donors,
    ROUND(COUNT(id)::numeric / SUM(COUNT(id)) OVER (), 3) AS donors_share,
    ROUND(AVG(confirmed_donations), 3) AS avg_confirmed_donations_per_donor,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY confirmed_donations) AS median_confirmed_donations_per_donor,
    SUM(confirmed_donations) AS total_confirmed_donations,
    ROUND(
        SUM(confirmed_donations)::numeric / SUM(SUM(confirmed_donations)) OVER (),
        3
    ) AS confirmed_donations_share
FROM donorsearch.user_anon_data
WHERE confirmed_donations >= 1
GROUP BY donor_segment
ORDER BY total_donors DESC;