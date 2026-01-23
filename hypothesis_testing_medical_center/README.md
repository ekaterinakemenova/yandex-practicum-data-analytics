# EDA and Hypothesis Testing: Medical Center

## Goal
Conduct an exploratory analysis and statistical hypothesis testing on hospital admission data in order to assess hospitalization duration patterns and deviations from standard medical benchmarks.

## Tools & Stack
- **Language:** Python  
- **Libraries:** pandas, numpy, matplotlib, seaborn, scipy.stats  
- **Format:** Jupyter Notebook

## Data
Inpatient admission-level dataset from the federal medical center (SPbGPMU), covering admission/discharge dates, department, admission type (planned vs. emergency), and length of stay (bed-days).

## Key Steps
1. **Data overview and preprocessing** (type casting, missing values, duplicates, and basic data quality checks)
2. **Hospitalization duration analysis**
3. **Department-level analysis** (comparison of average hospitalization duration across departments)
4. **Admissions seasonality analysis** (monthly dynamics across years)
5. **Hypothesis testing** (7-day benchmark, 10-day benchmark, planned vs. emergency)

## Main Findings
- The distribution of hospitalization duration is **right-skewed** with a long tail; **median = 7 days**, **mean = 8.73 days**.
- The longest average hospitalization duration is observed in **ICU/anesthesiology** and **neonatal/perinatal** departments (top department mean ≈ 45 days).
- Admissions show clear **seasonality**: peaks in **spring (Mar–May)** and **autumn (Oct–Nov)** and decline in **summer (Jul–Aug)**.
- Mean hospitalization duration: **differs from the 7-day benchmark**; **does not exceed 10 days**; differs significantly by admission type (**planned admissions** have longer stays than **emergency admissions**).

## Recommendations
- **Plan capacity beyond the 7-day benchmark:** include buffer capacity for long-stay patients.
- **Differentiate planning by admission type:** use separate planning assumptions for planned vs. emergency flows.
- **Prioritize high–length-of-stay departments:** focus capacity planning on ICU/anesthesiology and neonatal/perinatal departments.
- **Use seasonality for tactical planning:** increase staffing/bed availability ahead of seasonal peaks and schedule elective activity and maintenance during troughs.
