rm(list = ls())
# 패키지 로드
library(dplyr)
library(readr)

# X → Date 변환 함수 정의
x_to_date <- function(x) {
  year <- floor(x)
  frac <- x - year
  day_of_year <- round(frac * 365)
  as.Date(paste0(year, "-01-01")) + day_of_year
}
# 1 CSV 읽기
df1_raw <- read_csv("CDS_08_10.csv", skip = 1, col_names = c("X", "Spread"))

# 2 숫자형 필터링
df1_clean <- df1_raw %>%
  filter(grepl("^[0-9\\.]+$", X), grepl("^[0-9\\.]+$", Spread))

# 3 확인 (숫자형만 남았는지 확인)
unique(df1_clean$X)

# 4 변환 적용
df1 <- df1_clean %>%
  mutate(X = as.numeric(X),
         Spread = as.numeric(Spread),
         Date = x_to_date(X),
         Spread = round(Spread, 3))

# 5 결과 확인
head(df1)

# CSV_11_15
df2_raw <- read_csv("CDS_11_15.csv", skip = 1, col_names = c("X", "Spread"))
df2_clean <- df2_raw %>%
  filter(grepl("^[0-9\\.]+$", X), grepl("^[0-9\\.]+$", Spread))
unique(df2_clean$X)
df2 <- df2_clean %>%
  mutate(X = as.numeric(X),
         Spread = as.numeric(Spread),
         Date = x_to_date(X),
         Spread = round(Spread, 3))
head(df2)

# CSV_16_19
df3_raw <- read_csv("CDS_16_19.csv", skip = 1, col_names = c("X", "Spread"))
df3_clean <- df3_raw %>%
  filter(grepl("^[0-9\\.]+$", X), grepl("^[0-9\\.]+$", Spread))
unique(df3_clean$X)
df3 <- df3_clean %>%
  mutate(X = as.numeric(X),
         Spread = as.numeric(Spread),
         Date = x_to_date(X),
         Spread = round(Spread, 3))
head(df3)

# CSV_20_24
df4_raw <- read_csv("CDS_20_24.csv", skip = 1, col_names = c("X", "Spread"))
df4_clean <- df4_raw %>%
  filter(grepl("^[0-9\\.]+$", X), grepl("^[0-9\\.]+$", Spread))
unique(df4_clean$X)
df4 <- df4_clean %>%
  mutate(X = as.numeric(X),
         Spread = as.numeric(Spread),
         Date = x_to_date(X),
         Spread = round(Spread, 3))
head(df4)

# 4개 병합
df_all <- bind_rows(df1, df2, df3, df4) %>%
  arrange(Date) %>%
  distinct(Date, .keep_all = TRUE)

# 결과 확인
head(df_all)
tail(df_all)

# 최종 저장
write_csv(df_all, "KOR_CDS_2008_2024_combined.csv")

cat("✅ 최종 KOR_CDS_2008_2024_combined.csv 저장 완료!")

