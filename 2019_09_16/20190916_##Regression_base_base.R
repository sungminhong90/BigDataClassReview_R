##Regression_base_base

library(mass)
install.packages('MASS')
## PROB: 범죄확률
## SO: 남부 인지 아닌지? 북부가 더 높아? 남부가 더 높아?

library(MASS)
library(dplyr)

tbl_So <- table(UScrime$So)
tbl_So
barplot(tbl_So)

library(ggplot2)
ggplot(UScrime, aes(x=So)) + geom_bar()

#가설검정
#귀무가설: 기존의 사실, 같은투옥 확률을 같는다.
#대립가설: 귀무가설과 반대. 연구자가 제안하는 가설. (다른 투옥확률을 가진다)

#t검정
#t-test: 독립성, 정규성, 등분산성 만족되어야 한다.
#남부/비남부
#정규성: 30개 이상일 경우 정규성이 만족된다.
# 10-30개면 검증해줘야 된다.(kolmogorov-smirnov test, shapiro-wilk test)
# 10개 미만이면 정규성을 띠지 않는 것으로 간주해야 된다. (Mann-Whitney test)

dim(UScrime)

# var.test(변수1, 변수2)
var.test(UScrime$Prob, UScrime$So)
head(UScrime)

#2.2*10^-16
#0.05보다 엄청 작다.
#p-value(유의확률)이 0.05보다 작기 때문에 유의하다.(우리가 세운 가설이 유의하다.)
#0.05보다 작으면 분산이 유의미하게 다르다. 

dim(UScrime)

t.test(Prob~So, data=UScrime)
#p-value <0.05
# 귀무가설을 기각하고 대립가설을 채택
#남부와 비남부가 같은 투옥확률을 가지지 않는다. 

# 두 집단이 독립이 아닌 서로 종속되어 있다.
# 종속 표본 t 검정
### 귀무가설: 젊은 남성과 장년 남성의 실업률 평균이 같다
### 대립가설: 젊은 남성과 장년 남성의 실업률 평균이 다르다. 

## 등분산 체크
var.test(UScrime$U1, UScrime$U2)
#U1: unemployment rate of urban males age 14-24
#U2: unemployment rate of urban males age 35-39

#t.test(y1, y2, paired=TRUE)
t.test(UScrime$U1, UScrime$U2, paired = TRUE)
#P-VALUE<2.2e-16
##대립가설: 젊은 남성// 장년 남성의 실업률 평균이 서로 다르다. 

 






