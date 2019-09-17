# 미국에 사는 인디언들의 당뇨병 예측

install.packages('faraway')
install.packages('pscl')
install.packages('ROCR')

library(faraway)
library(pscl)
library(caret)
library(ROCR)

search()
data(pima)
pima

# data 준비 및 나누기 (##data(pima로 해보기 ))

data(pima, package = 'faraway')
pima$test <- factor(pima$test)
dim(pima)

# 5:5로 나누기 
# 샘플 5:5
idx <- sample(NROW(pima)/2)

# 데이터 셋 나누기
train <- pima[idx, ]
test <- pima[-idx, ]


# 로지스틱 회기 모델 구하기
# 지도학습, 종속변수가 범주형일때,
#m <- glm(종속~독립변수, family = binominal, data = pima_tr)

m <- glm(test~pregnant + glucose + bmi, family = binomial, data = train)

m
summary(m)

pred <- predict(m, newdata= test, type = 'response')
pred[0:10]

##type에는 response / class 두개 사용 가능. class 하면 자동으로 0/1로 숫자 보여줌 

pred <- as.integer(pred>0.5)
pred[0:10]

# 모델평가
actual <- test[ , "test"]
xt = xtabs( ~ pred + actual)
xt

(234+74)/(234+74+27+49)

# 확률로 분할표 보기 
prop.table(xt)

## (2) confusionMatrix 확인
# caret 패키지를 이용한 정확도 및 기타 확인
library(caret)
actual<- as.factor(actual)
pred <- as.factor(pred)
confusionMatrix(pred, actual)






