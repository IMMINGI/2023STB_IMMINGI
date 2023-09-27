#히스토그램
hist(finedust$`3_ultrafine dust`, main="서울시 서대문구 2020년 1월초미세먼지 측정분포", col=terrain.colors(12))
#11P 
hist(finedust$`3_ultrafine dust`, main="서울시 서대문구 2020년 1월초미세먼지 측정분포", col=terrain.colors(12), freq = FALSE)
 lines(density(finedust$`3_ultrafine dust`), lwd=2)
 
 #BOXPLOT
 boxplot(finedust$`3_fine dust`, main="야식업의 2020년 1월미세먼지 발생현황", col="yellow")
 
 #BOXPLOT(2)
 boxplot(finedust$`3_fine dust`, finedust$`7_fine dust`, main="업종별 2020년 1월 미세먼지
+ 발생현황", col="yellow", names = c("야식업","중식"))
 
 
 #15P
 plot(x=finedust$`3_fine dust`, y=finedust$`3_ultrafine dust`, 
xlab="미세먼지", ylab="초미세먼지", 
main="미세먼지와 초미세먼지의
변화")
 
 #16P (pch24변경pch11)
 plot(x=finedust$`3_fine dust`, y=finedust$`3_ultrafine dust`, xlab="미세먼지", ylab="초미세먼지", main="미세먼지와 초미세먼지의
+ + 변화", pch=11, col="red", bg="yellow", cex=1.5)
 
#18p (type=h 변경 type=o)
 plot(x=finedust$`3_fine dust`, y=finedust$`3_ultrafine dust`, xlab="미세먼지", ylab="초미세먼지", main="미세먼지와 초미세먼지의변화", type = "o")
 
 #end
 