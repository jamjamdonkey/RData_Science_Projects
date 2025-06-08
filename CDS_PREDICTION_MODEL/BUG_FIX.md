# CDS Predict Model - Bug Fix & Lessons Learned 🐛

---

## 🐛 Bug 1️⃣ - CSV Header Issue → skip=1 required

```r
df_fx <- read.csv("KOR_USD_EXR_DYD.csv", skip = 1)
colnames(df_fx) <- c("date", "usdkrw")
df_fx$date <- as.Date(df_fx$date, format = "%Y/%m/%d")

df_kospi <- read.csv("KOSPI_IDX_DYD.csv", skip = 1)
colnames(df_kospi) <- c("date", "kospi")
df_kospi$date <- as.Date(df_kospi$date, format = "%Y-%m-%d")
```
## 🐛 Bug 2️⃣ - BOM / Whitespace Issue

```r
df_kospi$date <- trimws(df_kospi$date)
df_kospi$date <- as.Date(df_kospi$date, format = "%Y-%m-%d")

# or alternative
df_kospi$date <- gsub("[^0-9\\-]", "", df_kospi$date)
df_kospi$date <- as.Date(df_kospi$date, format = "%Y-%m-%d")
```

🐛 Bug 3️⃣ - inner_join → 0 rows
```
# Check date ranges first
range(df_band$date)
range(df_fx$date)
range(df_kospi$date)
range(df_vix$date)
range(df_wti$date)

# Use correct merge strategy
df_merged <- reduce(
  list(df_band, df_fx, df_kospi),
  ~ inner_join(.x, .y, by = "date")
) %>%
  left_join(df_vix, by = "date") %>%
  left_join(df_wti, by = "date")
```

🐛 Bug 4️⃣ - String Numbers → Numeric Conversion required
```
df_merged$usdkrw <- as.numeric(gsub(",", "", df_merged$usdkrw))
df_merged$kospi  <- as.numeric(gsub(",", "", df_merged$kospi))
```

🐛 Bug 5️⃣ - Duplicate Dates in Combined CSV (WTI, VIX)
```
df_vix <- df_vix[!duplicated(df_vix$date), ]
df_vix <- df_vix[order(df_vix$date), ]

df_wti <- df_wti[!duplicated(df_wti$date), ]
df_wti <- df_wti[order(df_wti$date), ]
```
