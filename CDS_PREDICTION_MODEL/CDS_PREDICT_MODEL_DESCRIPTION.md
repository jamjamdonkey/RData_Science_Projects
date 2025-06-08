# CDS Predict Model - Project Description 📝

## 📌 Project Goal

- Build a baseline machine learning model to **predict Korea CDS spread (5Y target planned)**.
- Since real-time CDS data is difficult to obtain, this project currently builds a base dataset from publicly available macro and market data.
- The goal is to later **benchmark the model using actual CDS data** (e.g. from Bloomberg / credit agency reports).

## 📌 Why This Project?

- Korea CDS spread is a key indicator of perceived **sovereign credit risk**.
- Financial markets already "price" this risk through various channels:
  - Bond Yield Curve (1Y vs. 10Y spread)
  - FX Market (USD/KRW exchange rate)
  - Stock Market (KOSPI Index)
  - Global risk sentiment (VIX)
  - Global macro sentiment (WTI crude oil price)

- Hypothesis: these variables can serve as **leading indicators** for CDS movements.

## 📌 Data Sources

| Variable        | Proxy / Source                |
|-----------------|-------------------------------|
| Korea Bond 1Y/10Y | ECOS (Bank of Korea)         |
| USD/KRW          | ECOS (Bank of Korea)         |
| KOSPI Index      | KRX official data / ECOS     |
| VIX Index        | Yahoo Finance (Historical)   |
| WTI Crude Oil    | Investing.com                |
| Korea CDS 5Y Spread | Target → TBD (external source planned) |

## 📌 Project Flow

1️⃣ Data Collection → CSV saved locally  
2️⃣ Data Cleaning & Merging → df_merged  
3️⃣ EDA → correlation / trend visualization  
4️⃣ Baseline ML Model → predict (proxy) CDS spread  
5️⃣ Future plan: Integrate actual CDS spread → supervised learning

## 📌 Current Status

- [x] All core CSV collected & merged (WTI, VIX, Bond, FX, KOSPI)
- [ ] CDS spread acquisition → pending
- [ ] EDA → upcoming
- [ ] ML baseline → upcoming

## 📌 Next Steps

- Proceed to EDA (EDA template ready)
- Finalize CDS data acquisition method (possible sources: Bloomberg, credit agency reports, academic papers)
- Iterate baseline model
