# Real Estate Market Analysis (Saint Petersburg & Leningrad Region)

## Goal
Analyze historical real estate listings in Saint Petersburg and the Leningrad Region to identify high-demand market segments and seasonal patterns, in order to support data-driven market entry and marketing decisions.

## Tools & Stack
- **Language:** SQL  
- **BI tool:** Yandex DataLens  
- **Format:** SQL scripts + interactive dashboard

## Data
Historical real estate listings for Saint Petersburg and the Leningrad Region, covering the period from 2014-11-27 to 2019-05-03.

## Key Steps
1. **Database exploration and data quality filtering**
2. **Listing exposure time analysis:**
   - Exposure duration buckets: 1–30, 31–90, 91–180, 181+ days, plus non category
   - Comparison between Saint Petersburg vs. Leningrad Region
   - Calculation of aggregated metrics per segment: price per m², area, rooms, balconies, studio share, apartment/open-plan share
3. **Seasonality analysis of listing activity:**
   - Monthly distribution of listing publications and removals
   - Comparison of seasonal peaks and troughs across activity types
   - Evaluation of monthly dynamics in price per m² and average property size
4. **Dashboard creation in DataLens**

## Main Findings
- **Market structure:** ~85% of listings are located in cities, so city-level segments drive overall demand patterns.
- **Most common listing durations:**: In both regions, the largest share of listings remains active **181+ days (~31%)**, followed by **31–90 days** (~27% in Saint Petersburg; ~31% in Leningrad Region).
- **Demand drivers differ by region:**
  1. **Saint Petersburg:** Higher price per m² and larger area are associated with **longer time-to-sale**; smaller and more affordable apartments sell faster.
  2. **Leningrad Region:** The relationship between price/area and time-to-sale is weaker, indicating a more heterogeneous market.
- **Regional contrast:** Saint Petersburg has **significantly higher prices per m² (≈1.5–2×)** and slightly larger apartments than the Leningrad Region.
- **Seasonality:** Market activity peaks in **autumn (September–November)** and is lowest in **spring (April–May)**. Seasonality affects listing volume, not prices or apartment size.

## Recommendations

- **Plan market entry and major marketing campaigns for autumn (Sep–Nov)** when both supply and demand are at their highest.
- **Differentiate strategy by region:** In **Saint Petersburg**, expect **longer sales cycles** for **large and expensive** properties. For faster turnover, prioritize **smaller and more affordable** inventory, which tends to exit the market quicker.
