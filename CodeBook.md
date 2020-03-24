---
title: "CodeBook"
author: "Arun Mohan Sundaram"
date: "3/23/2020"
---

## run_analysis.R

The R script performs the data download, data file preparation and completion of 5 steps required as below in Getting and Cleaning Data assignment.

## Step 1:

Use below link to download the required data collected from the accelerometers from the Samsung Galaxy S smartphone; which is used in this project


<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


FileName: UCI HAR Dataset.zip

## Step 2:

Assign the required files to a data variable

1. features = features.txt : 561 rows, 2 columns
2. activities = activity_labels.txt : 6 rows, 2 columns
3. subject_test = /test/subject_test.txt : 2947 rows, 1 column
4. x_test = /test/X_test.txt : 2947 rows, 561 columns
5. y_test = /test/y_test.txt : 2947 rows, 1 columns
6. subject_train = /train/subject_train.txt : 7352 rows, 1 column
7. x_train = /train/X_train.txt : 7352 rows, 561 columns
8. y_train = /train/y_train.txt : 7352 rows, 1 columns


Note: Look for the commented lines in the **run_analysis.R**


## Code functionality 1

Below code will perform **Merges the training and the test sets to create one data set**

data_set1 = created by rbind() function using (x_train, x_test)

data_set2 = created by rbind() function using (y_train, y_test)

data_set3 = created by rbind() function using (subject_train, subject_test)

merge_all = created by cbind() function using (data_set3, data_set2, data_set1)


## Code functionality 2

Below code will perform **Extracts only the measurements on the mean and standard deviation for each measurement**


mean_std = created by subsetting merge_all variable from #1 by selecting only columns: subject, num; also mean and standard deviation (std) for each measurements.



## Code functionality 3

Below code will perform **Uses descriptive activity names to name the activities in the data set**


Complete data in num column of the mean_std replaced with corresponding activity taken from second column of the activity_labels variable


## Code functionality 4

Below code will perform **Appropriately labels the data set with descriptive variable names**

Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities

1) Column name starts with character "t" is renamed as "Time"

2) Column name starts with character "f" is renamed as "Frequency"

3) Column name with character "-mean" is renamed as "_mean_"

4) Column name with character "-std" is renamed as "_stddev_"

5) Column name with character "-freq" is renamed as "Frequency"

6) Column name with character "Acc" is renamed as "Accelerometer"

7) Column name with character "Gyro" is renamed as "Gyroscope"

8) Column name with character "Mag" is renamed as "Magnitude"

9) Column name with character "tBody" is renamed as "TimeBody"

10) "num" column is renamed as "activity"


## Code functionality 5

Below code will perform **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**


1) final_tidy_data is created by sumarizing mean_std taking the means of each variable for each activity and each subject, after groupped by subject and activity.

2) Export final_tidy_data into final_tidy_data.txt file ; (180 rows, 88 columns)


## Column Names in the final_tidy_data.txt

