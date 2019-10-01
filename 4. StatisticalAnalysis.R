
#### This script introduces some basic statistical analysis tools in R ####

# There are several built-in statistical modeling functions in R that allow us to carry out 
# statistical analysis on datasets

iris_data <- iris
is.data.frame(iris_data)

## Linear Regression

# One of the most basic types of statistical modeling is called linear regression
# Linear regression analyzes the relationship between a response variable and one or more explanatory variables

# We want to find a best fit line for the relationship between Sepal Width and Petal Width
plot(iris_data$Petal.Width, iris_data$Sepal.Width)

# We can do this using a linear regression
lm(iris_data$Sepal.Width ~ iris_data$Petal.Width)
lm(Sepal.Width ~ Petal.Width + Petal.Length, data = iris_data)


abline(lm(iris_data$Sepal.Width~iris_data$Petal.Width))

# This is the "best" we can do to predict Sepal Width using the flower's Petal Width


# This statistical model makes several assumptions about our data, including that there is a
# linear relationship between our explanatory variable and our response variable

# y = b_0 + b_1*x
# y = b_0 + b_1*x_1 + b_2*x_2

# The lm() function in R produces a linear regression model based on the response variable and explanatory variables
# we provide as parameters

# lm( response ~ explanatory, data = our dataset)

# We can perform a linear regression on our iris_data dataset to try and analyze the relationship between petal width 
# a sepal width


iris_lm <- lm(Sepal.Width ~ Petal.Width, data=iris_data)

#the lm function returns with a special class, lm
class(iris_lm)

#We can printout the result of an lm object
iris_lm

#We can also take the summary of an lm object, this provides very useful results
iris_sum <- summary(iris_lm)
iris_sum

# From this summary we can see the estimated coefficients of our linear regression under the estimate column
# We can also se the standard error of the coefficients, and the associated p-value of these coefficients

# We can extract just the coefficients of our linear regression
iris_lm_coefficients <- coef(iris_lm) 
iris_lm_coefficients

# We can also extract the p-values of our coefficients and the r-squared of our model
iris_lm_p_values <- iris_sum$coefficients[,4]
iris_lm_r_squared <- iris_sum$r.squared

iris_lm_p_values
iris_lm_r_squared


# Here we can plot the relationship between Petal Width and Sepal Width
# We can use the abline function to add in our predicted regression line calculated
# from our linear regression model
plot(iris_data$Petal.Width, iris_data$Sepal.Width, xlab = "Petal Width", ylab = "Sepal Width",
     col = "darkgreen", pch=16)
abline(iris_lm, col="blue", lty=2)



# We can also look at the residuals of our linear regression model
# The residuals are the difference between the response variable values in our data and the predicted values from 
# our linear regression line

iris_lm$residuals

plot(iris_lm$residuals, pch=16, col="red")
abline(h=0, lty=2)


# R gives us some diagnostic plots about our linear regression automatically using the plot function
# and an lm object

#We can use the par(mfrow=c(2,2)) command to see multiple plots in the same window

# These are all diagnostic plots allowing us to visualize the behaviour of our residuals
# These can be used to test some of the assumptions of linear regression models
par(mfrow=c(2,2))
plot(iris_lm)



plot(iris_lm$residuals, pch=16, col="red")

# Plotting window still set to have 4 plots total in a 2x2 matrix, to change back we can use par(mfrow=c(1,1))
par(mfrow=c(1,1))
plot(iris_lm$residuals, pch=16, col="red")



# We can create a new linear regression model with more than one explanatory variable
# Use the formula in the lm function of the form: lm(response ~ var1 + var2 + var3..., data=dataset)
# Note we can also include categorical variables in our linear regression model

iris_lm_2 <- lm(Sepal.Width ~ Petal.Width + Sepal.Length + Petal.Length + Species, data=iris_data)

iris_sum_2 <-  summary(iris_lm_2)
iris_sum_2

# Can't really see a prediction line on a scatterplot because we have more than one dimension of predictors
# We can still plot the residuals 
par(mfrow=c(1,1))
plot(iris_lm_2$residuals, pch=16, col="blue", ylab = "Residuals")
abline(h=0, lty=2)

#Can still retrieve the p-values of our coefficients and the r-squared of our model
iris_sum_2$coefficients[,4]
iris_sum_2$r.squared


# We can also predict new values of data using our linear regression model
# To do this we give the predict command our lm object and new data

predict(iris_lm_2, newdata = iris_data[1,]) #the predicted Sepal Width of the first datapoint in our dataset

# To get all the fitted values we can use the $ sign notation for lists

iris_lm_2_predict <- iris_lm_2$fitted.values
head(iris_lm_2_predict)

# We can also add quadratic terms and interactions between explanatory variables to our model

iris_lm_interact <- lm(Sepal.Width ~ Petal.Width + I(Petal.Width^2) + 
                         Sepal.Length*Petal.Length + Species, data = iris_data)

summary(iris_lm_interact)



## Practice with Linear Models

# Create a new linear regression model iris_lm_practice with a response variable Sepal.Width
# Use the explanatory variables Sepal.Length, Petal.Length, the square of Sepal.Length, and 
# The interaction between Species and Sepal.Length
iris_lm_practice <- lm(Sepal.Width ~ Sepal.Length + Petal.Length +
                         I(Sepal.Length^2) + Species*Sepal.Length, data=iris_data )
# print out the summary
summary(iris_lm_practice)


# Save the coefficients of the linear regression to a new object lm_coef_practice
lm_coef_practice <- coef(iris_lm_practice)

# Which explanatory variable (including interactions) has the largest coefficient value?
# Which of the coefficients are significant (meaning they have p-values less than 0.05)?
lm_coef_practice

summary(iris_lm_practice)$coefficients[,4]

