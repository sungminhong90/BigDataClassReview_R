library(rJava)
library(memoise)
library(KoNLP)

## 
useNIADic() #명사단어사전 

txt <- readLines("SpiderMan.txt")
head(txt)
length(txt) #there are 140 lines
is(txt)

##문자열처리 
install.packages('stringr')
library(stringr)

##tab 없애주기 (특수문자 제거)
txt <-str_replace_all(txt, "\\W", " ")
head(txt)

#명사 추출
library(KoNLP)
extractNoun("오늘은 즐거운 날이다. 당신은 소중한 사람입니다.")
nouns <- extractNoun(txt)
nouns

is(nouns)
unlist(nouns)
wordCount <- table(unlist(nouns)) #빈도를 보여준다 
wordCount

#데이터 프래임 전환
df_word <-as.data.frame(wordCount, stringAsFactors = F)
df_word

df_word <- rename(df_word, word=Var1, freq = Freq)
df_word

### wordcloud
install.packages('wordcloud')
library(wordcloud)
library(RColorBrewer)

### 색상추출
pal <- brewer.pal(8, "Dark2")
set.seed(1004) #1004번 패턴의 난수를 쓰겠다는 뜻임

#워드클라우드
wordcloud(word = df_word$word,
          freq = df_word$freq,
          color = pal,
          random.order = T,
          rot.per = 0.4, #rotation
          max.words = 100) #단어갯수 

nrow(df_word) #행 갯수
