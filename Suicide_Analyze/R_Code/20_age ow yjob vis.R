rm(list = ls())
# 청년 실업률 계산
yjob <- c(7.6, 7.5, 8.0, 9.0, 9.1, 9.8, 9.8, 9.5, 8.9, 9.0, 7.8, 6.4, 5.9)
mean_yjob <- mean(yjob)
sd_yjob <- sd(yjob)

# Z-스코어 계산
z_scores_yjob = (yjob - mean_yjob) / sd_yjob

# Z-스코어 출력
print(z_scores_yjob)


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
  z_scores_yjob = z_scores_yjob
)

# 다중회귀분석 모형 정의
model_20_ages <- lm(ysui_z ~ z_scores_yjob, data = ysui)


# 다중공선성 검정
library(car)

# 결과 출력
summary(model_20_ages)

data.frame(year = 2010:2022, yjob = yjob, ysui = ysui)



library(ggplot2)

# 회귀모형 summary 저장
model_summary <- summary(model_20_ages)

# p-value와 Adjusted R² 추출
p_val <- model_summary$coefficients[2, 4]
adj_r2 <- model_summary$adj.r.squared

# 원본 데이터 프레임 복원 (시각화용)
ysui$ysui_z <- z_scores_ysui
ysui$yjob_z <- z_scores_yjob

# 그래프
ggplot(ysui, aes(x = yjob_z, y = ysui_z)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", se = TRUE, color = "red", linetype = "dashed") +
  labs(title = "청년 실업률과 자살률 간 표준화 상관관계",
       x = "청년 실업률 (Z-score)",
       y = "청년 자살률 (Z-score)") +
  annotate("text", x = -1.5, y = 1.5,
           label = paste0("p-value: ", round(p_val, 4),
                          "\nAdjusted R²: ", round(adj_r2, 4)),
           hjust = 0, size = 5, color = "darkred")
