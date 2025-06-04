# 📁 Project: Suicide_Analyze

## 🧠 프로젝트 개요 | Project Overview

이 프로젝트는 “자살은 개인의 나약함”이라는 일각의 주장에 문제를 제기하며, 청년 자살률을 종속 변수로, 청년 실업률, 가계부채, 근로시간 등의 사회경제적 요인을 독립 변수로 설정한 다중회귀분석 모델을 구축하였습니다. 모든 변수는 Z-score 표준화를 거쳤으며, 이를 통해 자살이 개인의 문제가 아닌 사회 구조적 문제임을 통계적으로 입증하고자 하였습니다.

> This project challenges the narrative that suicide stems from personal weakness. Using a multiple regression model with youth suicide rates as the dependent variable and socio-economic factors such as youth unemployment, household debt, and working hours as independent variables (all standardized by Z-scores), it reveals suicide as a structural social issue.

또한, 자살과 같은 극단적 사회 현상이 사회 전체에 미치는 영향을 확인하기 위해 ‘자살’과 ‘칼부림’이라는 키워드를 중심으로 **구글 트렌드 데이터 시각화**, 단위근 검정(ADF) 및 그레인저 인과성 검정(Granger Test)을 통해 사회 감정의 전염 가능성을 분석했습니다.

> Furthermore, using Google Trends data for "suicide" and "stabbing", the project visualizes trends, preprocesses 5 years of data (as of June 2025), and performs ADF and Granger causality tests to explore how extreme social phenomena might influence or "infect" public sentiment.

---

## 📂 폴더 구조 | Folder Structure

- `CSV/`  
  - ‘자살’과 ‘칼부림’이라는 두 키워드를 구글 트렌드에 입력하여 수집한 최근 5년치(2020~2025)의 트렌드 데이터를 CSV로 저장  
  - _CSV files containing 5-year Google Trends data (2020–2025) for the keywords "suicide" and "stabbing"_

- `R_Code/`  
  - 회귀분석, 시계열 분석을 위한 R 코드  
  - _R scripts for statistical and time-series modeling_

- `Report_Kinda_Essay/`  
  - 분석 내용 기반 보고서 및 소논문 (.docx, .pdf 등)  
  - _Reports and essays summarizing the findings and interpretations_

---

✅ **마지막 수정일**: 2025년 6월 4일  
✍️ **작성자**: jamjamdonkey
