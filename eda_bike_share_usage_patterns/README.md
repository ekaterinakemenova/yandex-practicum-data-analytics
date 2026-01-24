# EDA: Bike-Share Usage Patterns
Case study completed as the capstone project for the Google Data Analytics Professional Certificate (Coursera).

## Goal
Conduct an exploratory analysis of the Cyclistic bike-share program in order to identify behavioral differences between annual members and casual riders and to generate insights that can inform marketing strategies aimed at converting casual riders into annual members.

## Tools & Stack
- **Language:** R
- **Libraries:** tidyverse, ggplot2, lubridate, janitor, skimr
- **Format:** R Markdown → PDF report

## Data
Historical trip-level data from the Cyclistic bike-share service for Q1 2019 and Q1 2020 (the data has been made available by Motivate International Inc. under [this license](https://divvybikes.com/data-license-agreement)).

## Key Steps
1. **Data import and overview**
2. **Data preparation and cleaning** (converting timestamp fields, standardizing column names, recoding user types, calculating trip duration, removing zero/invalid trips, filtering internal “HQ QR” rides)
3. **Time-based analysis** (removing outliers, creating hour/weekday/month variables, identifying commuting vs leisure usage patterns)
4. **Station-level analysis** (identifying top start/end stations by user type, mapping geographic differences in usage)
5. **Demographic analysis** (age calculation, filtering unrealistic ages, gender distribution comparison, noting data limitations)

## Main Findings
- **Members**: short rides (avg. ~9 min), weekday & rush hour peaks → commuter behavior  
- **Casual riders**: longer rides (avg. ~21 min), weekend & afternoon peaks → leisure/tourist behavior  
- Noticeable **seasonal effect** for casual riders; stable usage among members  
- Demographically, casual riders are younger on average (~29 vs. ~37 for members) and more gender-balanced (69% male / 31% female), while members are predominantly male (81%).

## Recommendations
- Offer flexible/seasonal membership options for frequent casual riders.  
- Promote commuting-related benefits to casual riders with weekday usage. 
- Tailor marketing campaigns to women riders (safety, comfort, routes).  
- Combine targeted conversion strategies with broader outreach near commuter hubs.
