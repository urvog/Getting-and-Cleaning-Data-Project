# Getting and Cleaning Data Project

#Data Source
Download all datasets from this URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#HOW TO
The script run_analysis.R performs the 5 steps described in the course project's definition.

- First, all data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
- Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
- Take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
- All columns with vague column names are corrected.
- Finally, generate a new dataset with all the average measures for each subject and activity type. The output file is called average_data.txt, and uploaded to this repository.

#Variables
dataTrain_X, dataTrain_Y, dataTest_X, dataTest_Y, subjectTrain and subjectTest contain the data from the downloaded files.
dataX, dataX and SubjectData merge the previous datasets to further analysis.
features contains the correct names for the dataX dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
merged merges dataX, dataY and SubjectData in a big dataset.
Finally, result contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
