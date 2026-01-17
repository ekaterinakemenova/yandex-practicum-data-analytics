# A/B Test: Recommendation Algorithm

## Goal

Design and evaluate an A/B test for a new recommendation algorithm in an entertainment app with an infinite content feed, in order to assess its impact on user engagement. 

## Tools & Stack

- **Language:** Python  
- **Libraries:** pandas, matplotlib, seaborn, scipy, statsmodels  
- **Format:** Jupyter Notebook  

## Data

Session-level datasets covering historical session data and the A/B experiment.

## Key Steps

1. **Exploratory data analysis** of historical sessions to validate data quality and establish baseline engagement metrics  
2. **A/B test design**: definition of the primary metric, hypotheses, sample size, and test duration  
3. **Experiment monitoring and validation**
4. **Results analysis**: evaluation of the primary metric and statistical significance
5. **Interpretation and recommendations** based on observed effects  

## Main Findings

- The primary metric — **share of successful sessions** (sessions with 4+ page views) — increased in the test group  
- Test group vs. control group:
  - Control (A): ~30.8% successful sessions  
  - Test (B): ~31.8% successful sessions  
  - Absolute uplift: **~1.1 percentage points**  
  - Relative uplift: **~3.4%**  
- The effect is **statistically significant** (two-proportion z-test, p-value = 0.0003)  
- All experiment health checks passed: balanced group sizes, no user overlap, and similar device and regional distributions  

## Recommendations

- Consider rolling out the new recommendation algorithm based on the statistically significant uplift in engagement
