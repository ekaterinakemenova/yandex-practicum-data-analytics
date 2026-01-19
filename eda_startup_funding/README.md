# EDA: Startup Funding Analysis

## Goal

Conduct an exploratory analysis of the dynamics and structure of startup funding using historical data (1999-2014), in order to assess investment opportunities and inform a hypothetical market entry and company acquisition strategy.

## Tools & Stack

- **Language:** Python  
- **Libraries:** pandas, numpy, matplotlib, seaborn
- **Format:** Jupyter Notebook  

## Data

Company-level datasets covering startup attributes, funding rounds, investment volumes, and returns on investments by funding type.

## Key Steps

1. **Data overview and preprocessing** (type casting, date parsing, missing values, duplicates, and basic data quality checks)  
2. **Feature engineering** (funding timeline categories; market segmentation into mass / mid-size / niche)  
3. **Outlier detection and filtering** (IQR-based anomaly detection; restricting to years with sufficient activity)  
4. **Funding type analysis** (investment volume, adoption, and investment returns by funding type)  
5. **Trend and dynamics analysis** (funding rounds over time, market growth patterns, and return share dynamics)  
6. **Final conclusions and recommendations** 

## Main Findings

- **Funding timelines:** ~60% of companies raised funding only once, yet long-cycle companies (>1 year) attracted >60% of total investment volume.  
- **Market segments:** 88.8% of startups operate in mass markets (markets with >120 companies), indicating strong concentration in a limited set of large markets.  
- **Typical funding size:** Most companies raised between $350K and $24M (median ~$2M). Funding is heavily right-skewed with extreme outliers, especially in markets like real estate, entertainment, consulting, search, cloud computing.  
- **Funding types:** `venture`, `seed`, and `debt_financing` dominate by both total investment volume and adoption; by investment returns, `venture` leads, followed by `debt_financing` and `private_equity`.
- **Funding rounds:** From 2005 to 2013, average funding per round declined while total rounds increased; in 2014, total rounds fell and the decline in average round size stabilized.
- **Market growth:** The fastest-growing markets include technology, medical, internet, real estate, apps.
- **Investment returns:** In 2014, returns exceeded invested capital for `debt_financing`, `private_equity`, and `angel`. `Venture` leads in absolute returns, but return share remained below 1.0 across most years, improving after 2013 and approaching breakeven in 2014.

## Recommendations

- Focus on **fast-growing markets** such as **technology**, **medical**, **internet**, and **apps**.  
- Use **mass markets** as the baseline for stability and predictability, given their concentration and deeper deal flow.  
- Prioritize **debt financing** and **private_equity** when optimizing for **return share** (returns / invested capital), while keeping **venture** as a core option due to its dominant scale and improving return share trend.
- Target deals within the typical funding range of **$350K–$24M**.
