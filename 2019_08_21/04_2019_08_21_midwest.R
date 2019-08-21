###분석해보기 

# ggplot2의 midwest 데이터를 데이터 프레임으로 가져오기

dt <- as.data.frame(ggplot2::midwest)

## 전체인구 변수poptotal을 total로 변공, popasian을 asianp로 변경 

dt_new <- dt #그냥 복사해오기 
dt_new <- rename (dt_new, total = poptotal)
dt_new <- rename (dt_new, asianp = popasian)
names(dt_new) #바꾼거 확인하기

##total, white 변수를 이용해 '전체 인구 대비 백인 인구 백분율'파생변수 만들고, 히스토그램을 만들기

dt_new$w_per <- (dt_new$popwhite/dt_new$total)*100
hist(dt_new$w_per) 

## 백인인구 백분율 전체 평군을 구하고, 평균 초과하면 large, 그 외에는 small로 나누기

mean(dt_new$w_per)

dt_new$group <- ifelse(dt_new$w_per > 95.56, "large", "small")
head(dt_new$group)

table(dt_new$group)
qplot(dt_new$group)

