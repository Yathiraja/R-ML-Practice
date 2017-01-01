#Getting Folder information
dir
#Getting current working directory
getwd()
#Setting current working directory for R 
setwd("F:/R Learning by Me")
#Reading CSV file from current directory
winedat<-read.csv("wine.csv")
#Displaying R object structure
str(winedat)
#Applying Linear Model for DataSet
model1=lm(Price ~ AGST,data=winedat)
#Displaying model summary
summary(model1)
#Getting Residuals values
model1$residuals
#Calculating SSE
SSE=sum(model1$residuals^2)
SSE
#Applying Linear Model for DataSet
model2=lm(Price ~ AGST+HarvestRain,data=winedat)
#Displaying model summary
summary(model2)
#Getting Residuals values
model2$residuals
#Calculating SSE
SSE1=sum(model2$residuals^2)
#Loading Car library
library(car)
#Calculating Variance Inflation Factors(VIF) for Linear
vif(model2)
#Applying Linear Model for DataSet for all Independent variables
model3=lm(Price ~ AGST+HarvestRain+WinterRain+Age+FrancePop,data=winedat)
#This is same as above (. - indicates all the other variables in dataset)
model3=lm(Price ~ .-Year,data=winedat)
#Displaying Model summary
summary(model3)
#Calculating SSE
SSE3=sum(model3$residuals^2)
#Calculating Variance Inflation Factors(VIF) for Linear
vif(model3)
#Applying Linear Model for DataSet
model4=lm(Price ~ HarvestRain+WinterRain,data=winedat)
#Displaying Model summary
summary(model4)
#Calculating SSE
SSE3=sum(model4$residuals^2)
#Applying Linear Model for DataSet
model5=lm(Price ~ AGST+HarvestRain+WinterRain,data=winedat)
#Displaying Model summary
summary(model5)
#Calculating SSE
SSE3=sum(model5$residuals^2)
#Applying Linear Model for DataSet
model6=lm(Price ~ AGST+HarvestRain+WinterRain+Age,data=winedat)
#Displaying Model summary
summary(model6)
#Calculating SSE
SSE3=sum(model6$residuals^2)
SSE3

model7=lm(Price ~ AGST+HarvestRain+WinterRain+FrancePop,data=winedat)
summary(model7)
SSE3=sum(model7$residuals^2)
SSE3

#Calculating Correlation
cor(winedat$WinterRain,winedat$Price)
cor(winedat$WinterRain,winedat$HarvestRain)
cor(winedat$Age,winedat$FrancePop)
cor(winedat)
?cor

#Now predicting Test Dataset
Winetest<-read.csv("wine_test.csv")
str(Winetest)
#Using predict on Test dataset
predictTest=predict(model4,newdata = Winetest)

predictTest=predict(model6,newdata = Winetest)

#calculating Sum of squares due to Error
SSET=sum((Winetest$Price - predictTest)^2)
#calculating Sum of squares Totals
SSTT=sum((Winetest$Price-mean(winedat$Price))^2)

R<-SSET/SSTT
R2<-1-R

vif(model6)

library(rmarkdown)