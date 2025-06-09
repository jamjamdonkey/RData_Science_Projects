rm(list = ls())
#install.packages("tseries")
library(tseries)

df_final <- read_csv("CDS_merged_for_model.csv")

# Spread
adf.test(df_final$Spread)

# WTI
adf.test(df_final$wti)

# Term Spread
adf.test(df_final$Term_Spread)

# EXR
adf.test(df_final$EXR)

# VIX
adf.test(df_final$VIX)

# KOSPI
adf.test(df_final$KOSPI)

df_final <- df_final %>%
  mutate(
    d_wti = c(NA, diff(wti)),
    d_Term_Spread = c(NA, diff(Term_Spread)),
    d_EXR = c(NA, diff(EXR)),
    d_VIX = c(NA, diff(VIX)),
    d_KOSPI = c(NA, diff(KOSPI)),
    d_Spread = c(NA, diff(Spread))
  )

adf.test(na.omit(df_final$d_wti))
adf.test(na.omit(df_final$d_Term_Spread))
adf.test(na.omit(df_final$d_EXR))
adf.test(na.omit(df_final$d_VIX))
adf.test(na.omit(df_final$d_KOSPI))
adf.test(na.omit(df_final$d_Spread))


lm_model_diff <- lm(d_Spread ~ d_wti + d_Term_Spread + d_EXR + d_VIX + d_KOSPI, data = df_final %>% na.omit())
summary(lm_model_diff)
