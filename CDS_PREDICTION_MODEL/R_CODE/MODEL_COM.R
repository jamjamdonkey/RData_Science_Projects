rm(list = ls())
# 패키지 로드
library(readr)
library(dplyr)

# CSV 불러오기 + Date 처리
df_cds <- read_csv("KOR_CDS_2008_2024_combined.csv")

df_wti <- read_csv("WTI_IDX_DYD.csv")
df_wti$Date <- as.Date(df_wti$date)

df_gov <- read_csv("KOR_GOVBOND_1Y_10Y_DYD.csv")
# 1️⃣ Date 변환
df_gov$변환 <- as.Date(df_gov$변환)

# 2️⃣ 컬럼명 변경
df_gov <- df_gov %>% rename(
  Date = 변환,
  GOV_1Y = `원자료...2`,
  GOV_10Y = `원자료...3`
)

# 3️⃣ 확인
glimpse(df_gov)

df_exr <- read_csv("KOR_USD_EXR_DYD.csv")
df_exr$변환 <- as.Date(df_exr$변환)
df_exr <- df_exr %>% rename(
  Date = 변환,
  EXR = `원자료`
)
df_vix <- read_csv("VIX_IDX_DYD.csv")
df_vix$Date <- as.Date(df_vix$date)
df_vix <- df_vix %>% rename(VIX = vix)

df_kospi <- read_csv("KOSPI_IDX_DYD.csv")
df_kospi$변환 <- as.Date(df_kospi$변환)

df_kospi <- df_kospi %>% rename(
  Date = 변환,
  KOSPI = `원자료`
)

# 병합 시작 (CDS 기준 Left Join)
df_merged <- df_cds %>%
  left_join(df_wti %>% select(Date, wti), by = "Date") %>%
  left_join(df_gov %>% mutate(Term_Spread = GOV_10Y - GOV_1Y) %>% select(Date, Term_Spread), by = "Date") %>%
  left_join(df_exr %>% select(Date, EXR), by = "Date") %>%
  left_join(df_vix %>% select(Date, VIX), by = "Date") %>%
  left_join(df_kospi %>% select(Date, KOSPI), by = "Date")

# 병합 결과 확인
glimpse(df_merged)
summary(df_merged)

# 최종 분석용 DataFrame (NA 제거)
df_final <- df_merged %>%
  select(Date, Spread, wti, Term_Spread, EXR, VIX, KOSPI) %>%
  na.omit()

# 최종 확인
summary(df_final)
nrow(df_final)  # 사용 가능한 최종 관측치 수

# (Optional) 저장
write_csv(df_final, "CDS_merged_for_model.csv")
cat("✅ 최종 병합 완료 → CDS_merged_for_model.csv 저장 완료!")

