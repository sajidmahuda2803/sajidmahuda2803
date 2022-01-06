#to read a CSV file
customers=read.csv("customer.csv")
names(customers)
nrow(customers)
#to install dplyr package
install.packages("dplyr")
library("dplyr")
#to get column from a dataset:data[column no] 
#extract 1 and 4 column
data1=customers[c(1,4)],combine value
names(data1)
#extract cusID and location from customers
data2=select(customers,CusID,Location)
#get thrd column
customers[3]
#get thrd column
select(customers,Gender)
#drop columns
#drop /remove 1st,2nd,3rd column
data3=customers[-c(1,2,4)]
#drop /remove gender column
data4=select(customers,-Gender)
#to find distinct or unique value
data5=distinct(customers,Location)
##2oct  notes

#to get count of value in a column
table(customers$Location)
#to get ratio of value in a column
prop.table(table(customers$Location))
#to get percentage of value in a column
prop.table(table(customers$Location))*100
#arrange data
data6=arrange(customers,desc(Age))
help(sort)
sort(customers$Age, decreasing = FALSE)
help(arrange)
arrange(customers,Age)

customers$Age=sort(customers$Age)
data.frame(
  #filter:to filter the data  with matching condition
#Cus_KOl=filter(customers,Location=='Kolkata')
  #using pipe operator
  cusid=customers%>% filter(Age>30 & Location=='Kolkota')%>% select(CusID))
count(customers,Location=='Bangalore')
#aggregate func:mean,sum etc=multiple i/p but single o/p
# aggregate fn with pipe operator
#to get min age ,max age ,and mean age 
min(customers$Age)
max(customers$Age)
mean(customers$Age)
customers%>%summarise(min(Age),max(Age),mean(Age))
#get cusid and gender of the customer whrre age>20 location =banglore
data8=customers %>% filter(Age>20 & Location=='Bangalore')%>%select(CusID,Gender)
#group by mean age for M/F
datam=customers %>%group_by(Gender)%>%summarise(Mean_Age=mean(Age))
datan=customers %>%group_by(Location)%>%summarise(Mean_Age=mean(Age))
datac=customers %>%group_by(Location)%>%summarise(Mean_Age=mean(Age),Cnt=n())
datab=customers %>%group_by(Gender,Location)%>%summarise(Mean_Age=mean(Age))
datay=customers %>%group_by(Location)%>%summarise(mean(Age),max(Age))
#get
data10=select(customers,starts_with('A'),starts_with('L'))
customers%>%group_by(Gender)%>%summarise(mean(Age))
customers%>%filter(Location=='Bangalore')%>%select(CusID)
count(customers,Location=='Bangalore')
customers%>%group_by(Location)%>%summarise(mean(Age))
#7 october
#to check structure of the data
str(iris)
a=c(3,4)
b=c("Rohit","Rahul","Virat")
b=as.factor(b)
View(iris)
data2=iris
#cbind (useful to add column)
data3=cbind(iris,data2$Sepal.Length)
data4=cbind(iris,data2)
data5=rename(iris,sajid=Sepal.Width)
data6=cbind(iris,data5$sajid)
#extract 7,9,28 row
data7=iris[c(7,9,28),]
data8=iris[c(10,90),]
#rbind (row binding)
data9=rbind(data7,data8)
#(2,5,20) are vector but when we have (2,5,9,"Bangalore")then it is list
#create a list
mylist=list(5,10,"Bangalore")
# is ordered?
mylist[3]
#is mutable?
mylist[3]="Mumbai"
mylist
#data structure in R:vector (factor), list, matrix, data frame
#vector



a=c(20,50,60)
a[3]
a[2]=100
str(iris)
#species is a factor column with 3 unique value but they all are repeated
#list: list can contain different types of data 
mylist=list(20,'Rahul',56)
mylist[2]
mylist[2]="Sachin"
#whether the data structure is ordered ????
#whether mutable??

#matrix : two dimensional dataset in R. (all elements within a vector should be from same class 
mymatrix=matrix(c(2,6,9,50,20,70,80,100,5,7,99,105),4,3)
mymatrix

