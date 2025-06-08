# CDS Predict Model 📈

A project to build a baseline machine learning model to predict Korea CDS spread (5Y target planned), using publicly available macro and market data.

---

## 📌 Project Goal

- Build a baseline machine learning model to **predict Korea CDS spread**.
- Since real-time CDS data is difficult to obtain, this project currently builds a **proxy dataset**.
- Goal: later benchmark with actual CDS data (Bloomberg, credit agency reports).

---

## 📌 Why This Project?

- Korea CDS spread is a key indicator of **sovereign credit risk**.
- Financial markets already "price" this risk through various channels:
  - Bond Yield Curve (1Y vs. 10Y spread)
  - FX Market (USD/KRW exchange rate)
  - Stock Market (KOSPI Index)
  - Global risk sentiment (VIX)
  - Global macro sentiment (WTI crude oil price)

- Hypothesis: these variables can serve as **leading indicators** for CDS movements.

---

## 📌 Data Sources

| Variable        | Proxy / Source                |
|-----------------|-------------------------------|
| Korea Bond 1Y/10Y | ECOS (Bank of Korea)         |
| USD/KRW          | ECOS (Bank of Korea)         |
| KOSPI Index      | KRX official data / ECOS     |
| VIX Index        | Yahoo Finance (Historical)   |
| WTI Crude Oil    | Investing.com                |
| Korea CDS 5Y Spread | Target → TBD (external source planned) |

---

## 📌 Project Structure

```plaintext
CDS_PREDICTION_MODEL/
├── README.md
├── LICENSE
├── .gitignore
├── data/
│   ├── *.csv
├── scripts/
│   ├── CDS_PREDIC_MODEL_CSV_HANDLING.R
│   ├── CSV_COM.R
│   ├── (future) CDS_PREDIC_MODEL_EDA.R
│   ├── (future) CDS_PREDIC_MODEL_BASELINE_ML.R
└── docs/
    └── (EDA visualizations / plots)
