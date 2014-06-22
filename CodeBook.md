**Note:** This file is heavily derived from the files *README.txt* and *features_info.txt* from the UCI "Human Activity Recognition Using Smartphones Data Set, Version 1.0" available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details about authorship are provided in the project **README.md** file and not repeated in this file.

## Attribute Descriptions

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**"Subject"** is a unique identifier for each participant in the study and ranges from 1 to 30.

**"Activity"** is one of the following:
 WALKING,
 WALKING_UPSTAIRS,
 WALKING_DOWNSTAIRS,
 SITTING,
 STANDING,
 LAYING.


* X, Y, Z -- denotes 3-axial signals in the X, Y and Z directions
* t, f -- denotes time vs. frequency domain
* Mean, StdDev -- denotes that both the Mean and Standard Deviation of the attribute values are available


| | Feature Name | | | Description | Units |
| :-- | :-- | :-- | :-- | :-- | :-- | 
| t,f | BodyAcc | Mean, StdDev | X, Y, Z | | |
| t | GravityAcc | Mean, StdDev | X, Y, Z | | |
| t,f | BodyAccJerk | Mean, StdDev | X, Y, Z | | |
| t,f | BodyGyro | Mean, StdDev | X, Y, Z | | |
| t | BodyGyroJerk | Mean, StdDev | X, Y, Z | | |
| t,f | BodyAccMag | Mean, StdDev | | | |
| t | GravityAccMag | Mean, StdDev | | | |
| t,f | BodyAccJerkMag | Mean, StdDev | | | |
| t,f | BodyGyroMag | Mean, StdDev | | | |
| t,f | BodyGyroJerkMag | Mean, StdDev | | | |


## Actual Attribute Names

* Activity
* Subject
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdDevX
* tBodyAccStdDevY
* tBodyAccStdDevZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdDevX
* tGravityAccStdDevY
* tGravityAccStdDevZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdDevX
* tBodyAccJerkStdDevY
* tBodyAccJerkStdDevZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdDevX
* tBodyGyroStdDevY
* tBodyGyroStdDevZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdDevX
* tBodyGyroJerkStdDevY
* tBodyGyroJerkStdDevZ
* tBodyAccMagMean
* tBodyAccMagStdDev
* tGravityAccMagMean
* tGravityAccMagStdDev
* tBodyAccJerkMagMean
* tBodyAccJerkMagStdDev
* tBodyGyroMagMean
* tBodyGyroMagStdDev
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStdDev
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdDevX
* fBodyAccStdDevY
* fBodyAccStdDevZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdDevX
* fBodyAccJerkStdDevY
* fBodyAccJerkStdDevZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdDevX
* fBodyGyroStdDevY
* fBodyGyroStdDevZ
* fBodyAccMagMean
* fBodyAccMagStdDev
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStdDev
* fBodyGyroMagMean
* fBodyGyroMagStdDev
* fBodyGyroJerkMagMean
* fBodyGyroJerkMagStdDev

