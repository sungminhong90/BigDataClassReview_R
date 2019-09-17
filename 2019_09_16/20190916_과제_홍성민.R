# iris 데이터를 의사결정나무 모델을 적용하는 목적은 Sepal.Length, Sepal.Width, Petal.Length, Petal.Width

# 수치형 4개를 독립변수로 이용하여 아이리스의 종류(Species)를 예측하는 것이 되겠습니다.

# R에서 rpart 패키지의 rpart() 함수로 의사결정나무 모델을 학습시킬 수 있습니다.

## 01 : rpart라이브러리 불러오기, 의사결정나무 모델을 만들기 위한 라이브러리

library(rpart)
data(iris)

# https://ai-times.tistory.com/418
# iris 데이터 설명 참조
# 샘플링 만들기. 7:3비율로 학습시켜 모델을 만들 train데이터(70%)와 모델이 제대로 만들어 졌는지 테스트를 위한 test(30%) 데이터 만들기

## 02 : 랜덤으로 데이터를 뽑아내지만 난수 발생 패턴을 정해주므로서 똑같은 데이터가 추출됨.

df <-iris
set.seed(123)
idx <- sample(1 : nrow(df), 0.7 * nrow(df), replace = FALSE)
train <-iris[idx, ]
test <-iris[-idx, ]
new_test <- test[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]

## 03 : train 행열 확인하기
dim(train)
str(train)
head(train)
## 04 : new_test 행열 확인하기
dim(new_test)
str(new_test)
tail(new_test)
## 05 : train 컬럼(변수) 확인하기
colnames(train)
## 06 : new_test 컬럼(변수) 확인하기
names(new_test)

## 07 : Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 변수를 이용하여 Species를 예측해 보자.
r_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
                          data = train,
                          method = 'class')

## 08 : 학습시킨 모델을 적용시켜 new_test의 Species값을 예측해 보자.
pred <- predict (r_model, new_test, type='class')
pred

data.frame(predict = pred ## 09 : 예측한 값와
           , test_Species = test$Species) ## 10 : 실제 값을 비교해 보자.

## 11 : 예측한 값과 실제 값이 다른 데이터의 번호를 적으시오.
#135


