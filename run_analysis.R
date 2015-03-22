# Clean up workspace
rm(list=ls())

library(plyr)

##1. Merges the training and the test sets to create one data set.

##reading data from files
dataTrain_X<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
dataTest_X<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
dataX <- rbind(dataTrain_X, dataTest_X)

dataTrain_Y<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
dataTest_Y<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
dataY <- rbind(dataTrain_Y, dataTest_Y)

subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
SubjectData <- rbind(subjectTrain, subjectTest)

features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
activityType<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table(getFilePath("features.txt"))
keptMesurePositions <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
dataX <- dataX[, keptMesurePositions]

# Setting and cleanning column names
names(dataX) <- features[keptMesurePositions, 2]

# removing unwanted characters from column names
names(dataX) <- gsub("\\(|\\)", "", names(dataX))

names(dataX) <- tolower(names(dataX))


## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive activity names. 

# clean activity names (one line this time!)
activityType[, 2] = gsub("_", "", tolower(as.character(activityType[, 2])))
dataY[,1] = activityType[dataY[,1], 2]

# name that new column
names(dataY) <- "activity"

# label SubjectData
names(SubjectData) <- "subjectnumber"

# Then: Time to merge everthing together and save into a file: dataX, dataY, SubjectData

merged <- cbind(SubjectData, dataY, dataX)
write.table(merged, "tidy_data.txt")


## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
excludedColumns = which(names(merged) %in% c("subjectnumber", "activity"))
result <- ddply(merged, .(subjectnumber, activity), .fun=function(x){ colMeans(x[,-excludedColumns]) })

write.table(result, "average_data.txt")

