/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Study the monthly dynamics of the total number of donations
   for 2022 and 2023.

   Output:
   - donation_month — month of donation (YYYY-MM-01)
   - count (id)     — total number of donations in the given month
   ===================================================================== */
SELECT
    date_trunc('month', donation_date)::date AS donation_month,
    count (id)
FROM donorsearch.donation_anon
WHERE extract (year from donation_date) = 2022
   OR extract (year from donation_date) = 2023
GROUP BY date_trunc('month', donation_date)
ORDER BY donation_month ASC;