## 타이타닉 머신러닝 해보기_ver2
library(dplyr)
install.packages('caret') #=> 모델평가  
library(caret)
install.packages('rpart') #=>의사결정트리 
library(rpart)
install.packages('randomForest') #=>랜덤포레스트/앙상블 
library(randomForest)

set.seed(1004)

#데이터 불러오기
train <- read.csv("titanic_train.csv",
                  stringsAsFactors = F,
                  na.strings = c("", "NA"))

test <- read.csv("titanic_test.csv",
                 stringsAsFactors = F,
                 na.strings = c("", "NA"))
sub <- read.csv("sample_submission.csv",
                stringsAsFactors = F)

#데이터 전처리 
## 학습용데이터, 테스트 데이터를 하나로 만들어서 처리해보쟈!
names(test)
test$Survived <- NA
all <-rbind(train, test)
dim(all)

colSums(is.na(all))

#범주형으로 변환해보쟈!
## 범주형 변환 -> 범주형/수치형 모델 만들어 지는 것이 조금씩 달라지기 때문 
##성별/생존유무/등급 
all$Sex <- as.factor(all$Sex)
all$Survived <- as.factor(all$Survived)
all$Pclass <-as.factor(all$Pclass)
str(all)

#파생변수 생성
##Pclass & Sex를 이용한 변수 생성
all$PclassSex[all$Pclass == '1' & all$Sex == 'male'] <- 'P1Male'
all$PclassSex[all$Pclass == '2' & all$Sex == 'male'] <- 'P2Male'
all$PclassSex[all$Pclass == '3' & all$Sex == 'male'] <- 'P3Male'
all$PclassSex[all$Pclass == '1' & all$Sex == 'female'] <- 'P1female'
all$PclassSex[all$Pclass == '2' & all$Sex == 'female'] <- 'P2female'
all$PclassSex[all$Pclass == '3' & all$Sex == 'female'] <- 'P3female'

all$PclassSex <- as.factor(all$PclassSex)

names(all); table(all$PclassSex)

#데이터 전처리
## 결측치 확인 
all[is.na(all$Fare), ]

all[is.na(all$Embarked),]
#n=n()빈도수 
all %>% group_by(PclassSex) %>% 
  summarise(n=n(),
            mean_age = mean(Age, na.rm = T),
            median_age = median(Age, na.rm= T))

table(all$PclassSex)

#결측치 처리 
all[is.na(all$Embarked), 'Embarked'] = 'S'
all[is.na(all$Fare), 'Fare'] = median(all$Fare, na.rm = T)

all[is.na(all$Age)&all$PclassSex =='P1Female', 'Age'] =36
all[is.na(all$Age)&all$PclassSex =='P2Female', 'Age'] =28
all[is.na(all$Age)&all$PclassSex =='P3Female', 'Age'] =22
all[is.na(all$Age)&all$PclassSex =='P1Male', 'Age'] =42
all[is.na(all$Age)&all$PclassSex =='P2Male', 'Age'] =29
all[is.na(all$Age)&all$PclassSex =='P3Male', 'Age'] =25

# 데이터 나누기
## 학습용/테스트용 (제출)

all$Embarked <- as.factor(all$Embarked)
trainClean <- all[!is.na(all$Survived), ]
#train파일을 다시 잘라 옴 
nrow(trainClean)

#학습용(모델학습, 모델평가)
##데이터 나누기
##7:3으로 usually 나눈다 
#밑의 idx는 비복원 추출 (샘플링!!!!!!!!!!)
idx <-sample(1:nrow(trainClean),
             size =nrow(trainClean)*0.7,
             replace = F)

train_tr <- trainClean[idx,]
train_test <-trainClean[-idx, ]

#제출용
testClean <- all[is.na(all$Srvive), ]
nrow(testClean);

#데이터 모델 만들기
##로지스틱 회귀 모델
m <-glm(Survived~Pclass+Sex+Age+Embarked+PclassSex, family = binomial, data = train_tr)
summary(m)

#데이터 모델 학습 후 예측
pred <-predict(m, newdata=train_test, type = "response")

pred[0:10]
pred <- as.integer(pred >0.5)
pred[0:10]

#데이터 모델 학숩 후 예측, 모델 평가 
actual <- train_test[, "Survived"]
xt = xtabs(~pred + actual)
xt
length(pred)


library(caret)
pred <- as.factor(pred)
actual <- as.factor(actual)
confusionMatrix(pred, actual)

install.packages("e1071")
library(e1071)


str(train_tr)

#데이터 모델 학습 후 예측, 모델평가 =>앙상블 모델

library(randomForest)
m2 <- randomForest(Survived~Pclass+Sex+Age+Embarked+PclassSex, data = train_tr)
summary(m2)
