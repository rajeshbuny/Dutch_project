
########### univariate analysis ############

library(psych)
describe(finalData$AnnualConsumption)
library(pastecs)
stat.desc(finalData$AnnualConsumption)

hist(finalData$AnnualConsumption,
     main = "Annual Consumption Plot",
     xlab = "Annual Consumption",
     col = "green",
     border = "red", 
     xlim = c(0,20000),
     ylim = c(0,250),
     breaks = 200)

boxplot(finalData$AnnualConsumption,
        main = toupper("Boxplot of Annual Consumption"),
        ylab = "Frequency",
        col = "green")

d <- density(finalData$AnnualConsumption)
plot(d, main = "Kernel density of Annual Consumption")
polygon(d, col = "blue", border = "black")

set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(finalData), 0.8*nrow(finalData))  # row indices for training data
trainingDataPow <- finalData[trainingRowIndex, ]  # model training data
testDataPow  <- finalData[-trainingRowIndex, ]   # test data
dim(trainingDataPow)
dim(testDataPow)

describe(trainingDataPow$AnnualConsumption)

trainingDataTemp <- trainingDataPow
trainingDataTemp$Category <- ifelse(trainingDataTemp$AnnualConsumption >=4500, 1, 0)
library(sqldf)
sqldf("select Category,count(*) from trainingDataTemp group by Category")

testDataTemp <- testDataPow
testDataTemp$Category <- ifelse(testDataTemp$AnnualConsumption >=4500, 1, 0)
library(sqldf)
sqldf("select Category,count(*) from testDataTemp group by Category")



############ ANOVA ##########

anovaResult <- aov(trainingDataPow$AnnualConsumption ~ trainingDataPow$Type, data=trainingDataPow)
TukeyHSD(anovaResult)
plot(anovaResult, 1)
