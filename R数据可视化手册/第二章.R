darm(list = ls())
#install.packages("ggplot2")
library(ggplot2)
data<-mtcars#读取mtcars
#散点图#
plot(data$wt,data$mpg)
qplot(wt,mpg,data=data)#qplot绘图
p<-ggplot(data,aes(x=wt,y=mpg))#ggplot绘图
p+geom_point()#点绘制命令
#折线图#
plot(pressure$temperature,pressure$pressure,type="l")
points(pressure$temperature,pressure$pressure,col="black")
lines(pressure$temperature,pressure$pressure/2,col="red")
points(pressure$temperature,pressure$pressure/2,col="red")
qplot(temperature,pressure,data=pressure,
      geom = c("line","point"))#qplot绘图
p<-ggplot(pressure,aes(x=temperature,y=pressure))#ggplot绘图
p+geom_line()#线绘制命令
p+geom_point(col="red")+geom_line(col=10)#点线同时绘制
#柱状图#
barplot(BOD$demand,names.arg = BOD$Time)
#qplot(BOD$Time, BOD$demand, geom = "bar", stat = "identity")#存在问题

ggplot(BOD,aes(x=factor(Time),y=demand))+geom_bar(stat = "identity")
p<-table(mtcars$cyl)#统计mtcars$cyl中的频数
barplot(p)
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar()
qplot(factor(cyl),data=mtcars)       
#直方图#
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 10)#组距定义为10
qplot(mtcars$mpg)
qplot(mpg,data=mtcars,binwidth=2)#直方图区间宽度
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 4)
#箱线图#
data<-ToothGrowth
plot(data$supp,data$len)#x为因子型变量，y为数值型变量
boxplot(len~supp,data=data)
boxplot(len~supp+dose,data=data)#supp+dose的因子交互
qplot(data$supp,data$len,geom = "boxplot")
qplot(interaction(supp,dose),len,data=data,geom = "boxplot")#interaction定义交互作用
ggplot(data,aes(x=supp,y=len))+geom_boxplot()
ggplot(data,aes(x=interaction(supp,dose),y=len))+geom_boxplot()#交互作用
#函数图像#
curve(x^3-5*x,from = -4,to=4)#绘制函数图像
myfun<-function(xvar){
  1/(1+exp(-xvar+10))
}#定义函数
curve(myfun(x),from = 0,to=20)
curve(1-myfun(x),add=TRUE, col="red")#在该区间内增加曲线
#qplot(c(0,20),fun=myfun,geom = "line")
ggplot(data.frame(name=c(0,20)),aes(x=name))+stat_function(fun=myfun,geom = "line")




