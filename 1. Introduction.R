
###### Welcome to the Intro to R Workshop ######

## Rough Schedule for today:

# Introductions, intro to the R/R Studio environment

# Module 1 - Intro to Programming in R, objects, operators, variables

# Morning break

# Module 1 (cont.) - Data types, basic built-in functions in R

# Lunch

# Module 2 - Data Structures and Organization

# Afternoon Break

# Module 2 (cont.) - Data Structures and Organization


#######


# Before we begin, quick introductions:

# Name

# Background, experience coding or using statistical software (Excel, SAS, SPSS, Matlab, other coding languages)?

# Experience with R/R Studio?

# Why you decided to take this workshop?

# What are your expectations for this workshop? Anything specific you want to get out of it?


#######

# Why use R for Data Science/Statistics?

# - It's free, open source

# - Performs a wide variety of functions: data filtering, statistical analysis, plotting data, etc.

# - Scalable, can easily handle small or large datasets

# - It's flexible

# - Relatively low barrier of entry

# - Everything done in R is transparent, reproducible 

# - It's very popular


#######

# The R Studio Environment:

# R Studio is an interactive development environment that allows you to more easily interact with R

# The first time you open R Studio you will see three windows, 
# the fourth is hidden by default but can be opened by opening a new R script


# The lower left window is the Console Window
# This is the command line, you can enter commands (code) into the console window and R will evaluate these commands and produce output
# This is where the R software is operating
# If the R console is ready to accept commands it will show a > prompt
# Once given a command, it will try and execute the command
# If R is waiting for more data it will display a +, seeing this means you haven't entered a complete command
# You can press Esc to cancel the current command if you see this +


# The upper left window is the text editor
# This area allows to write script files - plain text files that contain your code.
# This is an R script
# scripts are a series of commands written in the text file that can be run by the Console
# script files are saved with a .R extension

2+2
print("Hello")

# We can run these commands by putting our cursor on the line of interest and clicking run, or by clicking ctrl/cmd+enter
# We can run multiple lines at once by highlighting the lines of interest and clicking run or ctrl/cmd+enter


## Benefits of first writing code in scripts and then sending them to the R console:
# - Allows you to edit code, rerun the code 
# - Can save code and rerun later, share your code with others
# - Record of what you've done - reproducible
# - Can add notes to your script explaining your code

# Adding a # sign allows you to make comments. Anything to the right of a # is ignored by R for a given line of code

# This codes multiplies 3 and 4 together
3*4 # here is the multiplication

# While this example is trivial, adding notes to your code is very important
# It allows others, and more importantly you, to understand what your code is doing
# Writing code and then coming back to it after a long break, it is often hard to remember/understand what your
# code is doing without having comments. 


# To Create a new R script go to File -> New File -> R script
# To save an R script go to File -> Save As...

# The upper right window gives a list of loaded R objects, 
# we will look at this window more when we introduce R objects
# This window also provides list of past commands given to the R Console


# The lower right window has a Files tab that allows you to explore files in the C Drive
# - load R scripts from here if you wish
# - can also load R scripts using File > Open File... and navigating to script of interest
# - can also load datasets into R using this Tab - we will see this in the Module on data importing

# Also provides a plots tab that provides a view of created plots in R

plot(cars$speed)

# We come back to plotting in module 4

# Also provides a help tab that is the output of help commands
# Can use the help command to get more information on a function in R

help(plot)

# Again, we will use this tab in later modules


## Working Directory

# The working directory is the pathway to the folder that R is currently connected to
# It's the folder where R will by default read and save files and plots
# This will become important when we are importing data into R and saving plots created in R
# To see your current directory, look at the path above the console, or use getwd() command

getwd()

# To change your working directory, go to Session > Set Working Directory
# There are 3 options, the first, "To Source File Location" sets your working directory to wherever your script is saved
# The second, "To Files Pane Location" sets it to the folder currently open in the Files tab in the lower right window
# The third, "Choose Directory..." allows you to choose any directory folder on your computer
# These menu options utilize the setwd() function, which takes a folder pathway and sets that as the working directory
# To make sure your script always uses the same directory, we can copy and paste the generated setwd() function into our script

setwd("C:/Users/Daniel/Dropbox/SFU/R Peer/IntroRWorkshop")

getwd()

# Note the working directory is just specifies a folder path so you don't have to when saving or importing files
# We can save or load any file outside the working directory just by specifying the full folder path it is contained in
# We will see this in later modules



