# plot the residuals of the linear regression model
plot(iris_lm_practice$residuals)

par(mfrow=c(2,2))
plot(iris_lm_practice)
# Calculate the predicted value of the 7th observation from the iris_data dataset, use this
# predicted value to manually calculate the residual of the 7th observation (hint residual = response variable in the data - the   predicted value)
iris_data$Sepal.Width[7] - predict(iris_lm_practice, newdata=iris_data[7,])
# compare this to the 7th element of the residual vector given by the lm object output. Are they equal?
iris_lm_practice$residuals[7]










####################


## Logistic regression


# We are going to be working with the rest data csv for this section

# We can read in the restdata.csv into R

restdata <- read.csv("restdata.csv")
View(restdata)
str(restdata)

# Logistic regression is another regression technique
# Just like linear regression, we are trying to analyze the relationship between a response variable of interest
# and some explanatory variables
# However, in the logistic regression case, we are now interested in a qualitative or categorical response
# We want to be able to classify this response accurately based solely on the explanatory variablse
# We want to understand which explanatory variables are related to the response
# We also want to be able to predict the categorical response, or assign a probability to it, based
# on the explanatory variables
# Instead of giving us a numerical prediction, logistic regression will give us the probability a certain
# observation falls into a certain category

# To run a logistic regression model in R, we use the glm() function
# This function is very similar to the lm function we saw previously

rest_glm <- glm(eat_out ~ weight, data=restdata, family="binomial")
summary(rest_glm)

# This output looks very similar to the lm function
# However, in this case these coefficients are related to the probability of eating out given a person's weight
# Not related to a numerical response
# The Null deviance, deviance, and AIC are related to how well our logistic regression model is fitting our data
# The smaller the AIC value the better the model is

#Extract the AIC of the model
AIC(rest_glm)

# residuals do not have a simple interpretation like in the linear regression case

# we can see the fitted/predicted values of our logistic regression model

rest_glm$fitted.values

# Here these fitted values are the probability of eating out.
# We can use the predict function to also get the fitted values

predict(rest_glm, newdata = restdata[1,], type="response")

# So our model says that given the weight of the first person in our dataset, we predict there is a 21.4% chance that
# they will go out to eat

rest_glm$coefficients

# The coefficient on weight is positive, thus we predict that the probability that someone will go out to eat increases
# with that persons weight

# We can use these fitted probabilities to categorize whether we think someone will go out to eat or not
# If the fitted probability is greater than 0.5, we can predict that the person will go out

rest_glm_fitted <- rest_glm$fitted.values
rest_glm_fitted

# We can create a vector of 1's and 0's that tells us which observations we predict will go out and eat
rest_glm_fitted_category <- as.numeric(rest_glm_fitted>0.5)

# We can create a 2x2 confusion matrix of our predicted categories and the real categories based on the data
Eat_Out <- restdata$eat_out
table(rest_glm_fitted_category, Eat_Out)


# The data points where our predicted category is the same as the true category
mean(rest_glm_fitted_category==Eat_Out)

# So we are able to categorize whether someone eats out correctly 60.4% of the time based on our logistic regression model

# Note just like in lm, we can add more variables, quadratic terms, and interactions to the glm formula
# To create more complex logistic regression models



## Practice with Logistic Regression

# Create a new logistic regression model using the restdata and the glm() function
# Use weight, weight^2, and gender as explanatory variables in the model, save this model as rest_glm_2
# print out a summary of the model, which explanatory variables have coefficients that are not significant?



# Create another logistic regression model, repeating what you did above but excluding the weight^2 variable 
# Save this model as rest_glm_3


# Compare the AIC values of the rest_glm, rest_glm_2, and rest_glm_3 models. Which model has the lowest AIC?
# Hint use the AIC() function. AIC(model_1,model_2,model_3) will give the AICs of all three models


# Use the model with the lowest AIC to create a 2x2 confusion matrix using the true eat_out values and the
# fitted ones using the probabilities from your selected logistic regression model
# How often does this model correctly classify whether a person ate out?




####################################################


## Anovas

# One-way Anovas are statistical tests used to compare whether the means between different groups are equivalent

# Recall our iris data and the side-by-side boxplot
par(mfrow=c(1,1))
boxplot(Sepal.Width ~ Species, data=iris_data, xlab="Species", ylab="Sepal Width")

# We see that the medians between these groups are different, but is their difference statistically significant
# Anovas are very similar to linear regression models in many ways, and have similar assumptions about the data
# Basically, a one-way Anova in this case will compare the variance of sepal width values within each group to
# the variance of the sepal width value between groups. If the variance between groups is a lot larger than 
# the variance within groups, than we can confidently say that the groups have different sepal width values. 

# We can compute a one-way Anova in R using the aov function
iris_aov <- aov(Sepal.Width ~ Species, data=iris_data)
summary(iris_aov)

# the aov and lm functions perform similar calculations, the aov function just displays a different output
# Here we see an output showing the variance between the means of the different groups is a lot bigger than
# the variance within each group around its mean, thus we conclude based on the p-value being < 0.05 that
# there is a significant difference in Sepal Width values between Species.

# This only tells us that there is an overall difference between the means of the groups, it doesn't tell
# which group means are significantly different

# We can perform pairwise comparisons between the different groups to see which pairs of means are different
# from each other
# We do this by using the TukeyHSD() function

TukeyHSD(iris_aov)

# This gives us the difference between the means, confidence intervals for those differences and p-values
# Based on the p-values in the 4th column, since all are less than 0.05 we can say that the means sepal width
# of each species are different from each other. 


# Finally, just like in linear regression, we can plot the residuals to see if our assumptions of the Anova
# test are violated

par(mfrow=c(2,2))
plot(iris_aov)





