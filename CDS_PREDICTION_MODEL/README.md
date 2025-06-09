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

## 🚀 프로젝트 진행 현황 | Project Progress

### 2025-06-09 (Day 1)

#### 📊 Data Handling & Merging

- ✔️ CDS CSV 데이터 정리 및 Date 변환 (2008~2024 구간)
- ✔️ Macro Data 정리:
    - WTI 원유 가격
    - 한국 국채 1Y/10Y → Term Spread 계산
    - USD/KRW 환율
    - VIX 지수
    - KOSPI 지수
- ✔️ 위 변수들과 CDS 스프레드 데이터를 병합 → `CDS_merged_for_model.csv` 생성 완료

#### 🧪 ADF Test (정상성 검정)

- Spread: 정상성 확보
- WTI, Term Spread, EXR, VIX, KOSPI → 차분 후 정상성 확보
- 데이터 전처리 완료 (1차 차분 변수 `d_*` 생성)

#### 📈 Baseline Regression 결과

- 모델: **ΔSpread ~ ΔWTI + ΔTerm Spread + ΔEXR + ΔVIX + ΔKOSPI**
- 결과:
    - 모델 설명력 낮음 (Adj. R² ≈ 0.1%)
    - EXR만 약간 유의 (p < 0.05), 나머지 변수 유의하지 않음
- 해석:
    - Macro 변수의 일일 변화율로 CDS Spread 변화율 예측은 어려움 → CDS가 비선형적, 이벤트 기반 리스크 변수 특성이 강함
    - Baseline Regression은 음의 결과라도 연구/보고서 상 중요한 기본 단계 → 완료

#### ✅ 마무리

- 첫 번째 baseline regression 단계 완료
- 향후 방향:
    - Lag 구조 적용한 모델 시도 (ARDL-like 접근)
    - ΔSpread → event dummy 변수 활용한 고도화 가능성 검토
    - 추후 Bloomberg 등에서 실제 CDS 데이터 확보 시 benchmark 가능

---

## 📂 프로젝트 구조 | Project Structure

```plaintext
CDS_PREDICTION_MODEL/
├── README.md
├── LICENSE
├── .gitignore
├── CSV/
│   ├── *.csv
├── R_CODE/
│   ├── CDS_PREDIC_MODEL_CSV_HANDLING.R
│   ├── CSV_COM.R
│   ├── CDS_LM_MODEL.R
│   ├── MODEL_COM.R
│   ├── CDS_COM.R
├── docs/
│   ├── (EDA visualizations / plots)
```

---

## ✏️ 향후 계획 | Next Steps

- Lagged variable 기반 regression (ARDL-like structure) 적용
- VAR 모델 시도 가능성 검토
- Event dummy 설계 → 이벤트 기반 CDS 스프레드 반응 모델링 시도
- 실제 고품질 CDS 프리미엄 데이터 확보 후 모델 검증

---

