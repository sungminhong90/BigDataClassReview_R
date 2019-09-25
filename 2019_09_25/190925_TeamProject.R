rm(list=ls())
df <- read.csv('database.csv')
summary(df)
colnames(df)

# 각 연도별 crime 갯수 
sort(table(df$State), decreasing = TRUE)

year = sort(table(df$Year), decreasing = TRUE)
year = table(df$Year)

# 연도별 그래프 화 
library(ggplot2)
ggplot(data=df, aes(x=Year, fill='Year')) +geom_bar(position = "dodge", fill='green')

#가장 높은 crime solving state?
sort(table(df$Crime.Solved), decreasing = TRUE)

crime_yes <- df %>% group_by(State) %>% 
  filter(Crime.Solved == "Yes") %>% 
  count() %>% 
  arrange(desc(n))

# 가장 낮은 crime solving state?
crime_no <- df %>% group_by(State) %>% 
  filter(Crime.Solved == "No") %>% 
  count() %>% 
  arrange(desc(n))

dim(df)

#RATE

crime_yes['per'] <- (crime_yes['n']/(crime_yes['n'] + crime_no['n']))*100
crime_yes

crime_no['per'] <- (crime_no['n']/(crime_yes['n'] + crime_no['n']))*100
crime_no

# arrange 

#y <- y[c(order(y$var)),] 
#오름차순 
crime_yes <-crime_yes[c(order(crime_yes$per)),]
crime_yes

crime_no <-crime_no[c(order(crime_yes$per)),]
crime_no

#내림차순
crime_yes_desc <- arrange(crime_yes, desc(per))
crime_yes_desc

crime_no_desc <- arrange(crime_no, desc(-per))
crime_no_desc




