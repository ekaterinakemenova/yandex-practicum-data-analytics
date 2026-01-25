/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Identify the most active donors in the DonorSearch system,
   considering only registered and confirmed donations.

   Output:
   - id                    — unique donor identifier
   - confirmed_donations   — total number of confirmed donations
   ===================================================================== */
SELECT
    id,
    confirmed_donations
FROM donorsearch.user_anon_data
ORDER BY confirmed_donations DESC
LIMIT 10;