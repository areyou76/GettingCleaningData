# GettingCleaningData-Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  


SOLUTIONS
=========

 CREATE run_analysis.R 
 
1. Set working directory
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set.
5. Labels the data set with descriptive variable names. y_names, y_test, x_names, x_test, subject, train, train1 and etc. Refer codebook.html/.rmd
6. Create independent tidy data set with the average of each variable for each activity and each subject. created TIDYDATA.txt

In this process, i have did the following:

Setting working directory
The script created to read data table y_train and x_train, features and activity_labels
Merge the y_train with the activity label
Eliminate the train2 1st column in order to avoid error "duplicate column name"
Select only the columns that contains means and standard deviation - using variable "train4"
Analysis of the Volunteer select for generating the test data - using variable "colnames"
Merge the y_test with the activity label - using variable "subjecta", test, test1
Combining y_test, activity labels, X_test
Eliminate the train2 1st column in order to avoid error "duplicate column name" - variable "test3"
Select only the columns that contains means and standard deviation - variable "test4"
Combining Train data with Test data - variable "run_analysis1" using rbind
Summary data and produce TIDYDATA.txt - using "run_analysis" variable
Display summary data
Write to TIDYDATA.txt


