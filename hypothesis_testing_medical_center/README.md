# EDA and Hypothesis Testing: Medical Center

## Goal
Conduct an exploratory analysis and statistical hypothesis testing on hospital admission data in order to assess hospitalization duration patterns.

## Tools & Stack
- **Language:** Python  
- **Libraries:** pandas, numpy, matplotlib, seaborn, scipy.stats  
- **Format:** Jupyter Notebook

## Data
inpatient admissions data from the federal medical center (SPbGPMU), including admission/discharge dates, department information, admission type (planned vs. emergency), and length of stay (bed-days).

## Key Steps
1. **Data overview and preprocessing** (type casting, missing values, duplicates, and basic data quality checks)
2. **Hospitalization duration analysis** (descriptive statistics and distribution)
3. **Department-level analysis** (comparison of average hospitalization duration across departments)
4. **Admissions seasonality analysis** (monthly dynamics across years)
5. **Hypothesis testing**:
  - One-sample t-test vs. 7-day benchmark
  - One-sample t-test vs. 10-day benchmark (greater-than alternative)
  - Planned vs. emergency admissions comparison (Welch t-test + Mann–Whitney U check)

## Main Findings
- The distribution of hospitalization duration is **right-skewed** with a long tail: **median = 7 days**, **mean = 8.73 days**.
- The longest average hospitalization duration is observed in **ICU/anesthesiology** and **neonatal/perinatal** departments.
- Admissions show clear **seasonality**: peaks in **spring (Mar–May)** and **autumn (Oct–Nov)**, with lower volumes in **summer (Jul–Aug)**.
- Mean hospitalization duration is **statistically higher than the 7-day benchmark**.
- There is **no evidence that mean hospitalization duration exceeds 10 days** (not significant).
- Mean hospitalization duration differs significantly by admission type: **planned admissions** have longer stays than **emergency admissions**.

## Recommendations
- **Plan capacity beyond the 7-day benchmark.** Use hospitalization duration estimates based on observed performance and include buffer capacity for long-stay patients.
- **Differentiate planning by admission type.** Apply separate capacity assumptions and scheduling rules for planned vs. emergency flows.
- **Prioritize high–length-of-stay departments.** Focus capacity planning on ICU/anesthesiology and neonatal/perinatal departments.
- **Align staffing and beds with seasonality.** Increase staffing/bed availability ahead of seasonal peaks, and schedule elective activity during seasonal troughs.
