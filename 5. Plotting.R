
#### This script introduces how to create and customize plots in R ####

# To create a scatterplot in R, use the function plot()
x <- 1:6
y <- c(2,5,-3,10,11,8)

#This creates a scatterplot
plot(x,y)

# The plot() function's two required arguments are the x axis coordinates, followed by the y axis coordinates

x <- seq(-pi, 2*pi, by=0.1)
y <- sin(x)

plot(x, y)

# We'll use the iris dataset for more interesting plots
# The iris dataset is data that comes pre-loaded into R, see data() for a full list of pre-loaded datasets

iris_data <- iris
help(iris)
head(iris_data)  # use the head() function to see the first 6 observations of the dataset
str(iris_data)   # the str() function tells us the structure of each of the variables
summary(iris_data)

# We see that each observation consists of 5 variables
# Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width are all numeric variables describing each flower
# The Species variable is a factor describing the species of each flower

# Again we can plot two variables in the iris dataset using the plot() function
plot(iris_data$Sepal.Length, iris_data$Petal.Length)

# There are numerous arguments that can be customized in the plot function, many of which have default values
# See help(plot), directed to the par help page for a full list of these arguments and their default settings

# As you can see, there are nearly endless possible arguments that you can specify to customize your graph
# These include the background, colours, fonts, margin sizes, point shapes, axis colours, axis labels
# tick marks of your graph, the range of your axes, just to name a few

# plot(x, y, type = 'p', main = "Title of Graph", xlab = "x axis label", ylab = "y axis label",
#      cex = int specifying point size, pch = number specifying point shape, col = "colour of your points")

plot(iris_data$Sepal.Length, iris_data$Petal.Length,type='p',
     main="Sepal Length Against\n Sepal Width",xlab="Sepal Length",
     ylab="Sepal Width",pch=1,col=c("turquoise2","blue","coral2"))
legend(x=4,y=7,legend=unique(iris_data$Species),col=unique(iris_data$Species),
       bty="n")

# pch can be selected from 0 to 25 (default being 1), can test some out on your own or look online to view all the different possible   point shapes
# note pch = 16 is a common one to use for filled circular dots

# there are a huge variety of colours to choose from
colours() #This prints out all 657 colours you can choose from
#http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# Lets start by customizing our axis labels

plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. \nIris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length")

# Now we can add a little more customization, specifying parameters for the point size, shape, and colours

plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. \nIris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = 16, col = "red")

# This red colour is OK, but these flowers are categorized by species, what if we want to colour each datapoint
# A different colour depending on its species?

plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = 16, col = iris_data$Species)


# If we want to change the colours R chooses for each species, we can use the palette command
palette(c("blue", "orange", "purple"))
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. \nIris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = 16, col = iris_data$Species)

# Fator values in R are stored as a vector of integers, with each integer corresponding to a level of the factor
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. \nIris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = 16, col = as.numeric(iris_data$Species))


# You'll notice that R colours the species based on the order of levels in the factor
# Going alphabetically, setosa flowers are first, thus they get coloured blue
head(iris_data$Species)

# We can also specify point shapes based on a factor
# Since the pch only accepts numbers as arguments, we need to turn the factor vector iris_data$Species into
# a vector of numbers with the as.numeric function
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs.\n Iris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = as.numeric(iris_data$Species), col = iris_data$Species)

# Again, we can change these point shapes by modifying the vector of numbers we give to the pch argument
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = as.numeric(iris_data$Species)+5, col = iris_data$Species)

# Now that we have different colours and point shapes depending on the species of flower, it would be nice to have 
# a legend showing us what each of these colours and point shapes are referring to

# use the legend() function after creating a plot with the R command

# legend(x = numeric x coordinate of legend, y = numeric y coordinate, legend = character vector with length equal to the number of elements specified in your legend, col = the colours of points appearing in your legend, bty = type of box around your legend)
# colours of legend and point shapes of legend should match the graph

plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. \nIris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = as.numeric(iris_data$Species), col = iris_data$Species)
legend(x = 4.5, y = 7, legend=unique(iris_data$Species),
       col=c("blue", "orange", "purple"), pch = c(1,2,3), bty = "n")

boxplot(iris_data$Sepal.Length~iris_data$Species,main="Boxplot Sepal Length Species",
        xlab="Species",ylab="Sepal Length")

# Typing out each argument becomes tedious and leaves us prone to bugs if the dataset changes or if we want to change cols or shapes
# We can use the same arguments as the plot function to automate the legend values

plot(
    iris_data$Sepal.Length,
     iris_data$Petal.Length, 
     main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", 
     ylab = "Petal Length", 
     cex = 1.25, 
     pch = as.numeric(iris_data$Species), 
     col = iris_data$Species
     )
legend(
        x = 4.5, 
        y = 7, 
        legend=unique(iris_data$Species),
       col=unique(iris_data$Species), 
       pch = unique(as.numeric(iris_data$Species)), 
       bty = "o"
       )

# We are also able to add extra lines and points to scatterplots in R
# The abline function allows us to add a line with a specific slope and intercept
plot(
        iris_data$Sepal.Length, 
        iris_data$Petal.Length,
        main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", 
     ylab = "Petal Length", 
     cex = 1.25, 
     pch = as.numeric(iris_data$Species), 
     col = iris_data$Species
     )
legend(x = 4.5, y = 7, legend=unique(iris_data$Species),
       col=unique(iris_data$Species), pch = unique(as.numeric(iris_data$Species)), bty = "o")
abline(4, 0)


# We can also customize the abline line and add multiple lines
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = as.numeric(iris_data$Species), col = iris_data$Species)
legend(x = 4.5, y = 7, legend=unique(iris_data$Species),
       col=unique(iris_data$Species), pch = unique(as.numeric(iris_data$Species)), bty = "o")
abline(
        mean(iris_data$Petal.Length), 
        0, 
        lty=2, 
        col = "red")
# More customization
plot(iris_data$Sepal.Length, iris_data$Petal.Length, main = "Plot of Iris Petal Length vs. Iris Sepal Length",
     xlab = "Sepal Length", ylab = "Petal Length", cex = 1.25, pch = as.numeric(iris_data$Species), col = iris_data$Species)
legend(x = 7, y = 3.75, legend=unique(iris_data$Species), title = "Species",
       col=unique(iris_data$Species), pch = unique(as.numeric(iris_data$Species)), bty = "o")
abline(
        mean(iris_data[iris_data$Species=="setosa",]$Petal.Length), 
        0, 
        lty=2, 
        col = unique(iris_data[iris_data$Species=="setosa",]$Species))
abline(mean(iris_data[iris_data$Species=="versicolor",]$Petal.Length),
       0, 
       lty=2, 
       col = unique(iris_data[iris_data$Species=="versicolor",]$Species))
abline(mean(iris_data[iris_data$Species=="virginica",]$Petal.Length),
       0, lty=2, col = unique(iris_data[iris_data$Species=="virginica",]$Species))

## Practice with plots ##

#creating a new column in iris_data dataframe called attractiveness
iris_data$Attractiveness <- factor(c(rep("Ugly", 35), 
                                     rep("OK", 35), 
                                     rep("Pretty", 40), 
                                     rep("Beautiful", 40)))

# Ugly - 
# Create a scatterplot using the plot function comparing the Petal 
# Width (y axis) to the Sepal Width (x axis)
plot(iris_data$Sepal.Width,iris_data$Petal.Width)


# Add custom x and y axis labels, a title
plot(
    iris_data$Sepal.Width,
     iris_data$Petal.Width,
    xlab="Sepal Width",
    ylab="Petal Width",
    main="Scatter plot Sepal Width against Sepal length")

# colourize and shape the points based on the new Attractiveness variable
# use colours red, blue, green, and purple for ugly, OK, pretty, and beautiful flowers, respectively
palette(c("red","blue","green","purple"))
plot(
    iris_data$Sepal.Width,
    iris_data$Petal.Width,
    xlab="Sepal Width",
    ylab="Petal Width",
    main="Scatter plot Sepal Width against Sepal length",
    pch=unique(as.numeric(iris_data$Attractiveness)),
    col=unique(iris_data$Attractiveness),cex=0.75)

