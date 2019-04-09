library(RCurl)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012011.csv")
data1 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012012.csv")
data2 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012013.csv")
data3 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012014.csv")
data4 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012015.csv")
data5 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012016.csv")
data6 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012017.csv")
data7 <- read.csv (text = download)
download <- getURL("https://raw.githubusercontent.com/rajeshbuny/Dutch_project/master/liander_electricity_01012018.csv")
data8 <- read.csv (text = download)

library(sqldf)
df1<-  sqldf("select * from data1 order by random() limit 400")
df2<- sqldf("select * from data2 order by random() limit 400")
df3<- sqldf("select * from data3 order by random() limit 400")
df4<- sqldf("select * from data4 order by random() limit 400")
df5<- sqldf("select * from data5 order by random() limit 400")
df6<- sqldf("select * from data6 order by random() limit 400")
df7<- sqldf("select * from data7 order by random() limit 400")
df8<- sqldf("select * from data8 order by random() limit 400")
tempData = rbind(df1,df2,df3,df4,df5,df6,df7,df8)
nrow(tempData)
head(tempData)
names(tempData)


library(dplyr)
finalData <- select(tempData,
                    PurchaseArea = purchase_area,
                    Street = street,
                    City = city,
                    Type = type_of_connection,
                    AnnualConsumption = annual_consume,
                    noOfConnections = num_connections
)
#performing basic checks
names(finalData)
head(finalData)
nrow(finalData)
sum(is.na(finalData))
library(sqldf)
sqldf("select distinct(Type) from finalData")