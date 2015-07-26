# Filename:    run_analysis.R
# Version:     20150726
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
#
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#    
#    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
# Here are the data for the project: 
#     
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Libraries required
library(stringr)
library(dplyr)


# 1. Merges the training and the test sets to create one data set.
tmp1 <- read.table("./test/subject_test.txt")
tmp2 <- read.table("./train/subject_train.txt")
subjects <- rbind(tmp1, tmp2)
names(subjects) <- "Subject"

tmp1 <- read.table("./test/X_test.txt")
tmp2 <- read.table("./train/X_train.txt")
readings <- rbind(tmp1, tmp2)

tmp1 <- read.table("./test/y_test.txt")
tmp2 <- read.table("./train/y_train.txt")
activities <- rbind(tmp1, tmp2)
names(activities) <- "Activity"

rm(tmp1); rm(tmp2)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt", stringsAsFactors = FALSE)
indices_of_selected_columns <- grep("(mean\\()|(std\\()", features[, 2])
means_and_standard_deviation <- readings[ , indices_of_selected_columns]


# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
activity_labels[, 2] = gsub("_", " ", str_to_title(activity_labels[,2]))
activities[ , 1] = activity_labels[activities[ , 1], 2]


# 4. Appropriately labels the data set with descriptive variable names. 
column_names <- features[indices_of_selected_columns, 2]
column_names <- gsub("\\(|\\)", "", column_names)
column_names <- gsub("X", "X-Axis", column_names)
column_names <- gsub("Y", "Y-Axis", column_names)
column_names <- gsub("Z", "Z-Axis", column_names)
column_names <- gsub("Acc", "Accelerometer", column_names)
column_names <- gsub("Gyro", "Gyroscope", column_names)
column_names <- gsub("std", "StandardDeviation", column_names)
column_names <- gsub("tB", "TimeDomainB", column_names)
column_names <- gsub("tG", "TimeDomainG", column_names)
column_names <- gsub("fB", "FrequencyDomainB", column_names)
names(means_and_standard_deviation) <- column_names
dataset <- cbind(subjects, activities, means_and_standard_deviation)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average_by_subject_by_activity <- dataset %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(average_by_subject_by_activity, "average_by_subject_by_activity.txt", row.name=FALSE)