# Create a legend with the correct colour and shape combinations used for the 4 levels of flower attractivenss
# Hint: in order to get the correct colours to the correct attractiveness level, need to order the
# colours the same way the factor levels are ordered, use levels(iris_data$Attractiveness) to check order of the levels

legend(
    "topright",
    legend=unique(iris_data$Attractiveness),
    pch=unique(as.numeric(iris_data$Attractiveness)),
    col=unique(iris_data$Attractiveness),
    horiz=FALSE, cex=0.75)

# BONUS: Add dashed lines at the median Petal width value of each flower attractiveness group
abline(
    median(iris_data[iris_data$Attractiveness=="Ugly",]$Petal.Width),
    0,
    lty=2,
    col=unique(iris_data[iris_data$Attractiveness=="Ugly",]$Attractiveness)
)
###############################################################

# Other plots: histograms, boxplots, barplots, pairs plots 

# There are many other types of common plots that are relatively simple to create in R

# The first we'll cover is the histogram
# A histogram is a visual representation of a single numeric variable
# The values of this numeric variable are split into bins, and the frequency of each bin value
# Is given on the y axis

hist(iris_data$Petal.Width)

# Again, we can customize this histogram to make it look better

hist(iris_data$Petal.Width,
     main="Histogram of Iris Petal Widths", 
     xlab="Petal Width", 
     border="red", 
     col="green",
     xlim=c(0,3),
     las=1, 
     breaks=5)

# note when you give the argument breaks a single number, R takes this as a suggestion
# returns what it calls "pretty" breaks
# to explicitly give the breaks you want, give R a vector of where you want the breaks to occur

hist(iris_data$Petal.Width,
     main="Histogram of Iris Petal Widths", 
     xlab="Petal Width", 
     border="red", 
     col="green",
     xlim=c(0,3),
     las=1, 
     breaks=c(0,0.4,0.8,1.2,1.6,2.0,2.4,2.8))


# Another common type of plot in R is the boxplot
# Boxplots can be created to show the distribution of an individual numeric variable,
# Or to compare the distribution of a numeric variable by group

# If we want to create a boxplot for a single variable we can use the boxplot() function

boxplot(iris_data$Sepal.Width)

# Again we can customize

boxplot(iris_data$Sepal.Width,
        main = "Boxplot of Iris Sepal Width",
        ylab = "Sepal Width",
        col = "orange",
        border = "brown",
        horizontal = FALSE
)


# More commonly, we can create side-by-side boxplots to compare the value of a variable between groups
# To do this we utilize the notation y~group where y is the variable of interest and group is the categorical
# variable (often a factor) that you want to separate y by

boxplot(iris_data$Sepal.Width ~ iris_data$Attractiveness,
        main = "Boxplot of Iris Sepal Width",
        xlab = "Attractiveness", ylab="Sepal Width"
        )

# We can also use colours to separate sepal width based on two categorical variables

iris_data$Smell <- factor(rep(c("Bad","Good"), times = 75))

boxplot(
        Sepal.Width ~ Species*Smell, 
        data=iris_data, 
        main = "Boxplot of Iris Sepal Width",
        xlab = "Species", 
        ylab="Sepal Width",
        names=(rep(unique(iris_data$Species), each=2)),
        col = iris_data$Smell)
legend("topright", 
       legend = unique(iris_data$Smell), 
       title = "Smell", fill=unique(iris_data$Smell), horiz = TRUE)


# Barplots

# Bar plots are useful for determining characteristics of a categorical variable (factor)
# bar plots are created in R using the command barplot(height), where height is either a vector or a matrix
# For standard one variable barplots with frequencies on the y axis, height is a vector of counts of the levels
# Of a categorical variable

# We can use the table function to get counts of the species variable in the iris_data
species_counts <- table(sample(iris_data$Species,50)) # taking a random sample of 50 flower species
barplot(species_counts,
        xlab="Species", main = "Distribution of Iris Species")

