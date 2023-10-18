#실습에 필요한 packages를 설치
install.packages("dplyr")
install.packages("ggplot2")

#실습에 필요한 packages를라이브러리에 등록
library(dplyr)
library(ggplot2)
#CSV형식의 파일 불러와서subway객체에 입력하고 구조 확인
str(subway)
#변수의 이상치와 결측치 확인하고처리
summary(subway)