mymatrix[4,2]
mymatrix[3,3]=600
mymatrix
#dataframe 
df1=data.frame(Cusid=c(1,2,3,4),Name=c("Rahul", "Sachin", "Virat","Dhoni"), Age=c(30,40,60,80))
a=c(20,50,90)
b=c(60,100,150)
cbind(a,b)
rbind(a,b)
df2=data.frame(Cusid=c(1,2,3),Location=c("Bangalore","New Delhi","Chennai"))
df3=(c(4,"Goa",10))
df4=rbind(df2,df3)
row.names(df4,)
#left join(left table first then right table), right join(right table first then left table), inner join (both common rows mess up), full join(everything mess up or join)
# 
df
df1=data.frame(cusid=c(1,2,3,4),name=c("Rahul","Sachin","Virat","Dhoni"))
df2=data.frame(C.ID=c(1,2,4,5),Age=c(49,48,39,50),Location=c("Bang","Chen","Bang","Chen"))
library(dplyr)
#left join
left_join(df1,df2,by=c("cusid"="C.ID"))
right_join(df1,df2,by=c("cusid"="C.ID"))
#inner join
inner_join(df1,df2,by=c("cusid"="C.ID"))
full_join(df1,df2,by=c("cusid"="C.ID"))
#anti join# left table missing isnt existing on right table
anti_join(df1,df2,by=c("cusid"="C.ID"))
anti_join(df2,df1,by=c("C.ID"="cusid"))
df1
df2
#next class
install.packages("ggplot2")
library("ggplot2") 
#barplot
#ggplot(data =dataset,aes(x=var.in x-axis, y=var. in y-axis) )+geom_plot()***
View(mpg)
ggplot(data=mpg,aes(x=class))+geom_bar(fill=c("green","blue","yellow","pink","orange","red","white"))
plot=ggplot(data=mpg,aes(y=class))+geom_bar(fill=c("green","blue","yellow","pink","orange","red","white"))
plot+labs(title = "count of car segment",x="count of car",y="car segments")
#histogram
ggplot(data=mpg,aes(x=hwy))+geom_histogram(bins = 6,color="black",fill="green")
#scatter plot
ggplot(data=mpg,aes(x=cty,y=hwy))+geom_point()
#box plot
ggplot(data=mpg,aes(x=class,y=hwy))+geom_boxplot()

#Business problem
#EDA=1=to check datatypes==str(mpg)****very important to find whether the dataset is character or numeric
library(dplyr)
x1=mpg
str(mpg)
View(mpg)
#EDA=2=to check duplicate data 
#Data_without_dup_values=distinct(mpg,manufacturer,.keep_all = TRUE)***
Data_without_dup_values=distinct(mpg,manufacturer,.keep_all = TRUE)
Data_without_dup_values4=distinct(mpg,.keep_all = TRUE)
help("distinct")
help(sub)
Data_without_dup_values3=distinct(mpg,manufacturer)

##titanic=read.csv("titanic.csv",na.strings="")***
titanic=read.csv("titanic.csv",na.strings="")
#to check status of missing values
(sum(is.na(titanic)))
#any(is.na(titanic))......imp
#to check missing values in a column
any(is.na(titanic$PassengerId))
any(is.na(titanic$Survived))
any(is.na(titanic$Pclass))
any(is.na(titanic$Age))#####TRUE
any(is.na(titanic$SibSp))
any(is.na(titanic$Parch))
any(is.na(titanic$Ticket))
any(is.na(titanic$Fare))
any(is.na(titanic$Cabin))###TRUE
any(is.na(titanic$Embarked))###TRUE
#to count missing value 
sum(is.na(titanic))
titanic%>%count(any(is.na(titanic)))
#sum(is.na(c(titanic$Age,titanic$Cabin,titanic$Embarked)))===it is mine
sum(is.na(titanic$Age))
#get percentage of missing values in age,cabin and embarked
prop.table(table(titanic$Age))*100
#sum(is.na(titanic$Age))/891*100===it is mine
sum(is.na(titanic$Age))/891*100
sum(is.na(titanic$Embarked))/891*100
length(titanic$Age)
##sum(is.na(titanic$Age))/length(titanic$Age)*100******
sum(is.na(titanic$Age))/length(titanic$Age)*100
titanic$Embarked[is.na(titanic$Embarked)]


