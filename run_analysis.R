## Below is the code used to download the files
## Commented below statements; as this is not required to be mentioned in run_analysis.R

#install.packages("dplyr")
#library(dplyr)
#library(data.table)

#filename <- "UCI HAR Dataset.zip"

# Check if zip file already exist
#if (!file.exists(filename)){
#  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#  download.file(fileURL, filename, method="curl")
#}  

## Check if folder exists and unzip the file
#if (!file.exists("UCI HAR Dataset")) { 
#  unzip(filename) 
#}


#features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
#activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("num", "activity"))
#subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
#x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
#y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "num")
#subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
#x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
#y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "num")

#head(features)
#head(activity_labels)
#head(subject_test)
#head(x_test)
#head(y_test)
#head(subject_train)
#head(x_train)
#head(y_train)



######################################################################
############# Code functionality 1 ###################################
######################################################################

## Below code - Merges the training and the test sets to create one data set.
## Please check above for file download and reading the files
data_set1 <- rbind(x_train, x_test)
data_set2 <- rbind(y_train, y_test)
data_set3 <- rbind(subject_train, subject_test)
merge_all <- cbind(data_set3, data_set2, data_set1)

#head(merge_all)


######################################################################
############# Code functionality 2 ###################################
######################################################################

## Below code - Extracts only the measurements on the mean
##              and standard deviation for each measurement.
## Please check above for file download and reading the files

mean_std <- merge_all %>% select(subject, num, contains("mean"), contains("std"))

#head(mean_std)


######################################################################
############# Code functionality 3 ###################################
######################################################################

## Below code - Uses descriptive activity names to name the activities in the data set
## Please check above for file download and reading the files

mean_std$num <- activity_labels[mean_std$num, 2]

#head(mean_std$num)

######################################################################
############# Code functionality 4 ###################################
######################################################################

## Below code - Appropriately labels the data set with descriptive variable names.
## Please check above for file download and reading the files

names(mean_std)<-gsub("^t", "Time_", names(mean_std))
names(mean_std)<-gsub("^f", "Frequency_", names(mean_std))
names(mean_std)<-gsub("-mean()", "_mean_", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("-std()", "_stddev_", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("-freq()", "Frequency", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("Acc", "Accelerometer", names(mean_std))
names(mean_std)<-gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std)<-gsub("Mag", "Magnitude", names(mean_std))
names(mean_std)<-gsub("tBody", "TimeBody", names(mean_std))
names(mean_std)[2] = "activity"


######################################################################
############# Code functionality 5 ###################################
######################################################################

## Below code - From the data set in step 4, creates a second, independent tidy data 
##              set with the average of each variable for each activity and each subject.
## Please check above for file download and reading the files

final_tidy_data <- mean_std %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(final_tidy_data, "final_tidy_data.txt", row.name=FALSE)


