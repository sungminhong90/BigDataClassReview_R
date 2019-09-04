# 데이터 불러오기
df <- read.csv("newAdTracking.csv")

## 01 : 데이터 컬럼들을 확인해 보자
names(df) # or colnames(df)

## 02 : 데이터 속성을 확인해 보자
str(df)

## 03 : 데이터 행열을 확인해 보자
dim(df)

## 04 : 어떤 ip가 존재하는지 알아보자
table(df$ip)

## 05 : 어떤 app가 존재하는지, 광고에 가장 많이 접속한 app를 알아보자
sort(table(df$app), decreasing = T) #3번 

## 06 : 어떤 device 존재하는지, 광고에 가장 많이 접속한 device를 알아보자
sort(table(df$device), decreasing = T) #1

## 07 : 어떤 os가 존재하는지, 광고에 가장 많이 접속한 os를 알아보자
sort(table(df$os), decreasing = T) #19

## 08 : 어떤 channel이 존재하는지, 광고에 가장 많이 접속한 channel을 알아보자
sort(table(df$channel), decreasing = T) #213

## 09 : 컬럼별로 결측치가 있는지 확인해 보자. 
colSums(is.na(df)) #=> 결측치 없음 

# 데이터를 R 검색 경로에 추가하여 변수명으로 바로 접근할 수 있게 한다.
attach(df)

# lm(패턴, 데이터) 모델을 이용하여 생성 후, 우리는 predict()를 이용하여 예측값을 구할 수 있다.
## 10 : (ip , app, device, os, channel) 5개의 변수를 이용하여 is_attributed을 예측하는 모델을 만들어 보자

model <- glm(is_attributed ~ ip + app + device + os + channel, family = binomial, data = df)

# 예측하기 위한 새로운 데이터를 만들어 보자.
new_df <- data.frame( ip = c(2948, 2684, 2685, 2686)
                      , app = c(19 , 286, 21, 23)
                      , device = c(0, 1, 1, 2)
                      , os = c(13 , 25, 13, 13)
                      , channel = c(213, 256, 122, 459))

## 11 : new_df의 ip, app, channel 값을 통해 is_attributed(어플을 다운 받았는지) 값을 예측해 보자.
pred <- predict(model, newdata = new_df, type = "response")
pred

library(dplyr) #아래 쓰려면 dplyr 써주기 

new_df <- new_df %>% mutate(is_attributed = as.integer(pred > 0.5))

## 12 : 예측된 결과값을 출력해 주세요.
new_df
