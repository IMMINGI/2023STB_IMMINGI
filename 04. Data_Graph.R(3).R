#2 Step.
table(survey $ Gender)
#3 Step.
ECN <- table(survey $Gender)
prop.table(ECN)
#4 Step
table(survey $Gender, survey $Grade)
#5 Step
barplot(table(survey $Nationality))
#6 Step
barplot(table(survey $`residential area`), horiz = TRUE)
#7 Step
entry <- table(survey $Gender, survey $Grade)
barplot(entry, legend = TRUE)
#8 Step
pie(table(survey $Grade))
#9 Step
hist(survey$Age,main = "나이 분포")
#10 Step
boxplot(formula=survey$Age ~ survey$Grade,main="학년별 나이")
#11 Step
plot(x=survey$`Grade`, y=survey$`Age`, xlab="학년", ylab="나이", main="산점도",pch=11)
