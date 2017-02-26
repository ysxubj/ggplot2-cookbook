rm(list = ls())
#条形图#
#install.packages("gcookbook")
library(gcookbook)
library(ggplot2)
#字符型变量
data<-pg_mean
ggplot(data,aes(x=group,y=weight))+geom_bar(stat = "identity")#ggplot基本柱状图绘制
#数值型变量
data<-BOD
str(BOD)#查找BOD中的变量类型
ggplot(data,aes(x=factor(Time),y=demand))+geom_bar(stat = "identity")
#颜色调整和边框添加
data<-pg_mean
p<-ggplot(data,aes(x=group,y=weight))
p+geom_bar(stat = "identity",fill="lightblue",colour="black")#ggplot基本柱状图绘制
#簇状条形图
data<-cabbage_exp
p<-ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat
  = "identity",position = "dodge",colour="black")#Cultivar分类变量，position="dodge"水平错开
p+geom_bar(stat= "identity",position = "dodge",colour="black")
p+scale_fill_brewer(palette = "Pastell")
data<-cabbage_exp[1:5,]
p<-ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat
   = "identity",position = "dodge",colour="black")#Cultivar分类变量，position="dodge"水平错开
p+geom_bar(stat= "identity",position = "dodge",colour="black")
p+scale_fill_brewer(palette = "Pastell")#自动配色
#频率条形图
data<-diamonds
ggplot(data,aes(x= cut))+geom_bar()#对x的出现频率进行统计,geom_bar()默认统计每组变量的对应观测数
ggplot(data,aes(x=carat))+geom_bar()#连续型的变量
ggplot(data,aes(x=factor(carat)))+geom_bar()#转为因子型变量
data<-uspopchange
usdata<-subset(data,rank(Change)>40)
ggplot(usdata,aes(x=Abb,y=Change,fill=Region))+geom_bar(stat= "identity",col="black")
#按照Change排序,手动配色,xlab命名
p<-ggplot(usdata,aes(x=reorder(Abb,Change),y=Change,fill=Region))
p+geom_bar(stat= "identity",col="black")+scale_fill_manual(values = c("#669933","#FFCC66"))+xlab("Stata")
#正负条形图,自定义颜色分类指标,移除图例
data<-climate
newdata<-subset(data,Source=="Berkeley"& Year>=1900)
newdata$TF<-newdata$Anomaly10y>0
ggplot(newdata,aes(x=Year,y=Anomaly10y,fill=TF))+
  geom_bar(stat= "identity",position = "dodge")+
  ylab("Your name")+scale_fill_manual(values=c("#CCEEFF","#FFDDDD"),guide=F)
#调整条状宽度,width调整宽度
data<-pg_mean
ggplot(data,aes(x=group,y=weight))+geom_bar(stat="identity",width = 0.5)
data<-cabbage_exp
ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat="identity",position = "dodge",width = 0.5)
ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat="identity",width = 0.5,position=position_dodge(0.9))
#绘制堆叠图
data<-cabbage_exp
p<-ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat = "identity")
p+guides(fill=guide_legend(reverse = F))
library(plyr)#使用desc()函数,对图像进排序
ggplot(data,aes(x=Date,y=Weight,fill=Cultivar,order=desc(Cultivar)))+geom_bar(stat = "identity",colour="black")+
  guides(fill=guide_legend(reverse = F))+
  scale_fill_brewer(palette = "Pastell")
library(plyr)
ce<-ddply(data,"Date",transform,percent_weight=Weight/sum(Weight)*100)
ggplot(ce,aes(x=Date,y=percent_weight,fill=Cultivar))+geom_bar(stat="identity")+guides(fill=guide_legend(reverse = F))
#添加数据标签
data<-cabbage_exp
ggplot(data,aes(x=Date,y=Weight,fill=Cultivar))+
  geom_bar(stat="identity",position = "dodge")+
  geom_text(aes(y=Weight-0.1,label=Weight),vjust=1.5,col="white",position = position_dodge(0.9),size=3)+#给柱状图添加标签
  ylim(0,max(data$Weight)*1.5)#拉长y坐标轴












