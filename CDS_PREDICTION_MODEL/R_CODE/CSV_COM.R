#  WTI 두 개 파일 읽기
df_wti1 <- read.csv("WTI_IDX_2004_2014.csv")
df_wti2 <- read.csv("WTI_IDX_2015_2024.csv")
# 필요한 컬럼만 추출 + rename (보통 Date + Price 컬럼 있음)
df_wti1 <- df_wti1[, c("Date", "Price")]
df_wti2 <- df_wti2[, c("Date", "Price")]
colnames(df_wti1) <- c("date", "wti")
colnames(df_wti2) <- c("date", "wti")
# 날짜 형식 변환
df_wti1$date <- as.Date(df_wti1$date, format="%m/%d/%Y")
df_wti2$date <- as.Date(df_wti2$date, format="%m/%d/%Y")
# 두 데이터프레임 합치기
df_wti <- rbind(df_wti1, df_wti2)
# 중복 제거 (혹시 겹치는 날짜 있을 경우)
df_wti <- df_wti[!duplicated(df_wti$date), ]
# 정렬
df_wti <- df_wti[order(df_wti$date), ]
# 확인
head(df_wti)
tail(df_wti)
# 최종 저장 (optional)
write.csv(df_wti, "WTI_CRUDE_OIL_DYD.csv", row.names = FALSE)

#  VIX 두 개 파일 읽기
df_vix1 <- read.csv("VIX_IDX_2004_2014.csv")
df_vix2 <- read.csv("VIX_IDX_2015_2024.csv")
# 필요한 컬럼만 추출 + rename (보통 Date + Price 컬럼 있음)
df_vix1 <- df_vix1[, c("Date", "Price")]
df_vix2 <- df_vix2[, c("Date", "Price")]
colnames(df_vix1) <- c("date", "vix")
colnames(df_vix2) <- c("date", "vix")
# 날짜 형식 변환
df_vix1$date <- as.Date(df_vix1$date, format="%m/%d/%Y")
df_vix2$date <- as.Date(df_vix2$date, format="%m/%d/%Y")
# 두 데이터프레임 합치기
df_vix <- rbind(df_vix1, df_vix2)
# 중복 제거 (혹시 겹치는 날짜 있을 경우)
df_vix <- df_vix[!duplicated(df_vix$date), ]
# 정렬
df_vix <- df_vix[order(df_vix$date), ]
# 확인
head(df_vix)
tail(df_vix)
# 최종 저장 (optional)
write.csv(df_vix, "VIX_IDX_DYD.csv", row.names = FALSE)