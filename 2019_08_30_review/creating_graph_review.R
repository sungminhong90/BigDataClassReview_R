library(ggplot2)
#산점도 만들기

#x축은 displ, y축은 hwy로 지정해 배경을 설정하기

ggplot(data = mpg, aes(x=displ, y=hwy))

#배경에 산점도 추가해보기
ggplot(data= mpg, aes(x=displ, y=hwy))+geom_point()

# x축 범위 3-6 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)

#y축 범위 10-30으로 지정
ggplot(data = mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6) + ylim(10,30)

##혼자서 해보기(p188)
#mpg데이터의 cty & hwy간의 관계를 그래프를 통해 파악해 보세요. 
#x축cty을 y는 hwy로 산점도를 그려라~~

ggplot(data=mpg, aes(x=cty, y=hwy))+geom_point()

#midwest데이터를 가지고 전체인구/아시아인구 간의 관계를 살펴보세요
#x축은 poptotal, y축을 popasian으로 설정하고 산점도를 만들어봐요!
#전체인구는 50만명 이하, 아시아인 인구는 1만명 이하인 지역만 그려보세요!

ggplot(data=midwest, aes(x=poptotal, y=popasian))+ 
geom_point() + xlim(0,500000) + ylim(0,10000)

### +는 행의 맨 앞으로 올수 없다~_~

#막대그래프 그려보기!
#mpg데이터로 drv&hwy상관관계를 알아볼게요!

#집단별 평균표 만들기 -> 평균막대그래프를 그리려면 집단별 평균표로 구성된 데이터 프레임이 필요해요. dplyr패키지를 이용해서 데이터프래임을 만들게요!

library(dplyr)

df_mpg <-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg

#이제 그래프를 그려볼까요? 

ggplot(data= df_mpg, aes(x=drv, y=mean_hwy)) +geom_col()

# 크기순으로 정렬해볼게요!
#정렬기준 변수 앞에 -를 붙이면 내림차순으로 정렬되요!

ggplot(data=df_mpg, aes(x=reorder(drv, mean_hwy), y=mean_hwy)) +geom_col()

#빈도막대 그래프는 값의 개수로 막대의 길이를 표현한 그래프에요!
#빈도막대 그래프는 y축이 필요없고 x의 갯수가 y축이 되요. 
#이 떄, geom_bar()을 사용한답니다!

ggplot(data = mpg, aes(x=drv)) +geom_bar()

##혼자서해보기(p193)
### suv차종의 순서대로 연비찾아볼게요 (suv/cty와의 관계)

dt <- mpg %>% filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
# 꼭 filter 걸을 떄 단어이면 ""붙이기!!!

dt

#그래프를 그려보아요!
ggplot(data=dt, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty))+geom_col()

##자동차 중 어떤 class가 가장 많은지 알고싶어요!
# 위 문제는 갯수이기 때문에 geom_bar을 사용해야 할 것 같아요
ggplot(data=mpg, aes(x=class)) +geom_bar()

##economics 데이터셋 가지고 라인그래프 그려보기
ggplot(data=economics, aes(x=date, y=unemploy)) +geom_line()

#혼자해보기 p195
ggplot(data=economics, aes(x=date, y=psavert))+geom_line()

# 상자그림을 만들어봐요!
#mpg데이터의 drv/hwy를 살펴볼거에요.

ggplot(data=mpg, aes(x=drv, y=hwy)) +geom_boxplot()

##혼자서해보기 p198
#class 중 compact, subcompact, suv 의 cty 연비를 비교해봐요!

last <- mpg %>% 
  filter( class == 'compact' | class == 'subcompact'| class =='suv')
ggplot(data=last, aes(x=class, y=cty)) +geom_boxplot()

#ORRRR
last_2 <- mpg %>% 
  filter(class %in% c('compact', 'suv', 'subcompact'))
ggplot(data=last_2, aes(x=class, y=cty))+geom_boxplot()
