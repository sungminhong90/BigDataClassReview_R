#mpg 이용 
#직접 해보세요
install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

##혼자서 해보기
mpg_new <- mpg
mpg_new

mpg_new <- rename(mpg_new, city = cty)
mpg_new <- rename(mpg_new, highway = hwy)
names(mpg_new)

##직접해보세요 
mn <- mpg_new 
mn$total <- (mn$city + mn$highway)/2
names(mn)

head(mn)
mean(mn$total)

##직접해보세요
summary(mn$total)
hist(mn$total)

mn$test <-ifelse(mn$total >=20, "pass", "fail")
head(mn, 10)

table(mn$test)
qplot(mn$test)

mn$grade <- ifelse(mn$total >= 30, "A",
                   ifelse(mn$total >= 20, "B", "C"))

head(mn,20)

table(mn$grade)
qplot(mn$grade)

##혼자서해보기 -p133 응용
#Q1
mpg <- as.data.frame(ggplot2::mpg)

disp1 <-mpg %>% filter(displ <4)
disp2 <-mpg %>% filter(displ >5)

mean(disp1$hwy)
mean(disp2$hwy)

#Q2
class1<- mpg %>% filter(manufacturer == "toyota")
class2<- mpg %>% filter(manufacturer == "audi")

mean(class1$cty)
mean(class2$cty)

#Q3
sample <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda") )
mean(sample$hwy)

#혼자서해보기p138
#Q1
neu_dt <- mpg %>% select(class, cty)
names(neu_dt)
head(neu_dt)
#Q2
dt_suv <- neu_dt %>% filter(class == "suv")
dt_compact <- neu_dt %>% filter(class == "compact")
mean(dt_suv$cty)
mean(dt_compact$cty)

#혼자서해보기 p141
#Q1
audi <- mpg %>% filter(manufacturer == "audi") 
audi %>% arrange(desc(hwy)) %>% 
head(5)

#OTHER VER.
audi <- mpg %>% filter(manufacturer == 'audi') %>% arrange(desc(hwy)) %>% head(5)
audi

#혼자서 해보기 p144
#Q1
mpg_neu <- mpg
mpg_neu <- mpg_neu %>% mutate(total = cty+hwy) 
head(mpg_neu,5)
#Q
mpg_neu <- mpg_neu %>%mutate(mean = total/2)
head(mpg_neu, 5)
#Q3
mpg_neu <- mpg_neu %>%mutate(mean = total/2) %>% arrange(desc(mean)) %>% head(3)
head(mpg_neu,3)
#Q4
mpg %>% mutate(total = (cty+hwy), mean = total/2) %>% arrange(desc(mean)) %>% head(3) 

#직접해보세요 p150
#Q1
mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  group_by (class) %>% 
  summarise (mean_cty = mean(cty)) %>% 
  head(5)

#Q2  
mpg %>% 
  group_by (class) %>% 
  summarise (mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

#Q3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise (mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

#Q4
mpg %>% 
  filter(class == 'compact') %>% 
  group_by(manufacturer) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count))