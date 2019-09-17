##Linear Regression_base

# 데이터 준비 
kor <- c(50,70,80,90,100)
eng <- c(77,88,99,100,70)
math <- c(55, 75, 85, 95, 105)

all_score <- data.frame(kor, eng, math)
all_score

#모델생성(1)
# 단순 선형회기 모델 
model1 <- lm(math~kor, data=all_score) #종속/독립변수 (math~kor)
model1
summary(model1)

# 종속변수 : 연구자가 독립변수의 변화에 따라 어떻게 변하는지 알고 싶어하는 변수 
# 독립변수: 종속변수에 영향을 주는, 독립적인 변수 (다른 변수에 영향을 받지 않는다)

#모델생성(2)
# 다중 선형회기 모델 
model2 <- lm(math~kor+eng, data=all_score)
model2

#모델을 이용한 예측

# 하나의 변수로 이용한 예측
dat <- data.frame(kor=c(80,85))
pred1 <- predict(model1, newdata=dat)
pred1

# 두개의 변수로 이용한 예측
dat <- data.frame(kor=c(80,85), eng=c(50,60))
pred2 <- predict(model2, newdata=dat)
pred2

#모델평가
summary(model1)
summary(model2)

#(실습 해보기1) 국어, 영어, 역사 데이터를 입력 후, 모델을 만들고 아래 새로운 데이터에 대한 예측을 해 보자.
# 데이터 만들기 
kor <- c(40,60,70,80,90)
eng <- c(77,88,99,100,70)
hist <- c(55, 75, 85, 95, 105)

all <- data.frame(kor, eng, hist)
all
# 모델생성
model <- lm(hist~ kor, data=all)
model1
summary(model1)

# 변수 에측
data_n <- data.frame(kor = c(75, 90))
predi <- predict(model1, newdata=data_n)
predi

# 모델생성2
model_n <- lm(hist~kor+eng, data = all)
model_n
summary(model_n)
#2개변수 통한 예측 
data_new <- data.frame(kor = c(75, 90), eng = c(45, 90))
pre <- predict(model_n, newdata = data_new)
pre
summary(model_n)
