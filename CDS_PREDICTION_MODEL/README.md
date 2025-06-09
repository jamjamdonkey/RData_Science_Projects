# 📈 CDS Predict Model | CDS 예측 모델 프로젝트

---

## 🗂️ 프로젝트 개요 | Project Overview

이 프로젝트는 **대한민국 CDS(신용부도스왑, 5년물 기준) 스프레드**를 예측하는 베이스라인 머신러닝 모델을 구축하는 것을 목표로 합니다.  
실시간 CDS 데이터 확보가 어려운 상황에서, 본 프로젝트는 **공공 데이터 기반 프록시(Proxy) 데이터셋을 구축**하여 CDS 스프레드 움직임을 예측하고자 합니다.  
추후에는 실제 CDS 데이터(Bloomberg, 신용평가사 리포트 등)를 통한 벤치마킹까지 목표로 설정하였습니다.

This project aims to build a **baseline machine learning model to predict Korea CDS spread (5Y maturity)**.  
Since real-time CDS data is difficult to obtain, the project first constructs a **proxy dataset using publicly available macro and market data** to model the dynamics of the CDS spread.  
The goal is to later benchmark the model against actual CDS data (Bloomberg Terminal, credit agency reports).

---

## 🎯 프로젝트 목표 | Project Goal

- **한국 CDS 5Y 스프레드 예측용 베이스라인 머신러닝 모델 구축**  
- 실제 CDS 데이터를 확보하기 전까지는 **Proxy 데이터셋 기반 모델 개발**  
- 추후 공식 CDS 데이터와 비교(benchmarking) 및 모델 고도화 예정

- Build a **baseline machine learning model to predict Korea CDS 5Y spread**.
- Initially develop a model using **proxy dataset** (public market/macro data).
- Later, benchmark and refine the model with actual CDS spread data.

---

## ❓ 왜 CDS인가? | Why This Project?

**Korea CDS spread**는 **국가 신용 리스크(Sovereign Credit Risk)** 를 반영하는 핵심 지표입니다.  
금융 시장에서는 이미 다양한 자산을 통해 이러한 리스크를 "가격(price in)" 하고 있습니다:

- **채권 금리 커브** (1Y vs. 10Y 스프레드)
- **외환 시장** (USD/KRW 환율)
- **주식 시장** (KOSPI 지수)
- **글로벌 리스크 심리** (VIX 지수)
- **글로벌 매크로 지표** (WTI 원유 가격 등)

본 프로젝트의 가설은:  
**위 변수들이 CDS 스프레드 변동에 선행적(leading) 신호로 작용할 수 있다**는 것입니다.

---

**Korea CDS spread** is a key indicator of **sovereign credit risk**.  
Financial markets already "price" this risk through various channels:

- **Bond Yield Curve** (1Y vs. 10Y spread)
- **FX Market** (USD/KRW exchange rate)
- **Stock Market** (KOSPI Index)
- **Global risk sentiment** (VIX Index)
- **Global macro sentiment** (WTI crude oil price)

The project hypothesis is that **these variables can serve as leading indicators for CDS spread movements**.

---

## 🗃️ 데이터 소스 | Data Sources

| 변수 | Proxy / Source |
|------|----------------|
| 한국 국채금리 (1Y/10Y) | ECOS (한국은행) |
| USD/KRW 환율 | ECOS (한국은행) |
| KOSPI 지수 | KRX 공식 데이터 / ECOS |
| VIX 지수 | Yahoo Finance (Historical) |
| WTI 원유 가격 | Investing.com |
| 한국 CDS 5Y 스프레드 | Target → WorldGovernmentBonds (현재) / Bloomberg / 신용평가사 리포트 (향후) |

---

## 🗂️ 프로젝트 구조 | Project Structure

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
