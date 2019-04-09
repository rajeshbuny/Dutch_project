
############# SVM ##############

finalDataSvm <- finalData
names(finalDataSvm)
library(sqldf)

finalDataSvm <- mutate(finalDataSvm, Type = ifelse(Type == "3x25" ,0 ,
                                                   ifelse(Type == "1x25",1 ,
                                                          ifelse(Type == "1x50",2 ,
                                                                 ifelse(Type == "3x35",3 ,
                                                                        ifelse(Type == "1x35",4, 
                                                                               ifelse(Type == "OBK",5,
                                                                                      ifelse(Type == "3x80",6,
                                                                                             ifelse(Type == "3x63", 7,
                                                                                                    ifelse(Type == "3x50",8,
                                                                                                           ifelse(Type == "1x6",9,10
                                                                                                           )))))))))))
table(finalDataSvm$Type)
library(e1071)
fit <- svm(Type ~ AnnualConsumption , data=finalDataSvm, type='C-classification', kernel='linear')
summary(fit)
str(finalDataSvm)

svm_pred <- predict(fit,finalDataSvm)

table(svm_pred)

plot(fit, finalDataSvm,Type~AnnualConsumption,symbolPalette = rainbow(1),col = c("white","red","green","blue","orange"))

head(finalDataSvm$Type)
