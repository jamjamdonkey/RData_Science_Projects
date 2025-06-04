# 📁 R_Code

이 폴더에는 본 프로젝트의 주요 분석에 사용된 R 스크립트들이 포함되어 있습니다.

## 📦 사용된 주요 패키지 목록

분석을 재현하기 위해 다음 R 패키지들을 설치해 주세요:

```r
install.packages(c(
  "ggplot2",    # 시각화
  "tseries",    # ADF 단위근 검정
  "lmtest",     # Granger 인과성 검정
  "vars",       # VAR 모델링 및 IRF, FEVD
  "car"         # 다중공선성 검정 (VIF)
))
