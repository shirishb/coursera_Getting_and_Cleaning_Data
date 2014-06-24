**Note:** This file is heavily derived from the files *README.txt* and *features_info.txt* from the UCI "Human Activity Recognition Using Smartphones Data Set, Version 1.0" available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details about authorship are provided in the project **README.md** file and not repeated in this file.

## Experiment Description

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute (or "feature") Description

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


**"Subject"** is a unique identifier for each participant in the study and ranges from 1 to 30.

**"Activity"** is one of the following:
 WALKING,
 WALKING_UPSTAIRS,
 WALKING_DOWNSTAIRS,
 SITTING,
 STANDING,
 LAYING.

Below are the experiment attributes in a compressed table format to allow for description to be provided concisely with minimal repetition.

* X, Y, Z -- denotes that measurement is available for all 3-axial signals in the X, Y and Z directions
* t, f -- denotes if measurement is available in time or frequency domain (or both) 
* Mean, StdDev -- denotes that both the Mean and Standard Deviation of the attribute measurements are available

| | Attribute Name | | | Description | Units |
| :-- | :-- | :-- | :-- | :-- | :-- | 
| t,f | BodyAcc | Mean, StdDev | X, Y, Z | I could probably work this out from the experiment data | I |
| t | GravityAcc | Mean, StdDev | X, Y, Z | Instead I just provide some text to show that this information is important... | shouldn't |
| t,f | BodyAccJerk | Mean, StdDev | X, Y, Z | ...to include in this format if this were an actual 'tidy' data set that I was creating | forget |
| t,f | BodyGyro | Mean, StdDev | X, Y, Z | Please assume the rest of the column is full too! | to |
| t | BodyGyroJerk | Mean, StdDev | X, Y, Z | | include |
| t,f | BodyAccMag | Mean, StdDev | | | the |
| t | GravityAccMag | Mean, StdDev | | | units! |
| t,f | BodyAccJerkMag | Mean, StdDev | | | They |
| t,f | BodyGyroMag | Mean, StdDev | | | are |
| t,f | BodyGyroJerkMag | Mean, StdDev | | | important! |

*Please see the "Actual Attribute Names" section below to see how the first four columns of the table below combine to form attribute (or feature) names in the datasets.*

## Dataset 1: "UCI HAR Data Set 1.csv"

* Contains 10299 observations (rows) of 68 attributes (columns) 

## Dataset 2: "UCI HAR Data Set 2.csv"

* Contains 180 observations (rows) of 68 attributes (columns)
* The columns in this dataset are the same as in dataset 1, however, differ in one important way: the value is now the average (mean) of each attribute by student and activity. Which is why the number of rows is reduced.

## Key differences from "original" dataset

* Data is merged into a single file (X - features/attributes, Y - activity, Subject) for both training and test data -- making it easier to use for further analysis.
* Feature names are modified to not contain "()" or "-" so they can be used as legal column names in R.
* Subset of original data is used as per requirements of the assignment (only features relating to "mean" or "standard deviation" measurements)

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