#previous homework
my_data=read.csv("my_data.csv")
data1=distinct(my_data,Index,.keep_all = TRUE)
library("dplyr")
data2=my_data%>%select(starts_with("Y"))
data3=my_data%>%contains("I")
data4=my_data%>%filter(Index=="A"|Index=="C")
data5=my_data%>%filter(Index!="A")%>%filter(Index!="C")
data5=my_data%>%filter(c(Index!="A,C"))
#data5=filter(my_data,!Index%in% c("A","C"))****
data5=filter(my_data,!Index%in% c("A","C"))
my_data%>%select(Y2015)%>%summarise(mean(Y2015), sum(Y2015))
data8=my_data%>%group_by(Index)%>%summarise(mean(Y2011),median(Y2011))
data6=sample_frac(my_data,0.1)
data7=sample_n(my_data,20)

customers=read.csv("customers.csv",na.strings = "")
#hot encoding
install.packages("fastDummies")
library("fastDummies")
dummy_data=dummy_cols(customers,select_columns=c("Location","Gender"))
#label encoder
customers$Location=as.factor(customers$Location)
customers$Location=as.vector(customers$Location)
customers$Location=as.numeric(customers$Location)
dummy_data=dummy.coef (customers,select_columns=c("Location"))


#load the computer_data
summary(com_data$price)
#explore a categorical variable
#to get frequency of values in a column
table(com_data$premium)
prop.table(table(com_data$premium))
apply(dataset,1,mean)


View(iris)
#get mean of each column of iris using apply function
#apply (dataset, 1(row wise)/2(column wise),function)
apply(iris[-5],2,mean)
#GET sum of each column-->column no:1,3,4
apply(iris[c(1,3,4)],2,sum)
apply(iris[-c(2,5)],2,sum)
data1=apply(iris[-5],2,function(x) x/5)
# create a data frame
df=data.frame(CusID=c(1,2,3),jan=c(40000,60000,80000), feb=c(60000,5000,4000),mar=c(10000,9000,70000))
#ifelse (value>50000,1,0)
apply(df[-1],2,function(x) ifelse(x>50000,1,0))
apply(df[-1],2,function(x) ifelse(x>50000,999,0))
apply(df[-1],2,function(x) ifelse(x>50000,1,x))



View(iris)
cor(iris$Sepal.Length,iris$Petal.Length)
cor(iris[-5])

com_data=read.csv("com_data.csv",na.strings = "")
mean(com_data$price)
# use of summary function to find the value of min,1 quadrile,mean/median,3rd quadrile,max value of that dataset
summary(com_data$price)
#explore a categorical variable
#to get frequency of values in a column
table(com_data$premium)***
  data1=com_data%>% select("premium")%>%group_by(premium)%>% count(premium)

#use of apply function
apply(com_data[c(2,3)],2,sum)
#use row wise *****
apply(com_data[c(2,7,9),c(2,3,4,5,6)],1,sum)


#check null hypothesis and alternative hypothesis (p value less than 0.05=alternative hypothesis and vice versa
chisq.test(com_data$multi,com_data$premium)
# t test -sample size <30, Anova (analysis of variance)
#formula (DV~IV, data=dataset)
anova_test=aov(price~multi,data=com_data)
summary(anova_test)
#gsub(('\\$|,',',card$credit_limit))

#17 nov (extra class)

com_data=read.csv("com_data.csv",na.strings = "")
#choose 70% and 30% data
trainset=com_data[1:4382,]
testset=com_data[4383:6259,]
# to divide the data into training set and test set
install.packages("caTools")
library("caTools")
#check ratio of YES/NO in premium column (after n before spliting)
sample=sample.split(com_data$premium,SplitRatio = .70)
trainset=subset(com_data,sample==TRUE)
testset=subset(com_data,sample==FALSE)  
prop.table(table(com_data$premium))*100
prop.table(table(trainset$premium))*100
com_data=cbind(com_data,sample)

#24 nov
data=read.csv("marketing_Data.csv",na.strings = "")
summary(data)
#replace missing values with mean of that column
data$youtube[is.na(data$youtube)]=mean(data$youtube,na.rm = TRUE)
data$facebook[is.na(data$facebook)]=mean(data$facebook,na.rm = TRUE)
data$newspaper[is.na(data$newspaper)]=mean(data$newspaper,na.rm = TRUE)
data$sales[is.na(data$sales)]=mean(data$sales,na.rm = TRUE)
#remove first column
data=data[-1]
#divide the data into training and train set
sample=sample.split(data$sales,SplitRatio = .8)
trainset=subset(data,sample==TRUE)
testset=subset(data,sample==FALSE)
data_flag=cbind(data,sample)
#develop model
model=lm(sales~(youtube+facebook+newspaper),data = trainset)
#drop the dependent variables from testset 
sales_testset=testset[4]
testset=testset[-4]
#apply the model into testset
predicted_sales=predict(model,testset)
#actual and predicted sales
Actual_predicted=cbind(actual_sales=sales_testset,predicted_sales=predicted_sales)
#validation of regression model
#1=mean abs. error (MAE)
#2=mean sqr. error(MSE)
#3=root mean sqr. error (RMSE)
#4=mean abs. % error (MAPE)
#use MLmetrics
library("MLmetrics")
MAPE(Actual_predicted$predicted_sales,Actual_predicted$sales)
#share this developed model
#save the model for deployment
saveRDS(model,"./Sajid_sales_prediction_model.rds")



