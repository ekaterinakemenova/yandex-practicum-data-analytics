/* =====================================================================
   Project: DonorSearch: Donor Behavior & Donation Activity Analysis

   Author: Ekaterina Kemenova
   Date: 01.08.2025

   Task:
   Analyze donor acquisition through social media channels and platforms
   to understand which channels attract more donors and how active
   these donors are in terms of confirmed donations.

   Output:
   - social_channel  — social network or platform used for registration
   - total_donors    — number of donors acquired through the channel
   - total_confirmed_donations - total number of confirmed donations
   - avg_donations  — average confirmed donations per donor
   ===================================================================== */
SELECT
    CASE
        WHEN autho_vk = 'True' THEN 'Вконтакте'
        WHEN autho_ok = 'True' THEN 'Одноклассники'
        WHEN autho_tg = 'True' THEN 'Телеграм'
        WHEN autho_yandex = 'True' THEN 'Яндекс'
        WHEN autho_google = 'True' THEN 'Google'
        ELSE 'Unknown'
    END AS social_channel,
    COUNT(DISTINCT id) AS total_donors,
    SUM(confirmed_donations) AS total_confirmed_donations,
    ROUND(AVG(confirmed_donations), 2) AS avg_donations
FROM donorsearch.user_anon_data
GROUP BY social_channel
ORDER BY total_donors DESC;