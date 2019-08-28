### 결측치 처리하기
df <- data.frame(Pclass = c(1,2,3, NA, 1),
                Embarked = c("C", "S", "Q", NA, NA),
                Fare = c(NA, 150, 300,300,100))

df

## is.na(데이터셋)
is.na(df)

## 결측치 갯수 확인
table(is.na(df))

## 각각의 컬럼별 결측치 확인
table(is.na(df$Pclass))
table(is.na(df$Embarked))
table(is.na(df$Fare))

## 결측치가 포함되면 정상적인 연산
mean(df$Pclass)

## 결측치/이상치가 있으면 자료 전처리를 해주어야 함
###
library(dplyr)
df %>% filter(!is.na(Pclass))

##실습 과제 3-2 ->Embakred NA 빼고/ Fare NA빼고/ 모든 NA를 빼고 출력 
#1) embarked 빼고
df %>% filter(!is.na(Embarked))

#2) Fare NA빼고
df %>% filter(!is.na(Fare))

#3) 모든 NA빼고
df %>% filter(!is.na(Pclass) & !is.na(Embarked) & !is.na(Fare))

# Titanic data 결측치 처내기 
titanic <- read.csv("C:\\Python\\train.csv")
View(titanic)
titanic %>% filter(!is.na(Age))

table(is.na(titanic))
colSums(is.na(titanic))

## na.rm = T
mean(df$Pclass, na.rm=T)
mean(df$Embarked, na.rm=T)
mean(df$Fare, na.rm=T)

### 데이터 선택
mtcars[seq(1,10,1), ]

### 결측치 만들기
mc_part <- mtcars
mc_part[c(4,8), 'drat'] <- NA #4번째 열/ #8번째열 in DRAT column
mc_part

##
mc_part %>%  summarise (mean_drat=mean(drat, na.rm=T),
                        sum_drat=sum(drat, na.rm=T),
                        col3=median(drat, na.rm=T))
mc_part

##실습 4-1 qsec 4,8행의 데이터를 NA로 처리하고, mean, sum, median, var, sd 구하기

#우선 결측치 만들기 
mc_part1 <- mtcars
mc_part1[c(4,8), 'qsec'] <- NA #4번째 열/ #8번째열 in Qsec column
mc_part1

# 여기서 mean 구하기
mc_part1 %>%  summarise (mean_qsec = mean(qsec, na.rm = T),
                         sum_qsec = sum(qsec, na.rm = T),
                         median_qsec = median(qsec, na.rm =T),
                         var_qsec = var(qsec, na.rm = T),
                         sd_qsec = sd(qsec, na.rm = T))
mc_part1

#그룹별로 묶어서 summarise by cyl ???

mc_part2 <- mtcars
mc_part2 %>% 
  group_by(cyl) %>% 
  summarise(mean_qsec = mean(qsec, na.rm = T),
            sum_qsec = sum(qsec, na.rm = T),
            median_qsec = median(qsec, na.rm =T),
            var_qsec = var(qsec, na.rm = T),
            sd_qsec = sd(qsec, na.rm = T))

## var은 분산, sd는 표준편차 

## 이상치 찾고 처리하기. - outlier
outlier <- data.frame(Pclass = c(1,2,3,4,4,55,3,1,1,2),
                    family = c(1,2,3,1,2,3,1,1,1,2))
outlier                    

library(ggplot2)
ggplot(data = outlier, aes(x=Pclass, y=family)) +geom_point()

##수치형? 범주형???? (두개 relation은 산점도)

ggplot(outlier, aes(x=Pclass)) +geom_bar()

# 범주 내 외의 값은 아래와 같이 구할 수 ㅅ있다. since Pclass only have 1,2,3 -> 4, 55 cannot exist
outlier$Pclass %in%  c(1,2,3)

# %in%  -> base c() + whether the first subject is in the latter vactor bracket

## %notin%
install.packages("Hmisc")
library("Hmisc")  

'%notin%' <-Negate('%in%')
outlier$Pclass %in%  c(1,2,3)

#dat[행, 열]
outlier[!(outlier$Pclass %in% c(1,2,3)),]

#outlier[행,열]

outlier[outlier$Pclass %notin% c(1,2,3), ]

outlier$Pclass %notin% c(1,2,3) 
!outlier$Pclass %in% c(1,2,3) 

#3명의 사람들만 뽑고 싶다구...?

table(outlier$Pclass)
outlier
outlier$family

##실스1 5-1 이상치 처리
### family 1,2,에 해당되지 않는 값만 출력

outlier$family %notin%  c(1,2)

outlier[!outlier$family %in% c(1,2), ]
!outlier$family %in% c(1,2)

outlier[outlier$family %notin% c(1,2),]

table(outlier$family)
table(outlier$Pclass)


##결측치 대체
table(outlier$family)
table(outlier$Pclass)

outlier[(!outlier$Pclass %in% c(1,2,3)), 'Pclass'] =1
outlier[c(4,5), ]
outlier

ggplot(outlier, aes(x=Pclass)) +geom_bar()