sample=sample.split(data$sales,SplitRatio = .80)
View(sample)
trainset=subset(data,sample==TRUE)
testset=subset(data,sample==FALSE)
#develop model
model=lm(sales~(youtube+facebook+newspaper),data=trainset)
#drop the dependent variables from testset
sales_testset=testset[4]
testset=testset[-4]
#apply the model into testset
predicted_sales=predict(model,testset)
#actual and predicted sales
actual_predicted=cbind(actual_sales=sales_testset,predicted_sales=predicted_sales)
#validation
install.packages("MLmetrics")
library("MLmetrics")
MAPE(actual_predicted$predicted_sales,actual_predicted$sales)
#save the model for deployment
saveRDS(model,"./")


#29 NOV

plot(data$youtube,data$facebook)
cor(data[c(2,3,4)])
boxplot(data$youtube)
#lm= linear model

#4 dec
titanic=read.csv("titanic.csv", na.strings = "")
summary(titanic)
titanic=titanic[-c(1,4,9,10,11)]
sum(is.na(titanic))
titanic$Age[is.na(titanic$Age)]=mean(titanic$Age,na.rm = TRUE)
titanic$Embarked[is.na(titanic$Embarked)]="S"
#divide the data into trainset and test set
#install.packages("caTools"")
#library("caTools")
sample=sample.split(titanic$Survived,SplitRatio = 0.8)
trainset=subset(titanic,sample=TRUE)  
testset =subset(titanic,sample=FALSE)  
#model
model=glm(Survived~.,data=trainset,family=binomial())
#apply the model in test set
testset$predicted_value=predict(model,testset,type='response')
testset$predicted_survival=ifelse(testset$predicted_value>0.5,1,0)
  library("MLmetrics")
ConfusionMatrix(testset$predicted_survival,testset$Survived)  
  

#arules,arulesViz
install.packages("arules")
install.packages("arulesViz")
 library("arules") 
library("arulesViz")  
apriori()

#to read a csv file
customers=read.csv("Customer.csv")
Mark_data=read.csv("Marketing_Data.csv",na.strings = "")
library("arules")
library("arulesViz")
install.packages("ggplot")
library("ggplot2")
#get facebook and newspaper 
data=Mark_data[c(3,4)]
data$newspaper[is.na(data$newspaper)]=mean(data$newspaper,na.rm = TRUE)
data$facebook[is.na(data$facebook)]=mean(data$facebook,na.rm = TRUE)

#to find optimum no. of cluster
help(kmeans)
wcss=vector()
for(i in 1:10){
  wcss[i]=sum(kmeans(data,i)$withinss)
}
#to form elbow plot
help(plot)
plot(1:10,wcss,type="b",xlab = "no of clusters",ylab = "wcss")
#apply kmeans
km=kmeans(data,5,iter.max = 500)
km$cluster
Mark_data$cluster_no=km$cluster
#to visualise 
install.packages("cluster")
library("cluster")
clusplot(data,km$cluster,lines = 0, shade = TRUE, color = TRUE,labels= 2, xlab = "facebook",ylab = "newspaper")


#coursera
View(mtcars)
mean(mtcars$mpg)
matrix(c(1,2,3,4,5,6,7,8),nrow = 4,ncol = 2)
matrix(c(1,2,3,4,5,6,7,8),nrow = 4,ncol = 2)
help(iris)
source("https://bioconductor.org/.R")
bioclite("GenomicFeatures")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()
BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))
install.packages("devtools")
install.packages()
old.packages()
help(devtools)
session_info()
sessionInfo()
sessioninfo::os_name()
install.packages("KernSmooth")
library(KernSmooth)






























  
  
  

