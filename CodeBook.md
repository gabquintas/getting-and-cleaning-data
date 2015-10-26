#Course Project --> Getting and Cleaning Coursera Course

##Description

This is the descriptive information of data, variables and formulas used to handle the project held by the Johns Hopkins Getting and Cleaning Data course. The goal here is to describe the task of the project, the information source and the logical behind each step taken.

##Source

To access the data used in this project, go to this page <a href= "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#">

##Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

##Section 1

After downloading the data into your directory, use the read.table functions to access the data provided in the following files:

*features.txt
*activity_labels.txt
*subject_train.txt
*x_train.txt
*y_train.txt
*subject_test.txt
*x_test.txt
*y_test.txt

Concatenate the data tables by row, set names to variables and merge to create one data set.

Section 2

Subset the data frame by selected names of the features.txt file 

Section 3

Merge data subset with the activityType table  of the "activity_labels.txt" file to include the descriptive activity names

Section 4

Use gsub function for pattern replacement to clean up the data labels.

Section 5

Use the plyr package to use the aggregate function