1.	subject
2.	activity
3.	Time_BodyAccelerometer.mean...X
4.	Time_BodyAccelerometer.mean...Y
5.	Time_BodyAccelerometer.mean...Z
6.	Time_GravityAccelerometer.mean...X
7.	Time_GravityAccelerometer.mean...Y
8.	Time_GravityAccelerometer.mean...Z
9.	Time_BodyAccelerometerJerk.mean...X
10.	Time_BodyAccelerometerJerk.mean...Y
11.	Time_BodyAccelerometerJerk.mean...Z
12.	Time_BodyGyroscope.mean...X
13.	Time_BodyGyroscope.mean...Y
14.	Time_BodyGyroscope.mean...Z
15.	Time_BodyGyroscopeJerk.mean...X
16.	Time_BodyGyroscopeJerk.mean...Y
17.	Time_BodyGyroscopeJerk.mean...Z
18.	Time_BodyAccelerometerMagnitude.mean..
19.	Time_GravityAccelerometerMagnitude.mean..
20.	Time_BodyAccelerometerJerkMagnitude.mean..
21.	Time_BodyGyroscopeMagnitude.mean..
22.	Time_BodyGyroscopeJerkMagnitude.mean..
23.	Frequency_BodyAccelerometer.mean...X
24.	Frequency_BodyAccelerometer.mean...Y
25.	Frequency_BodyAccelerometer.mean...Z
26.	Frequency_BodyAccelerometer.meanFreq...X
27.	Frequency_BodyAccelerometer.meanFreq...Y
28.	Frequency_BodyAccelerometer.meanFreq...Z
29.	Frequency_BodyAccelerometerJerk.mean...X
30.	Frequency_BodyAccelerometerJerk.mean...Y
31.	Frequency_BodyAccelerometerJerk.mean...Z
32.	Frequency_BodyAccelerometerJerk.meanFreq...X
33.	Frequency_BodyAccelerometerJerk.meanFreq...Y
34.	Frequency_BodyAccelerometerJerk.meanFreq...Z
35.	Frequency_BodyGyroscope.mean...X
36.	Frequency_BodyGyroscope.mean...Y
37.	Frequency_BodyGyroscope.mean...Z
38.	Frequency_BodyGyroscope.meanFreq...X
39.	Frequency_BodyGyroscope.meanFreq...Y
40.	Frequency_BodyGyroscope.meanFreq...Z
41.	Frequency_BodyAccelerometerMagnitude.mean..
42.	Frequency_BodyAccelerometerMagnitude.meanFreq..
43.	Frequency_BodyBodyAccelerometerJerkMagnitude.mean..
44.	Frequency_BodyBodyAccelerometerJerkMagnitude.meanFreq..
45.	Frequency_BodyBodyGyroscopeMagnitude.mean..
46.	Frequency_BodyBodyGyroscopeMagnitude.meanFreq..
47.	Frequency_BodyBodyGyroscopeJerkMagnitude.mean..
48.	Frequency_BodyBodyGyroscopeJerkMagnitude.meanFreq..
49.	angle.TimeBodyAccelerometerMean.gravity.
50.	angle.TimeBodyAccelerometerJerkMean..gravityMean.
51.	angle.TimeBodyGyroscopeMean.gravityMean.
52.	angle.TimeBodyGyroscopeJerkMean.gravityMean.
53.	angle.X.gravityMean.
54.	angle.Y.gravityMean.
55.	angle.Z.gravityMean.
56.	Time_BodyAccelerometer.std...X
57.	Time_BodyAccelerometer.std...Y
58.	Time_BodyAccelerometer.std...Z
59.	Time_GravityAccelerometer.std...X
60.	Time_GravityAccelerometer.std...Y
61.	Time_GravityAccelerometer.std...Z
62.	Time_BodyAccelerometerJerk.std...X
63.	Time_BodyAccelerometerJerk.std...Y
64.	Time_BodyAccelerometerJerk.std...Z
65.	Time_BodyGyroscope.std...X
66.	Time_BodyGyroscope.std...Y
67.	Time_BodyGyroscope.std...Z
68.	Time_BodyGyroscopeJerk.std...X
69.	Time_BodyGyroscopeJerk.std...Y
70.	Time_BodyGyroscopeJerk.std...Z
71.	Time_BodyAccelerometerMagnitude.std..
72.	Time_GravityAccelerometerMagnitude.std..
73.	Time_BodyAccelerometerJerkMagnitude.std..
74.	Time_BodyGyroscopeMagnitude.std..
75.	Time_BodyGyroscopeJerkMagnitude.std..
76.	Frequency_BodyAccelerometer.std...X
77.	Frequency_BodyAccelerometer.std...Y
78.	Frequency_BodyAccelerometer.std...Z
79.	Frequency_BodyAccelerometerJerk.std...X
80.	Frequency_BodyAccelerometerJerk.std...Y
81.	Frequency_BodyAccelerometerJerk.std...Z
82.	Frequency_BodyGyroscope.std...X
83.	Frequency_BodyGyroscope.std...Y
84.	Frequency_BodyGyroscope.std...Z
85.	Frequency_BodyAccelerometerMagnitude.std..
86.	Frequency_BodyBodyAccelerometerJerkMagnitude.std..
87.	Frequency_BodyBodyGyroscopeMagnitude.std..
88.	Frequency_BodyBodyGyroscopeJerkMagnitude.std..


