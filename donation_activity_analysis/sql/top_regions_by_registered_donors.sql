/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Identify regions with the highest number of registered donors
   in the DonorSearch system.

   Output:
   - region        — donor’s region of residence
   - total_donors  — number of registered donors in the region
   ===================================================================== */
SELECT
    region,
    COUNT(id) AS total_donors
FROM donorsearch.user_anon_data
GROUP BY region
ORDER BY total_donors DESC
LIMIT 10;