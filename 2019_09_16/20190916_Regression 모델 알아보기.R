### Regression 모델 알아보기

mtcars
dim(mtcars)

# 산점도 그려보기
plot(mtcars$disp, mtcars$mpg,
     xlab = '자동차배기량',
     ylab = '자동차의 연비',
     pch = 15, main = '자동차배기량과 연비의 관계')

#회귀직선 구하기
model <- lm(mpg~disp, data = mtcars)
summary(model)

plot(mtcars$disp, mtcars$mpg,
     xlab = '자동차 배기량',
     ylab = '자동차의연비',
     pch = 15, main = '자동차 배기량과 연비의 관계')

abline(model)

# 모델 변수 확인
names(model)

# 모델의 잔차 확인
nrow(mtcars)

model$residuals #or model$resid

sum(model$residuals) # 잔차(실제-예측값)의 총합

sum(model$residuals * mtcars$disp) # 잔차의 총합


## 실습해 보기 

# 모델 구하기 
model1 <- lm(mpg~., data = mtcars) # 이거는 전체 다 
summary(model1)

model2 <- lm(mpg~wt, data = mtcars) # 전체 다 구한 것 중에 wt가 가장 p값이 낮다 
summary(model2)

#
plot(mtcars$wt, mtcars$mpg, 
     xlab = '자동차 무게', #독립변수 
     ylab = '자동차의 연비', #종속변수 
     pch = 15, main = '자동차무게와 연비의 관계')

abline(model2)
