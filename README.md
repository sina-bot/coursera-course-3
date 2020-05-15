# coursera-course-3
## Getting and Cleaning Data Course Project

The data analysis that has been performed originate in the coursera course project:
> https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The raw data were obtained from:

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information about the experiment that has been performed in order to gain the data can be found here:

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

***

Following files are available:  

1. __run_analysis.R__  
This is an executable R script to perform the asked operations on the dataset from:  
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

Following operations are performed:
* Merges the training and the test sets to create one data set.  
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

***

2. __averages.txt__  
Data set containing the average of each variable for each activity and each subject.

The data set is _tidy_, because
* each variable is captured in one column
* each different observation is captured in a different row
* there is only one table for each kind of observation
* since there are no multiple tables, no link is needed

The data set contains the following variables:
_acitivity_ | name of the measured activity
_subject_   | number of the subject that performed the activity
_feature_   | name of the measure 
-average_   | average of the variable measured for the activity and subject

***

3. __code_book.md__
describes each variable and its values in the tidy data set `averages.txt`
