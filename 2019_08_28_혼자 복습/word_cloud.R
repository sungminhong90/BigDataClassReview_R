install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

##색상 추출해보기
pal <- brewer.pal(8, "Dark2")
set.seed(1004) #1004번 패턴의 난수를 쓰겠다는 뜻임

#월드클라우드 제작
wordcloud(word = df_word$word, #단어
          freq = df_word$freq, #빈도
          min.freq =2, #최소 단어 빈도
          max.words = 100, #최대 표현 단어 수
          random.order = F, # 고빈도 단어 중앙배치 (F=하지 않음)
          rot.per = 0.1, #회전 단어 비율 지정
          scale = c(5, 0.2), #단어 크기 범위 
          colors = pal) #색상 목록

## 많이 상용된 단어일수록 글자가 크고 가운데 배치됨
##덜 사용한 단어일 수록 글자가 작다 