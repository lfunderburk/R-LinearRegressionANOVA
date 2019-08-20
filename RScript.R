## Script Author: Laura Gutierrez Funderburk
## RLadies R Workshop: Introduction to Linear Regression
## and Analysis of Variance (ANOVA)
## Simon Fraser University, August 2019

### PART I: Linear Regression
# Import datasets 
cars<-read.table("CARSDATA.csv",sep=",", header=TRUE)
cars

# Check if there are NaN values - should return TRUE if not
complete.cases(cars)

# Plot all variables
plot(cars)

# Set up linear model
car_model <- lm(cars$dist ~ cars$speed)
car_model

mean(car_model$residuals)

# Plot model statistics -evaluate whether data follows Normal distribution, residuals follow non-linear pattern, etc
print("Diagnostics plots")
par(mfrow=c(2,2))
plot(car_model)


print("Linear Regression Summary")
lm.out = with(cars,car_model)

print(summary(lm.out))

print("ANOVA summary")
print(summary.aov(lm.out))
aov.out = aov(cars$dist~cars$speed,data = cars)


print("Shapiro-Wilk normality test")
print("If the p-value of the Shapiro-Wilk Test is greater than 0.05, the data is normal")
ins.residuals <- residuals(object = aov.out)
print(shapiro.test(x = ins.residuals))



# Plot fitted model against data 
par(mfrow=c(1,1))
plot(cars$dist ~ cars$speed)
abline(car_model, col="blue", lwd=3)

# Significance 
summary(car_model)

# Make predictions 
# Predict data
# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling

#The confidence interval reflects the uncertainty 
# around the mean predictions. To display the 95% 
# confidence intervals around the mean the predictions, 
# specify the option interval = "confidence"
predict(car_model, interval="confidence")

# The prediction interval gives uncertainty 
# around a single value. In the same way, as 
# the confidence intervals, the prediction
# intervals can be computed as follow:
predict(car_model, interval="prediction")

## Prediction interval or confidence interval?
## A prediction interval reflects the uncertainty 
##  around a single value, while a confidence interval 
##   reflects the uncertainty around the mean prediction 
## values. Thus, a prediction interval will be generally 
##  much wider than a confidence interval for the same 
##  value.

## Which one should we use? 
##  The answer to this question depends on the context 
##  and the purpose of the analysis. Generally, we are 
##  interested in specific individual predictions, so a 
## prediction interval would be more appropriate. 
## Using a confidence interval when you should be using 
## a prediction interval will greatly underestimate 
## the uncertainty in a given predicted value 
##   (P. Bruce and Bruce 2017).


### PART II: Multivariate Linear Regression
require("datasets")
data("airquality")
str(airquality)

# Clean Dataframe
# Check for presence of NaN values
complete.cases(airquality)

# Find NaN Values, clean it up
airQ <- airquality[complete.cases(airquality), ]
str(airQ)
complete.cases(airQ)

plot(airQ)

# Step-wise deletion of variables
library(MASS)
air_model1 <- lm(airQ$Temp ~ airQ$Ozone + airQ$Solar.R + airQ$Wind,data=airQ)
par(mfrow=c(2,2))
plot(air_model1)
summary(air_model1)

step <- stepAIC(air_mode1l, direction="both")
step 

# New model
air_model2 <- lm(formula = airQ$Temp ~ airQ$Ozone,data=airQ)

# Evaluate model
par(mfrow=c(2,2))
plot(air_model2)
summary(air_model2)

# Plot model
par(mfrow=c(1,1))
plot(airQ$Temp ~ airQ$Ozone)
abline(air_model2, col="blue", lwd=3)



#### ANOVA

#  The one-way analysis of variance (ANOVA), 
## also known as one-factor ANOVA, is an extension 
## of independent two-samples t-test for comparing 
## means in a situation where there are more than 
## two groups. In one-way ANOVA, the data is organized 
## into several groups base on one single grouping 
## variable (also called factor variable).

## This tutorial describes the basic principle of the 
## one-way ANOVA test and provides practical anova test 
## examples in R software.

## ANOVA test hypotheses:
  
## Null hypothesis: the means of the different 
## groups are the same

## Alternative hypothesis: At least one sample 
## mean is not equal to the others.

## Assumptions of ANOVA test:

## The observations are obtained independently and 
##  randomly from the population defined by the 
##  factor levels

## The data of each factor level are normally distributed.

## These normal populations have a common variance. 
## (Levene’s test can be used to check this.)

# Set seed
set.seed(1234)
# Load data
data("PlantGrowth")
str(PlantGrowth)
my_data <- PlantGrowth

# Show the levels
levels(my_data$group)

plot(PlantGrowth$weight~PlantGrowth$group)

# order data
my_data$group <- ordered(my_data$group,
                         levels = c("ctrl", "trt1", "trt2"))
# Summarize data
library(dplyr)
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )
# Visualize data
library("ggpubr")
ggboxplot(my_data, x = "group", y = "weight", 
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("ctrl", "trt1", "trt2"),
          ylab = "Weight", xlab = "Treatment")

# Mean plots
# ++++++++++++++++++++
# Plot weight by group
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)
ggline(my_data, x = "group", y = "weight", 
       add = c("mean_se", "jitter"), 
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weight", xlab = "Treatment")

# Compute the analysis of variance
res.aov <- aov(weight ~ group, data = my_data)
# Summary of the analysis
summary(res.aov)

## As the p-value is less than the significance 
## level 0.05, we can conclude that there are 
## significant differences between the groups 
## highlighted with “*" in the model summary.

## Further learning and references
## ANOVA
# http://www.sthda.com/english/wiki/one-way-anova-test-in-r
## Non-linear regression
# http://www.sthda.com/english/articles/40-regression-analysis/162-nonlinear-regression-essentials-in-r-polynomial-and-spline-regression-models/
## Akaike's An Information Criterion
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/AIC.html