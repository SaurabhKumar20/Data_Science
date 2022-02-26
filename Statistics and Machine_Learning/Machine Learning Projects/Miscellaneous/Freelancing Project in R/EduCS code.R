library(caTools)#for splitting datasets into training and test sets; mainly for using split
library(caret) #for evaluation metrics like RMSE, R^2 and MAE



#Read the data
educCS

head(educCS,5) # Displays first 5 records of educCS table



dataset <- educCS

colnames(dataset)


str(dataset)




summary(dataset)#to display summary of the dataset

sum(is.na(dataset))
#Clearly, there are no missing values in the dataset. SO, no imputations required.

attach(dataset)
qqnorm(lwage)

hist(lwage,breaks = 20)   

#Checking whether the Response variable conforms with the Normal Distribution
qqnorm(lwage)


#From the qqplot, it deviation from the line, indicates that clearly the distribution of y is clearly not normal.


set.seed(2022)
x <- seq(0,10,0.1)

#Estimatiion of gamma distribution paramters from y values
alpha <- ((mean(educCS$lwage))^2)/var(educCS$lwage)
beta <- (mean(educCS$lwage))/var(educCS$lwage)

hist(educCS$lwage,probability = T)
lines(x,dgamma(x,alpha,beta), type='l', col='red')
#Histogram of Dependent/Response variable resembles gamma distribution.
#So, the assumption of Gamma distribution modelling the size of wage returns holds.



unique(lwage>0)
#Also, since all the values of lwage are positive, gamma distribution would be apt


#Splitting into Train and Test datasets

set.seed(123)
split<-sample.split(dataset, SplitRatio = 0.8)
# we have to just write the dependent variable
#we write the dependent variable
#Split ratio splits the observations into training and test data sets


training_set = subset(dataset, split==TRUE)
# Training_set formed


test_set = subset(dataset, split==FALSE)
#Test_set formed


colnames(training_set)

# Assigning the Response variable to variable y_train and y_test
y_train<-training_set[c(10)]
y_test <- test_set[c(10)]



#data attached
detach(dataset)

attach(training_set)



#Generalised Linear Model created, using inverse link function and Gamma family
model <- glm(lwage~educ+age+momdad14+sinmom14+black+married+libcrd14+exper+expersq+region
             +dist4y+closure+inher+fathEI+children+house+foreign+gender,family=Gamma)


summary(model)
#AIC for this model is 1394.7.

BIC(model)
#BIC for model is 1497.789.

model





#Second model created by removing insignificant coefficients. This is obtained from the last model.
model2 <- glm(lwage~educ+age+exper+expersq
             +dist4y+closure+fathEI,family=Gamma)

summary(model2)
#AIC for this model is 1377.4, better than the previous model

BIC(model2)
#1423.794

anova(model2, model,test='Chi')
#Since, we are comparing two non-normally distributed data, we shall compare the two models by applying the 
#Chi square test. 
#Clearly, model2 is an improvement over model1, in terms of AIC. Also, since Pr(>Chi)=0.9454, which is greater than 5%, indicates
#that the two models are not significantly different from each other. We are okay with removing the non-significant variables.
#Thus, model2 is better than model.




model3 <- glm(lwage~educ+I(age^2)+age+exper+expersq
              +dist4y+factor(closure)+fathEI,family=Gamma)
summary(model3)
#Adding a higher degree variable for a significant variable (age), i.e. age^2. This has further reduced AIC of the model.

BIC(model3)
#1428.762

anova(model2, model3,test='Chi')

#Clearly, model2 is an improvement over model1, in terms of AIC. Pr(>Chi)=0.1385, which is greater than 5%, indicates
#that the two models are not significantly different from each other. 
#So, model2 is better than model3. Introducing additional variables didn't add significant reduction in AIC.




#Adding a new variable expersq^2
model4 <- glm(lwage~educ+age+exper+expersq+I(expersq^2)
              +dist4y+factor(closure)+fathEI,family=Gamma)

summary(model4)
#Further reduction of AIC, with this new addition to 1367.2.

BIC(model4)
#1418.786

anova(model4, model2,test='Chi')
#Since Pr(>Chi)=0.0004596 , obtained is <5%, there is significant difference between these two models,
#So, we add that new covariate expersq^2 here.
#Model4 is certainly better than model 2.




model5 <- glm(lwage~educ+age+exper+expersq+I(expersq^2)+I(expersq^3)
              +dist4y+factor(closure)+fathEI,family=Gamma)
summary(model5)
#Further reduction in AIC to 1312.7, clearly suggests that model5 is better.

BIC(model5)
#1369.367

anova(model5, model4,test='Chi')
#Again, model5 is superior to model 4, because Pr(>Chi)=2.399e-14<5%.





