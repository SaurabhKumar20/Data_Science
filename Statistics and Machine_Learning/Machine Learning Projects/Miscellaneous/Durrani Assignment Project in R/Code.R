#Problem 4

#Given Dataset saved in csv format
#dataset imported
dataset4 <- read.csv(file.choose(),header=T)

#Dataset attached
attach(dataset4)

#Condicting One-Way ANOVA

ANOVA4 <- aov(Effluents~Plants,data=dataset4)
ANOVA4

summary(ANOVA4)



#agricolae is the package required for Turkey test
library(agricolae) 

tukey.test <- TukeyHSD(ANOVA4)
tukey.test


plot(tukey.test,las=1)




#Problem 7

#a
testscore <- c(39,43,21,64,57,47,28,75,34,52)
examgrade <- c(65,78,52,82,92,89,73,98,56,75)

gradeversusscore <- lm(examgrade~testscore)

summary(gradeversusscore)

# Equation of estimated regression line
#y=40.7842+0.7656x   


# It can be seen from the summary results that both 'Intercept' and 'testscore' are statistically
# significant at 0.01 level of significance.
# Also, the multiple R-squared value of 0.7052, which indicates that 70.52% of the total 
# variability in the response variable (examgrade) is explained by the predictor 'testscore'.
# However, the model can still be made better by adding more relevant predictors or introducing interaction
# variables.
# Adjusted R-squared(0.6684) can also be improved.



#b

#Scatterplot
plot(testscore, examgrade,pch=19 ,col='red')

#Line of best fit
abline(lm(examgrade ~ testscore), col='blue') # plot the regression line

#To find Confidence interval of Slope for Calculus grade data
confint(gradeversusscore)







#Problem 8

#Given Dataset saved in csv format
#dataset imported
dataset <- read.csv(file.choose(),header=T)

dataset

#Dataset attached
attach(dataset)

#Multiple Linear regression model created
model8 <- lm(List_Price_y~Living_Area+Floors+Bedrooms+Bathrooms, data=dataset)

summary(model8)

#Correlation Matrix
cor(dataset)





#Problem 9

#Given Dataset saved in csv format

#dataset imported
dataset9 <- read.csv(file.choose(),header=T)
dataset9

#attaching dataset
attach(dataset9)

model9_linear <- lm(Value_added_per_work_hour_y~Size_of_store_x,data=dataset9)
summary(model9_linear)

#scatterplot created
plot(Size_of_store_x,Value_added_per_work_hour_y,pch=19,col='red')
#the plot doesn't seem to be linear


abline(model9)


#Polynomial regression model fitted
model9 <- lm(Value_added_per_work_hour_y~Size_of_store_x + I(Size_of_store_x^2),data=dataset9)
summary(model9)


anova(model9,model9_linear)


#Thick dashed blue line added to represent the Quadratic regression curve
lines(smooth.spline(Size_of_store_x ,predict(model9)),col='blue',lwd=3, lty=3)
