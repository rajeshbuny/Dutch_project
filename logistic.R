
############ Logistic regression ############

logitMod <- glm(Category ~ AnnualConsumption + noOfConnections, 
                data=trainingDataTemp, 
                family=binomial(link="logit"))

predicted <- predict(logitMod, testDataTemp, type="response")  # predicted scores
head(predicted)

table(testDataTemp$Category, predicted > 0.8)

library(InformationValue)
plotROC(testDataTemp, predicted)

library("ggplot2")
pl <- ggplot(trainingDataTemp, aes(Category, as.numeric(AnnualConsumption + noOfConnections),
                                   color=AnnualConsumption + noOfConnections)) +
  geom_point(position=position_jitter(height=0.03, width=0)) +
  geom_line( color='red', size=3, alpha=0.5)+
  xlab("Pr (Category)") + ylab("AnnualConsumption + noOfConnections")

print(pl)
