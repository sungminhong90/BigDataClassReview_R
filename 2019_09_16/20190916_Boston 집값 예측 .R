#Boston 집값 예측 

library(MASS)
data("Boston")
head(Boston)

### 7:3 (MAE:3.598317)
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.7,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MAE: |실제값 -예측값|/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)
mae_value = sum(diff_val)/n1
mae_value

##실습 => 9:1이 가장 MAE 값이 작게 나오기는 함 

### 6:4/ 5:5 / 8:2 / 9:1 중 가장 좋은 MAE 찾기 
### MSE값을 구하기 

### 6:4 (MAE: 3.290076)
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.6,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MAE: |실제값 -예측값|/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)
mae_value = sum(diff_val)/n1
mae_value

### 5:5 (MAE: 3.438944)
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.5,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MAE: |실제값 -예측값|/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)
mae_value = sum(diff_val)/n1
mae_value

### 8:2 (MAE: 2.910984)
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.8,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MAE: |실제값 -예측값|/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)
mae_value = sum(diff_val)/n1
mae_value

### 9:1 (MAE: 2.442032)
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.9,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MAE: |실제값 -예측값|/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)
mae_value = sum(diff_val)/n1
mae_value
#============================================
##MSE 값 구하기 =>MSE:10.84679 (9:1)
##MSE: |실제값 -예측값|^2/n
#7:3 => MSE:21.05811
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.7,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MSE: |실제값 -예측값|^2/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)^2
mse_value = sum(diff_val)/n1
mse_value
#===============================
#6:4 => MSE:21.20996
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.6,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MSE: |실제값 -예측값|^2/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)^2
mse_value = sum(diff_val)/n1
mse_value
#==================================
#5:5 => MSE:26.90594
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.5,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MSE: |실제값 -예측값|^2/n
dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)^2
mse_value = sum(diff_val)/n1
mse_value
#==================================
#8:2 => MSE:13.44307
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.8,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MSE: |실제값 -예측값|^2/n

dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)^2
mse_value = sum(diff_val)/n1
mse_value

#==================================
#9:1 => MSE:10.84679
set.seed(0)
idx <- sample(1:nrow(Boston), 
              size = nrow(Boston)*0.9,
              replace = F)
idx


Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

#모델만들기
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측
pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

#MSE: |실제값 -예측값|^2/n

dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = abs(Boston_test$medv -pred_value)^2
mse_value = sum(diff_val)/n1
mse_value
#======================================================