# We can create a stacked or grouped barplot using a matrix as our height argument
iris_data_sampled <- iris_data[sample(150,50),] # taking a random sample of 50 rows from the iris dataframe
species_smell_counts <- table(iris_data_sampled$Smell, iris_data_sampled$Species)


#R will take the categorical variable specified on the columns x variable, stack based on the row variable
barplot(
        species_smell_counts, 
        main = "Distribution of Iris Species",
        xlab="Species", col=unique(iris_data_sampled$Smell), ylim=c(0,22))
legend("topright", legend = rownames(species_smell_counts), fill = c(unique(iris_data_sampled$Smell)))

#If we specify beside=T we get a grouped barplot
barplot(
        species_smell_counts, 
        main = "Distribution of Iris Species",
        xlab="Species", 
        col=unique(iris_data_sampled$Smell), 
        beside = TRUE, ylim=c(0,15))
legend("topright", legend = rownames(species_smell_counts), fill = c(unique(iris_data_sampled$Smell)))

# Note bar plots do not strictly have to be counts/frequencies. Bar plots can be created where the bar values represent
# means, medians, standard decaitions, etc. using the aggregate function in R
# We are not going to cover this during this workshop



## Saving Plots from R onto your computer

# Quick and dirty way to get plots into other documents/reports you're working on: copy and paste from the zoom window


# Real way to save plots in R

# Set our working directory to where we want the file to be saved
setwd("C:/Users/Daniel/Dropbox/SFU/R Peer/IntroRWorkshop")

# Open a graphical device in R
png(filename="IrisGroupedBarChart.png")

# Run your plot
barplot(species_smell_counts, main = "Distribution of Iris Species",
        xlab="Species", col=unique(iris_data_sampled$Smell), beside = TRUE, ylim=c(0,15))
legend("topright", legend = rownames(species_smell_counts), fill = c(unique(iris_data_sampled$Smell)))

#This plot will be saved as a png in your work directory

#Finally, turn off the graphical device
dev.off()


## More Practice With Plots ##

# Create a side-by-side boxplot of Petal Length grouped by both Attractiveness and Smell
# Make Attractiveness the variable used on the x axis, and create colouring and a legend based on the smell variable
# Customize the x and y axes titles, as well as the title of the graph



# Create a histogram of Sepal Width
# Customize the colour of the histogram, the axis labels and title, and specify 10 breaks
# Add a vertical line denoting the mean value of Sepal Width (hint see help(abline))
# Customize the line colour, width (use lwd argument), make the line dashed (lty argument)
# Save this plot to your computer as a png


#########################################################################


## A Note on packages in R

# So far everything we've done in R has been done in whats called base R
# All built-in functions we've used have come pre-loaded in R, loaded every time we open R Studio

help(data.frame)


#Although this says graphics, the graphics package is a package that comes pre-loaded in base R
#i.e. you load the graphics package everytime you open R
help(plot)

# Also available in R are packages - collections of functions that help do some specific task 
# that isn't covered by the base R built-in functions

# For example, if you're interested in basketball like me, you can load in the ballr package
install.packages("ballr")

# To access the functions of the package, load it into the session using library(ballr)
library(ballr)

# NBAStandingsByDate is a function in the ballr package that prints the current NBA standings for all teams
# This function is not available in base R
# If you close R and reopen a new session, this function would not be available and you would have to reload
# The ballr package using library(ballr)
# However, once downloaded you don't have reinstall the package using install.packages
NBAStandingsByDate(date_string = "2019-02-26")


# There is a very popular R package for plotting called ggplot2
# This package uses different syntax than the plot function, is capable 
# of producing a wide variety of very nice plots, it is extremely flexible

# install ggplot2
install.packages("ggplot2")
library(ggplot2)


# We can use ggplot2 to create really nice plots of the iris data
ggplot(
    data=iris_data,
    aes(x=Sepal.Width, y=Sepal.Length,color=Species)) + geom_point() + theme_bw()



