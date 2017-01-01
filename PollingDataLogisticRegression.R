#Reading CSV file from current directory
polling<-read.csv("PollingData.csv")
#Displaying R object structure
str(polling)
#Displaying first 6 records
head(polling)
#Loading dplyr library
library(dplyr)
#Displaying all records
polling_table<-tbl_df(polling)
polling_table
#Displaying Year wise record counts using Table function
table(polling$Year)
#Displaying summary of Polling Dataset
summary(polling)
#Here considering only 4 variables from the main dataset Polling
simple<-polling[c("Rasmussen","SurveyUSA","DiffCount","PropR")]
#sqldf("select `Rasmussen`,`SurveyUSA`,`DiffCount`,`PropR` from polling")
#Displaying summary of Simple Dataset
summary(simple)
#Loading mice library
library(mice)
#Here by using md.pattern we will check null values in simple matrix
md.pattern(simple)
#The mice function will detect which variables is the data set have missing information.
imp_mice<-mice(simple,seed=144)
#This Imp(Imputation) function used for displaying values in each iteration
imp_mice$imp$Rasmussen
imp_mice$imp$SurveyUSA
#Displaying summary of Simple Dataset
summary(imp_mice)
#Complete function is used for combined imp_mice dataset to simple dataset
imputed<-complete(mice(simple,seed=144))
#Displaying summary of Imputed Dataset
summary(imputed)
#Loading Lattice library
library(lattice)
#We can inspect the distributions of the original and imputed data using the stripplot function that is part of the lattice package.
stripplot(imp_mice,pch=15,cex=1.2)
#Here it is displaying in XY plot 
xyplot(imp_mice,SurveyUSA~Rasmussen|.imp, pch=20, cex=1.2)
#Allocating Imputed data to Polling data
polling$Rasmussen<-imputed$Rasmussen
polling$SurveyUSA<-imputed$SurveyUSA
#Consider Train data from Year 2004 to 2008
Train<-subset(polling,Year==2004|Year==2008)
str(Train)
#Consider Train data from Year 2012
Test<-subset(polling,Year==2012)
str(Test)
#Taking count of 1's and 0's in Republican
table(Train$Republican)
#Taking count of sign values(-1,0,1) in Rasmussen
table(sign(Train$Rasmussen))
#Constructing Confusion matrix
table(Train$Republican,sign(Train$Rasmussen))
# Checking for Multi-Collinearity
cor(polling)
str(polling)
cor(polling[-1])
#Building the model
mod1<-glm(Republican~PropR,data=Train,family = binomial)
summary(mod1)
#Making Predictions on Train data
pred1<-predict(mod1,newdata = Train,type = "response")
pred1
table(Train$Republican,pred1>=0.5)
#Improving the Model
mod2<-glm(Republican~SurveyUSA+DiffCount,data=Train,family="binomial")
summary(mod2)
library(car)
vif(mod2)
#Making Predictions
pred2<-predict(mod2,newdata = Train,type = "response")
#Confusion Matrix
table(Train$Republican,pred2>=0.5)
#Making Predictions on Test data for smart baseline model
table(Test$Republican,sign(Test$Rasmussen))
pred_test<-predict(mod2,newdata = Test,type = "response")
#Confusion Matrix 
table(Test$Republican,pred_test>=0.5)
# Seperating the Error
#Test2<-cbind(Test,pred_test)
subset(Test,Republican==0 & pred_test>0.5)

#library(sqldf)
#sqldf("select * FROm Test2 WHERE Republican==0 AND pred_test>0.5")