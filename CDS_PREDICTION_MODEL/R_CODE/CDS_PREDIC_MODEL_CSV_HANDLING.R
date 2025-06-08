rm(list = ls())
library(tidyverse)  # dplyr, ggplot2 등 포함
library(lubridate)  # 날짜 처리 편하게

# 전처리 필요없는 CSV 불러오기
df_band <- read.csv("KOR_GOVBOND_1Y_10Y_DYD.csv")
df_fx   <- read.csv("KOR_USD_EXR_DYD.csv")
df_kospi <- read.csv("KOSPI_IDX_DYD.csv")
df_wti <- read.csv("WTI_IDX_DYD.csv")
df_vix  <- read.csv("VIX_IDX_DYD.csv")


# 국고채 금리
colnames(df_band) <- c("date", "bond_1y", "bond_10y")
df_band$date <- as.Date(df_band$date, format = "%Y/%m/%d")  

# USD/KRW
df_fx <- read.csv("KOR_USD_EXR_DYD.csv", skip = 1)
colnames(df_fx) <- c("date", "usdkrw")
df_fx$date <- as.Date(df_fx$date, format = "%Y/%m/%d")

# KOSPI
df_kospi <- read.csv("KOSPI_IDX_DYD.csv", skip = 1)
colnames(df_kospi) <- c("date", "kospi")
df_kospi$date <- as.Date(df_kospi$date, format = "%Y/%m/%d")

# VIX
colnames(df_vix) <- c("date", "vix")
df_vix$date <- as.Date(df_vix$date, format = "%Y-%m-%d")

# WTI
colnames(df_wti) <- c("date", "wti")
df_wti$date <- as.Date(df_wti$date, format = "%Y-%m-%d")


# 핵심 3개는 inner_join (한국 금융시장 중심)
df_merged <- reduce(
  list(df_band, df_fx, df_kospi),
  ~ inner_join(.x, .y, by = "date")
)

# vix, wti는 left_join으로 붙이기
df_merged <- df_merged %>%
  left_join(df_vix, by = "date") %>%
  left_join(df_wti, by = "date")

# 숫자형 처리
df_merged$usdkrw <- as.numeric(gsub(",", "", df_merged$usdkrw))
df_merged$kospi <- as.numeric(gsub(",", "", df_merged$kospi))

# 확인
glimpse(df_merged)
summary(df_merged)


range(df_band$date)
range(df_fx$date)
range(df_kospi$date)
range(df_vix$date)
range(df_wti$date)


