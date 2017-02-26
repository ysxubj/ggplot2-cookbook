###############第七章###################
rm(list = ls())
library(ggplot2)
#添加文本注解
data<-faithful
View(data)
p<-ggplot(data,aes(x=eruptions,y=waiting))+geom_point()
p+annotate("text",x=3,y=48,label="Group1",family="serif",fontface="italic",col="red")+
  annotate("text",x=4.5,y=66,label="Group2",family="serif",fontface="italic",col="red")#"text"几何对象，family字体，fontface例如斜体
#标注的位置确定
p<-ggplot(data,aes(x=eruptions,y=waiting))+geom_point()
p+annotate("text",x=-Inf,y=Inf,label="Uper name",family="serif",fontface="italic",col="red",hjust=-0.2,vjust=2)+
  annotate("text",x=mean(range(data$eruptions)),y=-Inf,label="down name",family="serif",fontface="italic",col="red",vjust=-2)#"text"几何对象，family字体，fontface例如斜体
#注解使用数学表达式
p<-ggplot(data.frame(x=c(-3,3)),aes(x=x))+stat_function(fun = dnorm)
p+annotate("text",parse=TRUE,x=2,y=0.3,label="frac(1,sqrt(2*pi))*e^{-x^2/2}")#公式添加方式一
p+annotate("text",parse=TRUE,x=2,y=0.3,label="'Function:'*y==frac(1,sqrt(2*pi))*e^{-x^2/2}")#公式添加方式二
#添加直线
library(gcookbook)
data<-heightweight
View(data)
ggplot(data,aes(y))