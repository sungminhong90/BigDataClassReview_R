#변수명 바꾸기
install.packages("dplyr")
library(dplyr)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

df_new <- df_raw #원본데이터 손상되지 않게 수정 먼저 해주기
df_new <- rename(df_new, v2 = var2)
df_new

df_new <-rename(df_new, v1 = var1)
df_new
