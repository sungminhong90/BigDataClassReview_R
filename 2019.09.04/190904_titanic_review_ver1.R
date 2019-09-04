## 타이타닉 머신러닝 해보기
install.packages("Amelia")
library(Amelia)
library(ggplot2)

##데이터를 불러와볼까요?
train <- read.csv("titanic_train.csv",
                  stringsAsFactors = F,
                  na.strings = c("", "NA"))

# 여기서 stringsAsFactors는 팩터형 말고 그냥 문자형 그대로 데이터로 가져온다!
# na.strings = c(~) 이거는 혹시 문자가 들어있는 행이 있을 때 factor로 인지되는 것을 방지하기 위해 NA/INT로 바꾸어 준다. 여기서는 "" & NA를 NA로 인식 
test <- read.csv("titanic_test.csv",
                 stringsAsFactors = F,
                 na.strings = c("", "NA"))
sub <- read.csv("sample_submission.csv",
                stringsAsFactors = F,
                na.strings = c("", "NA"))

dim(train); dim(test); dim(sub)

##데이터탐색 
#학습 데이터에는 survived가 있고, 테스트 데이터에는 이 정보가 없다. 

names(train) # <- survived 존재
names(test) # <- survived 없음
names(sub)

str(train)

## 데이터 결측치 확인 및 처리
#train의 age/ test에 age &fare

missmap(train)
missmap(test)

colSums(is.na(train)) #age/cabin/embarked
colSums(is.na(test)) #age/cabin/Fare

## 결측치 처리
#나이는 중앙값으로
#정박항은 많이 나온 곳으로 

quantile(train$Age, na.rm = T) #28
quantile(test$Age, na.rm = T) #27

#age 결측치 처리
nrow(train[is.na(train$Age), ])
#=> 177개 처리해줘야 함

train[is.na(train$Age), 'Age'] = median(train$Age, na.rm = T)

##test용 데이터 처리
nrow(test[is.na(test$Age), ])
#=> 86개 있음

test[is.na(test$Age), 'Age'] = median(test$Age, na.rm = T)

#결측치 처리되었나 확인해보기!
nrow(train[is.na(train$Age), ]); nrow(test[is.na(test$Age), ])

#정박항(Embarked) 결측치 처리 
##다수의 값이 나온 것을 이걸로 판단 & 결측치(비어있던 값)을 NA로 카운트 해 줌 
cnt_tr <- table(train$Embarked, useNA = 'always')
cnt_test <- table(test$Embarked, useNA = 'always')
cnt_tr; cnt_test

## 학습용 데이터를 처리해보쟈
nrow(train[is.na(train$Embared), ])
nrow(test[is.na(test$Embarked), ])
train [ is.na(train$Embarked),'Embarked' ] = 'S'
nrow(train[is.na(train$Embared), ])

test[is.na(test$Fare),'Fare'] = median(test$Fare, na.rm = T)

#데이터 확인
colSums(is.na(train))
colSums(is.na(test))

#데이터 모델을 만들어보쟈!
model <- glm(Survived~Pclass+Age+Sex,
             family = binomial, data=train)
summary(model)

##제일 중요한 예측!!!!
pred <- predict(model, newdata = test, type ='response')
#type을 response로 지정하고 예측을 수행하면 0 ~ 1 사이의 확률을 구해준다.
pred[0:10]

pred <-as.integer(pred >0.5)
pred[0:10]

sub[, 'Survived'] = pred
# or sub$Survived <- pred

sub[0:10, ]

getwd()

#파일로 저장해주기!
write.csv(sub, file = "firstsub.csv", row.names = T)
list.files(path=".")
#row.names=F를 주는 이유는, 해당 인수를 T로 줄 경우 file로 저장할 때 행 이름이 첫 열로 이동하여 저장되어서! 
