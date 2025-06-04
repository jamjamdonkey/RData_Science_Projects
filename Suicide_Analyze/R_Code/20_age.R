rm(list = ls())
# 청년 실업률 계산
yjob <- c(7.6, 7.5, 8.0, 9.0, 9.1, 9.8, 9.8, 9.5, 8.9, 9.0, 7.8, 6.4, 5.9)
mean_yjob <- mean(yjob)
sd_yjob <- sd(yjob)

# Z-스코어 계산
z_scores_yjob = (yjob - mean_yjob) / sd_yjob

# Z-스코어 출력
print(z_scores_yjob)

# 지니계수 계산
gini <- c(0.387, 0.383, 0.370, 0.361, 0.350, 0.353, 0.352, 0.342, 0.336, 0.328, 0.329, 0.324, 0.323)
mean_gini <- mean(gini)
sd_gini <- sd(gini)

# 지니계수 Z-스코어 계산
z_scores_gini = (gini - mean_gini) / sd_gini

# 가계 부채 계산
debt <- c(144.1, 144.8, 146.2, 147.7, 151.7, 162.6, 170.3, 173.0, 173.7, 182.9, 194.3, 191.4, 186.5)
mean_debt <- mean(debt)
sd_debt <- sd(debt)

# 가계 부채 Z-스코어 계산
z_scores_debt = (debt - mean_debt) / sd_debt

# work 계산
work <- c(180.8, 173.7, 167.9, 165.5, 173.5, 171.1, 168.5, 156.4, 152.4, 163.6, 164.2, 154.9, 157.6)
mean_work <- mean(work)
sd_work <- sd(work)

# work Z-스코어 계산
z_scores_work = (work - mean_work) / sd_work



# 청년 자살률
ysui <- c(24.3, 19.5, 18.0, 17.8, 16.4, 16.4, 16.4, 17.6, 19.2, 21.7, 23.5, 21.4, 22.2)
mean_ysui <- mean(ysui)
sd_ysui <- sd(ysui)

# Z-스코어 계산
z_scores_ysui = (ysui - mean_ysui) / sd_ysui

# Z-스코어 출력
print(z_scores_ysui)


# DF 생성
ysui <- data.frame(
  ysui_z = z_scores_ysui,
  z_scores_yjob = z_scores_yjob,
  z_scores_gini = z_scores_gini,
  z_scores_work = z_scores_work,
  z_scores_debt = z_scores_debt
)

# 다중회귀분석 모형 정의
model_20_ages <- lm(ysui_z ~ z_scores_yjob + z_scores_gini + z_scores_work + z_scores_debt , data = ysui)


# 다중공선성 검정
library(car)
vif(model_20_ages)

# 결과 출력
summary(model_20_ages)