model6 <- glm(lwage~educ+age+exper+expersq+I(expersq^2)+I(expersq^3)+I(expersq^4)
              +dist4y+factor(closure)+fathEI,family=Gamma)
summary(model6)

AIC(model6)
1313

BIC(model6)
1374.829

anova(model5, model6,test='Chi')
#Since, Pr(>Chi)=0.192<5%, adding additionl variable doesn't significantly change the model. 
#So, we prefer model5 to model6.





#Adding the interaction variable expersq:edu
model7 <- glm(lwage~educ+expersq:educ+age+exper+expersq+I(expersq^2)+I(expersq^3)
              +dist4y+factor(closure)+fathEI,family=Gamma)
summary(model7)
#AIC increased, so we reject this model.

BIC(model7)
#1375.04

anova(model5, model7,test='Chi')
#Model7 is not significantly different from model5. So, we prefer model5 to model7.




model8 <- glm(lwage~educ+age+exper+expersq+expersq:dist4y+I(expersq^2)+I(expersq^3)
              +dist4y+factor(closure)+fathEI,family=Gamma)
  
summary(model8)
#Significant reduction in AIC suggests that model8 is better

BIC(model8)
#1325.272

anova(model8, model5,test='Chi')
#Model8 is certainly better than model7. Pr(>Chi)=4.374e-13<5%, suggests that model8 is significantly different from
# model5. Its AIC has also reduced to 1263.4. We prefer model8 to model5.



#Adding the interaction variable expersq:closure
model9 <- glm(lwage~educ+age+exper+expersq+expersq:dist4y+expersq:factor(closure)+I(expersq^2)+I(expersq^3)
              +dist4y+factor(closure)+fathEI,family=Gamma)

summary(model9)
#Further reduction in AIC to 1208.5, suggests that model9 is even better.

BIC(model9)
#1275.46

anova(model9, model8,test='Chi')
#Model9 is certainly better than model8. Pr(>Chi)=2.165e-14<5%, suggests that model9 is significantly different from
# model8. AIC of model9 has also reduced.



#Adding the interaction variable expersq:fathEI
model10 <- glm(lwage~educ+expersq:educ+expersq:dist4y+expersq:closure+expersq:fathEI+age+married+exper+expersq+I(expersq^2)+I(expersq^3)
              +dist4y+closure+fathEI,training_set,family=Gamma)


summary(model10)
#Further reduction in AIC to 626.75, suggests that model10 is even better.

BIC(model10)
#708.7788, lowest so far.

anova(model10, model9,test='Chi')
#Model10 is certainly better than model9. Pr(>Chi)=2.2e-16<5%, suggests that model10 is significantly different from
# model9.

#Removing variable 'married'
model11 <- glm(lwage~educ+expersq:educ+expersq:dist4y+expersq:closure+expersq:fathEI+age+exper+expersq+I(expersq^2)+I(expersq^3)
               +dist4y+closure+fathEI,training_set,family=Gamma)

summary(model11)

anova(model10, model11,test='Chi')
# Removing variable 'married', causes both AIC and BIC, to reduce further.
#Clearly, model11 is an improvement over model10, in terms of AIC. Also, Pr(>Chi)=0.4233, which is greater than 5%, indicates that the two models are not significantly different from each other. 
#So, model11 having lesser covariates, is better than model10. Infact, it's the best model obtained so far.


BIC(model11)
#702.2685


test_set_covariates <- test_set[c(-10)]



test_set_pred <- predict(model11,newdata =test_set_covariates,type="response")
test_set_pred







plot(model11$fitted.values,residuals(model11),col='blue')
#Plot suggests that the residuals show some pattern with fitted values. For lower values of fitted values, the 
#residuals exhibit higher variance, which decreases with increasing magnitude of the fitted values.
#This indicates that the inital selection of variables for model building can be looked into.


plot(residuals(model11,type='deviance'),col='brown')
#It can be seen that the residuals of the model11 are symmetrical about origin, having a constant variance; and
#likely to have an approximately normal distributions.




plot(y_test-test_set_pred,col='red')
#plot suggests normally distributed errors symmetrical about origin


plot(model11)



#Evaluating model10:

summary(model11)

AIC(model11)
#AIC of the model 10 is 626.3049, lowest value obtained so far.

BIC(model11)
#708.7788, lowest value obtained so far. So, this is the best model, so far.


RMSE(test_set_pred,y_test$lwage)
#0.2946545 is the RMSE obtained for test-dataset. Being very close to 0, it solidifies the fact that model10 
#is accurate in predicting the output for unknown dataset. 

MAE(test_set_pred,y_test$lwage)
#0.2359111

R2(test_set_pred,y_test$lwage)
#0.9793768


