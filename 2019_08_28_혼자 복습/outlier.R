## 결측값 처리하기 
df <- data.frame(Pclass = c(1,2,3,NA,1),
                 Embarked = c("C", "S", "Q", NA, NA),
                 Fare = c(NA, 150,200,300,100))
df
## char에는 <> 안에, 숫자는 그냥 NA로 표기

# 결측치 확인하기 - is.na(dataset)
is.na(df)

# 결측치 갯수 확인 - table(is.na(datset))
## Pclass 결측치
table(is.na(df$Pclass))
## Embarked 결측치
table(is.na(df$Embarked))
## Fare 결측치
table(is.na(df$Fare))

###!!결측치 처리를 안해주면 연산이 안된다(평균 등)!!
mean(df$Pclass) #->NA값으로 표시

#결측치가 제거된 행들만 가져오려면? ->filter써준다!
library(dplyr)
df %>%  filter(!is.na(Pclass))

#Pclass & Fare 다 없애주기
df %>%  filter(!is.na(Pclass) & !is.na(Fare))

#결측치가 하나라도 있으면 제거하려면? na.omit(dataset)
df_no <- na.omit(df)
df_no

#결측치를 제외하고 연산을 수행하려면? na.rm 이용

df
mean(df$Pclass, na.rm = T)
mean(df$Fare, na.rm = T)

#mtcars 데이터 셋에서 10행 추출 후 mpg_part에 저장
mtcars[seq(1,10,1),]
##[]를 쓴 이유는 mtcars에서 가져오기 위해서(불린타입- 파이썬도 마찬가지, index화) & 1부터 10까지 1개씩 커진다 & 행으로 가져오고, 열은 없다/비워져 있으니까!

mc_part <- mtcars[seq(1,10,1), 1:5]
mc_part
# 뒤에 1:5는 1행부터 5열까지

#아무런 이상 없는 데이터에 결측치 넣어보기
mc_part[c(4,8), 'drat'] <- NA
mc_part
## drat열에서 4번째, 8번째 행만 NA로 바뀜 

#여기서(drat) 결측치 있어서 mean 못구한다. NA로 나온다 
mc_part %>% summarise(mean_drat = mean(drat))

##이럴 경우 na.rm을 적용해서 평균 등 연산을 진행 가능하다 

mc_part %>% summarise(mean_drat = mean(drat, na.rm = T))

#drat의 mean, sum, median 구해주기 
mc_part %>% 
  summarise(mean_drat = mean(drat, na.rm = T),
            sum_drat = sum(drat, na.rm = T),
            median_drat = median(drat, na.rm = T))
mc_part

## NA(결측치)를 평균으로 대체해보쟈!
mean(mc_part$drat, na.rm = T)

mc_part$drat <- ifelse(is.na(mc_part$drat), 3.57,
                       mc_part$drat)

mc_part
table(is.na(mc_part$drat))

## 이상치를 찾고 처리해보쟈!
outlier <- data.frame(Pclass c(1,2,3,4,55,3,1,1,2),
                      family = c(1,2,3,1,2,3,1,1,1))
outlier

library(ggplot2)
ggplot(outlier, aes(x= Pclass)) +geom_bar()

outlier$Pclass %in% c(1,2,3)
library(Hmisc)
' %notin% ' <- Negate('%in%') 
outlier$Pclass %in% c(1,2,3)

outlier[outlier$Pclass %notin% c(1,2,3), ]

table(outlier$Pclass)
