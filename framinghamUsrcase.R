dir
getwd()
setwd("F:/R Learning by Me")
framingham <- read.csv(file="framingham.csv", header=TRUE, sep=",")
str(framingham)
sapply(framingham, class)

