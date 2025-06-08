# CDS Prediction Model Project - Data Handling Notes 📝

## 📌 Project Purpose

- Build baseline dataset for predicting Korea CDS Spread (proxy, to be added later)
- Merge macro-economic and financial market data:
  - Korea Government Bond 1Y / 10Y
  - USD/KRW Exchange Rate
  - KOSPI Index
  - VIX Index
  - WTI Crude Oil Price

---

## 📌 CSV Handling - Key Learnings & Pitfalls 🚩

### 1️⃣ CSV Header Issue (`skip = 1` required)

- ECOS CSV often contains Korean header row.
- Without `skip = 1`, `read.csv()` reads header as actual data.
- Solution:

```r
df_fx <- read.csv("KOR_USD_EXR_DYD.csv", skip = 1)
colnames(df_fx) <- c("date", "usdkrw")
df_fx$date <- as.Date(df_fx$date, format = "%Y/%m/%d")
