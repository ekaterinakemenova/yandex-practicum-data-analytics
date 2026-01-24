# EDA: Moscow Food Service Market

## Goal
Conduct an exploratory analysis of the Moscow food service market as of summer 2022 to understand its structure and key patterns and to support data-driven decisions on market entry.

## Tools & Stack
- **Language:** Python  
- **Libraries:** pandas, numpy, matplotlib, seaborn, phik  
- **Format:** Jupyter Notebook  

## Data
Venue-level datasets covering venue attributes, location, chain affiliation, ratings, operating hours, seating capacity, pricing indicators.

## Key Steps
1. **Data overview and preprocessing** (merging datasets, type casting, missing values, duplicates, and basic data quality checks)
2. **Feature engineering** (`is_24_7` flag for round-the-clock venues)  
3. **Market structure analysis** (venue categories and administrative district distribution)  
4. **Chain vs. independent analysis** (overall split and category-level chain penetration)  
5. **Capacity and pricing analysis** (seats distribution; average rating patterns; correlation checks; average bill analysis by district)

## Main Findings
- **Venue categories:** The largest categories are cafés (2,376), restaurants (2,042), and coffee shops (1,413), indicating strong and stable demand. 
- **Location:** The Central Administrative District contains the highest venue density (2,242, ~27% of all venues). Other districts typically have ~700–900 venues. 
- **Chain presence:** Independent venues dominate (62% vs. 38% chain venues). Chain penetration is highest in bakeries (~61%), pizzerias (~52%), and coffee shops (~51%), suggesting stronger scalability for these categories.  
- **Seating capacity:** Typical seating capacity ranges from 50 seats (bakeries) to 86 seats (restaurants).
- **Ratings:** Average ratings are stable across categories (overall mean ~4.23). Bars/pubs, pizzerias, and restaurants slightly outperform the market average, while fast food has the lowest mean rating.
- **What drives ratings:** Ratings show a moderate positive association with price category (phi_k ~0.26). Higher-priced venues tend to have higher ratings.
- **Pricing vs. location:** Average bill size increases with proximity to the city center. The Central and Western Administrative Districts show the highest median average bill (₽1,000).

## Recommendations
- Prioritize launch formats with proven demand: **café**, **coffee shop**, or **restaurant**.  
- If budget allows, target the **Central Administrative District** for the highest foot traffic and average bill; if cost-sensitive, consider the **Western Administrative District** as a strong alternative with a high average bill and sufficient venue density.  
- Position the venue in **mid-range or above-average price segments**, as these are associated with higher customer ratings.  
- Use a capacity benchmark of **~50–86 seats** as a practical target for initial site selection.  
- If entering the coffee shop segment, treat the first venue as a pilot; positive traction can justify **scaling via a chain model**.
