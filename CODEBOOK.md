# Code Book
## Description
This document provides information about the generated sets by the script run_analysis.R, provided in this repository.

## Data Source
- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dataset information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Variables for file manipulation

file = "data.zip"
url == "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path == "UCI HAR Dataset"
dataset_folder == "Dataset"


## Variables for reading data files
activity_labels = activity_labels.txt
features = features.txt
subject_test = subject_test.txt
subject_training = subject_train.txt
x_test = X_test.txt
x_training = X_train.txt
y_test = y_test.txt
y_training =y_train.txt

## Variables for merged data sets
test_data = merging x_test, y_test and subject_test data
training_data = merging y_training, subject_training, and x_training
data = Merge training and test sets

 
dataset = Extract only the measurements on the mean and standard deviation for each measurement
dataset2 = Create a second, independent tidy data set with the average of each variable for each activity and each subject. 






