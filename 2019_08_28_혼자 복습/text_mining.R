## 텍스트 마이닝

install.packages("rJava")
install.packages("memoise")
install.packages('KoNLP')

library(rJava)
library(memoise)
library(KoNLP)

# 사전 설정하기
useNIADic() #명사단어사전 

#데이터를 준비해 볼까요? (스파이더맨데이터 이용)
txt <- readLines("SpiderMan.txt") #이건 파일 속성 ansi로 바꾸어 주어야함.
#아니면 아래와 같이 쓸 수 있음
#data <- readLines("SpiderMan.txt", encoding = 'UTF-8')
#read.table을 쓰면 안됨!!!
rm(data)
head(txt)

##문자열 처리하기
install.packages("stringr")
library(stringr)

## 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ")
#capital W 
txt

##명사추출
##KoNLP extractNoun()을 이용한다

extractNoun("오늘은 즐거운 날이다. 당신은 소중한 사람입니다.")
nouns <- extractNoun(txt)
nouns
unlist(nouns)
wordCount <- table(unlist(nouns))
wordCount

##데이터 프레임 전환하기
library(dplyr)
df_word <- as.data.frame(wordCount, stringAsFactors = F)
df_word
###변수명 수정
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word

## 두글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)
df_word




