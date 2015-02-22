# Clean up workspace
rm(list=ls())

#set working directory to the location where the dataset is going to be downloaded and unzipped
setwd('C:/Users/Susie/Documents/GitHub/GettingandCleaningDataCourseProject/');

file <- "data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI HAR Dataset"
dataset_folder <- "Dataset"

#Check if the package plyr is installed

if(!is.element("plyr", installed.packages()[,1])){
        install.packages("plyr")
}

#Check if the package data.table is installed
if(!is.element("data.table", installed.packages()[,1])){
        install.packages("data.table")
}

#load dplyr and data.table
library(dplyr)
library(data.table)

## Create data and folders and verify that the data.zip file has been downloaded
if(!file.exists(file)){
        
        ##Download the data file
        download.file(url,file, mode = "wb")
        
}
if(!file.exists(dataset_folder)){
        dir.create(dataset_folder)
} 

# Unzip dataset
unzip(file, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)

# Read files
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
subject_training = read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
x_training <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
y_training <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)

# Assign column names to the data imported above
colnames(activity_labels)  = c('activityId','activityLabel');
colnames(subject_training)  = "subjectId";
colnames(x_training)        = features[,2]; 
colnames(y_training)        = "activityId";
colnames(subject_test) = "subjectId";
colnames(x_test)       = features[,2]; 
colnames(y_test)       = "activityId";


# Create the test data set by merging the x_test, y_test and subject_test data
test_data = cbind(y_test,subject_test,x_test);


# Create training data by merging y_training, subject_training, and x_training
training_data = cbind(y_training, subject_training, x_training);

#Merge training and test sets
data = rbind(training_data, test_data)

# Update values with correct activity names
data[, 1] <- activity_labels[data[, 1], 2]

#Extract only the measurements on the mean and standard deviation for each measurement. 
dataset <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]

write.table(dataset, file = "./Dataset/data.txt")

#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
limited_colMeans <- function(data) { colMeans(data[, -c(1,2)])}
dataset2 <- ddply(dataset, .(activityId, subjectId), limited_colMeans)


write.table(dataset2, file = "./Dataset/tidy_data.txt", row.name=FALSE)



