# DonorSearch: Donor Behavior & Donation Activity Analysis

## Goal
Analyze donor behavior and donation activity on the DonorSearch platform in order to support data-driven decisions for improving donor retention, engagement, and overall donation volume.

## Tools & Stack
- **Language:** SQL (PostgreSQL)
- **Format:** SQL scripts

## Data
Anonymized data from the DonorSearch platform, including: donor profiles and aggregated donation metrics, individual donation records, planned donation records, bonus usage history.

## Key Steps
1. **Regional analysis of donor distribution**
2. **Donation activity dynamics** (monthly aggregation of total donations for 2022 and 2023)
3. **Identification of highly active donors**
4. **Bonus system analysis** (comparison of donation activity between donors who used bonuses and those who did not)
5. **Donor acquisition channels analysis**
6. **One-time vs. repeat donors** (segmentation and comparison based on confirmed donation counts)
7. **Planned vs. actual donations** (evaluation of donation planning effectiveness)
   
## Main Findings
- **Geographic concentration:** Donor activity is highly concentrated in large urban regions. **Moscow and Saint Petersburg** account for the largest share of registered donors.
- **Donation dynamics:** Donation activity increased throughout 2022, peaking toward the end of the year, and then **declined across 2023**, especially in the second half, indicating potential engagement or external challenges.
- **Donor inequality:** More than **50% of donors donate only once**, while a small group (~14%) of **highly active repeat donors (10+ donations) generates over two-thirds (68%) of all confirmed donations**, making retention the key driver of total donation volume.
- **Bonuses and engagement:** Donors who use bonuses are few in number but demonstrate a **~18 times higher average donation activity**, suggesting that incentive mechanisms are strongly associated with sustained engagement.
- **Planning effectiveness:** Conversion from planned to actual donations is relatively low (**~22% for unpaid and ~13% for paid donations**), indicating friction between intent and action.
- **Acquisition channels:** VKontakte is the largest acquisition channel by volume, while smaller channels (Yandex, Google, Telegram) show higher average donations per donor.

## Recommendations
- **Focus on donor retention:** Prioritize strategies aimed at repeat donors, as they drive the majority of total donations.
- **Expand bonus programs:** Test broader and more targeted bonus programs to increase engagement beyond the current small but highly active bonus-using group.
- **Improve donation planning workflows:** Introduce reminders, flexible rescheduling, and clearer follow-ups to increase plan-to-donation conversion rates.
- **Investigate the 2023 decline:** Explore external factors or product changes that may explain the observed decrease in donation activity in 2023.
