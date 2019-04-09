
############### Decision tree ###############


library("party")
library("partykit")
dutchctree <- ctree(Type ~ AnnualConsumption + noOfConnections, data=finalData)
print(dutchctree)
plot(as.simpleparty(dutchctree), type="simple")
