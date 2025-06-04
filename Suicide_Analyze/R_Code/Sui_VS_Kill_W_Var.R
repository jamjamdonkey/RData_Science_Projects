rm(list = ls())
# 1. CSV 불러오기
data <- read.csv("3y.sui.vs.knifend_0.5.csv")

# 2. 결측치 제거 전 확인
print(colnames(data))         # 컬럼명 확인
print(summary(data))          # 요약 정보 확인

# 3. 시계열 벡터로 만들기
x_raw <- data$VAR1
y_raw <- data$VAR2

# 4. 동시에 NA 없는 인덱스만 사용
valid_idx <- complete.cases(x_raw, y_raw)
x <- x_raw[valid_idx]
y <- y_raw[valid_idx]

# 5. 길이 맞추기
min_len <- min(length(x), length(y))
x <- x[1:min_len]
y <- y[1:min_len]

# 6. 교차상관 계산 (plot = FALSE 하면 결과 저장됨)
ccf_result <- ccf(x, y, lag.max = 20, plot = FALSE)

# 7. 표로 정리
ccf_table <- data.frame(
  Lag = ccf_result$lag,
  Correlation = round(ccf_result$acf, 3)
)

library(tseries)
adf.test(x)  # 자살 검색량
adf.test(y)  # 칼부림 검색량

library(lmtest)


# Granger 인과성 검정: x가 y를 예측하는가? - 결론 y가 x를 예측한다.
grangertest(y ~ x, order = 13)
grangertest(x ~ y, order = 13)

# X Y 를 하나의 벡터로 합쳐보자
xybind <- cbind(x,y)

#벡터 자기 회귀 VAR 모델 
library(vars)

VARselect(xybind, lag.max=20,
          type="const")[["selection"]]

# 앞서나온 P를 16으로 잡고 계산
var1 <- VAR(xybind, p=16, type="const")
summary(xybind)
serial.test(var1, lags.pt=26, type="PT.asymptotic")

#특성근 확인
roots(var1)

#그레인저 인과관계 검정 - 결론 칼부림 검색량(y)이 자살 검색량(x)을 예측가능함
causality(var1, cause = "x")
causality(var1, cause = "y")

# 칼부림 충격후 자살 검색 임펄스 리스폰스 펑션 - 결론 칼부림 후 약 13일부터 자살 검색량이 증가하고
# 14일 정도에 준피크, 한번 꺾인 후 16일 정도 후에 피크를 맞이하며, 19일정도 지속된다. 
install.packages("ggplot2")
library(ggplot2)
irf_results <- irf(var1, impulse = "y", "x", n.ahead = 20, boot = TRUE, ci = 0.95) 
plot(irf_results)
summary(irf_results)

# 예측오차 분산분해(fevd) - 이 충격이 과연 '자살' 검색량 전체 변동성의 몇 퍼센트나 차지하는지
# irf 예측 결과와 일치! 이는 irf 결과가 노이즈가 아니라는것 증명. 14일차에 50퍼 16일부터 75퍼에 육박
fevd_results <- fevd(var1, n.ahead = 20)
print(fevd_results)
plot(fevd_results)