## load R-packages
library(dplyr)
library(data.table)
library(reshape2)
library(tidyr)

## read general labels
activities <- read.table("./data/activity_labels.txt", header = FALSE, quote = "")
names(activities) <- c("activity", "activityName")
# only read features
features <- read.table("./data/features.txt", header = FALSE, quote = "")
names(features) <- c("indicator", "feature")



##################################################################################
## 1.) Merges the training and the test sets to create one data set
## TRAINING SET ##################################################################
## read local files of training set and set column names
trainingSubject <- read.table("./data/train/subject_train.txt")
names(trainingSubject) <- c("subject")
trainingActivity <- read.table("./data/train/y_train.txt")
names(trainingActivity) <- c("activity")
trainingData <- read.table("./data/train/X_train.txt", header = FALSE, quote = "")
names(trainingData) <- features$feature

## combine training set data
trainingData <- cbind(trainingSubject, trainingActivity, trainingData)

## TEST SET #######################
## read local files of training set and set column names
testSubject <- read.table("./data/test/subject_test.txt")
names(testSubject) <- c("subject")
testActivity <- read.table("./data/test/y_test.txt")
names(testActivity) <- c("activity")
testData <- read.table("./data/test/X_test.txt", header = FALSE, quote = "")
names(testData) <- features$feature

## combine training set data
testData <- cbind(testSubject, testActivity, testData)

## merge training data set and test data set ####################################
experimentData <- rbind(trainingData, testData)
#################################################################################


#################################################################################
## 2.) Extracts only the measurements on the mean and standard deviation for each measurement
## Find 'mean' and 'std' within the features ##############################################
featuresExtract <- filter(features, grepl("mean", feature, ignore.case = TRUE))
featuresExtract <- rbind(featuresExtract, filter(features, grepl("std", feature, ignore.case = TRUE)))
dataNames <- as.character(featuresExtract[, "feature"])
dataNames <- c("subject", "activity", dataNames)
experimentData2 <- experimentData[, colnames(experimentData) %in% dataNames]


################################################################################
## 3.) Uses descriptive activity names to name the activities in the data set
## add column with 'activityName' ##############################################
experimentData3 <- merge(activities, experimentData2, by.x = "activity", by.y = "activity")


################################################################################
## 4.) From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject
## melt + cast the data frame ##################################################
dataMelt <- melt(experimentData3, id = c("subject", "activityName"), measure.vars = featuresExtract$feature)
avgData <- as.table(acast(dataMelt, activityName ~ subject ~ variable, mean))

## write the table
write.table(avgData, file = "./result/averages.txt", row.names = FALSE, col.names = c("activity", "subject", "feature", "average"))
