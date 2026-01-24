# A/B Test: Payment Funnel Conversion

## Goal
Analyze the results of an A/B experiment conducted by a large e-commerce platform to evaluate the impact of a redesigned payment funnel on purchase conversion.

## Tools & Stack
- **Language:** Python  
- **Libraries:** pandas, numpy, matplotlib, seaborn, scipy.stats, statsmodels  
- **Format:** Jupyter Notebook  

## Data
User-level datasets covering new user registrations (2025-06-01 to 2025-06-14), and their sessions and purchases during the A/B experiment period (2025-06-01 to 2025-06-21).

## Key Steps
1. **Data overview and preprocessing** (type casting, missing values, duplicates, basic data quality checks, filtering out unrelated tests)
2. **A/B test setup validation** (group balance, independence, device/region distributions)  
3. **Exploratory analysis of experiment metrics** (conversion by group, cumulative conversion and purchase dynamics, proxy metrics)  
4. **Statistical analysis of experiment results** (two-proportion z-test for conversion rate)    
5. **Interpretation and recommendations** based on observed effects  

## Main Findings
- The A/B experiment health checks passed: balanced group sizes, no user overlap, similar device and regional distributions.
- The primary metric — **purchase conversion rate** (buyers / registered users) — decreased in the test group:
  - Control (A): **29.54%**
  - Test (B): **18.39%**
  - Absolute change: **-11.14 percentage points**
  - Relative change: **-37.73%**
- The effect is **statistically significant** (two-proportion z-test, p-value = 6.13e-13 < 0.05).
- Cumulative dynamics support the result: cumulative purchases grow faster in group A, while registrations and sessions are similar between groups.

## Recommendations 
- **Do not roll out** the new payment funnel to production, as it leads to a **statistically significant and practically large drop** in purchase conversion.
- Run **diagnostics on the checkout flow** to identify where users drop off.
