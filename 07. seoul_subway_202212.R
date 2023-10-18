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
#NA's(결측치)가 미표시됨 

#파생변수1.정수형day변수
subway$day <-  substr(subway$Date,7,8)
class(subway$day)
subway$day <-  as.integer(subway$day)

#파생변수2.line변수
table(subway$Line)
subway$Line <-  ifelse(subway$Line=="9호선2~3단계","9호선",subway$Line)

#파생변수3.station변수
table(subway$Station)

#파생변수4.총승하차승객수total_passenger
subway$total_passenger <-  subway$on_board+subway$getting_off

#분석데이터 최종 확인
str(subway)

#데이터 분석
#1.지하철역의 하루 평균승차/하차승객수
subway%>%   
  summarise(on_m=mean(on_board), off_m=mean(getting_off))

#2.승차승객수가 가장 많았던 역의 노선을 알아보자
#2-1. solution
max(subway$on_board)
subway%>% 
  filter(on_board==94732)%>% 
  select(Date, Line, Station, on_board)

#3. 역별 하루 평균 전체승객수 분석
passenger10 <- subway %>%
  group_by(Station)%>%
  summarise(m=mean(total_passenger))%>%
  arrange(desc(m))%>%
  head(10)

head(passenger10, 3)
# 강남148890. 강남역이젤많음 Environment에 passenger10 누르면 볼 수 있음

#4.역별 일평균 전체승객수 상위 10개 역을 막대그래프로 작성성
ggplot(data=passenger10,aes(x=reorder(Station, m), y=m))+
  geom_col()+
  coord_flip()

#5. 일별 전체승객 분석
subway %>%
  group_by(Date) %>% 
  summarise(total=sum(total_passenger)) %>%
  arrange(desc(total)) %>%
  head(3)
#> 15699271/51558034    [1] 0.3044971 대한민국국민 30%정도 탔음음
#15699271/26021797  [1] 0.6033123 수도권 60%쯤 탔음


#6. 특정 line 분석 (4호선)
subway %>%
  filter(Line=="4호선") %>%
  filter(total_passenger==max(total_passenger)) %>%
  select(Date, Station, on_board,getting_off, total_passenger)
# 25일 명동역 탑승 41625 하차 51291 총승객 92916 // 크리스마스??라서 많은듯

#7. 노선별 전체승객 비율 비교
line_pct <- subway %>%
  group_by(Line) %>% 
  summarise(total=sum(total_passenger)) %>%
  mutate(all=sum(total), pct=round(total/all*100,2))

line_pct %>%
  arrange(desc(pct)) %>%
  head(3)
# 2호선 20.2% 2호선을 젤 많이탐

#8. 지하철전체승객비율막대그래프그리기
line_pct10 <- line_pct %>%
  filter(Line%in%c("1호선","2호선","3호선","4호선","5호선","6호선","7호선","8호선","9호선","분당선" ))
ggplot(data = line_pct10, aes(x=reorder(Line,pct),y=pct))+
  geom_col()+
  coord_flip()+
  ggtitle("수도권 지하철 노선별 이용비율")+
  xlab("노선")+
  ylab("이용비율")

#9. 일별전체승객선그래프그리기
line_graph <- subway %>%
  group_by(day) %>%
  summarise(s=sum(total_passenger))
ggplot(data = line_graph, aes(x=day, y=s, group=1))+
  geom_line()+
  ggtitle("수도권 지하철 일별 이용승객수")+
  xlab("일")+
  ylab("이용승객")

# ///세부과제1





