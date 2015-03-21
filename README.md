# Getting-and-Cleaning-Data-Project

## Course Project

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How To on this course project.

1. On RStudio create a new project.
2. Download data source from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Unzip file, this will create a folder "UCI HAR Dataset/" which contain all datasets.
4. Download "run_analysis.R" on parent folder, structure root folder should be like this:

run_analysis.R
UCI HAR Dataset/
  

5. Run source("run_analysis.R"), it will generate a new file called "average_data.txt" in your working directory. This file
is the output of the 5th step.

## Dependencies
data.table, plyr
