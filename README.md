#Getting and Cleaning Data

##Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
You will be required to submit:
 1. a tidy data set as described below,
 2. a link to a Github repository with your script for performing the analysis, and 
 3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
 
## Step 1: 
- Clean up workspace
- Set working directory to the location where the dataset is going to be downloaded and unzipped
- Check if the package plyr is installed
- Check if the package data.table is installed
- Load plyr and data.table

## Step 2:
- Create data and folders and verify that the data.zip file has been downloaded
- Read files
- Assign column names to the data

## Step 3:
- Create the test data set by merging the x_test, y_test and subject_test data
- Create training data by merging y_training, subject_training, and x_training
- Merge training and test sets
- Update values with correct activity names

## Step 4:
- Create a dataset that extract only the measurements on the mean and standard deviation for each measurement 
- Create a second, independent tidy dataset with the average of each variable for each activity and each subject

