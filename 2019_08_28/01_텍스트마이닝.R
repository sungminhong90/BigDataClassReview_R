
install.packages('memoise')
install.packages('KoNLP')
install.packages("rJava")

library(rJava)
library(memoise)
library(KoNLP)

search()

data <- readLines("SpiderMan.txt", encoding = 'UTF-8') #read.table을 쓰면 안됨!!!
data
