This repo implements the course project for the Coursera course, Getting and Cleaning Data
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD.

Assignment is implemented by **github.com/shirishb** on Jun 22, 2014.

# Course Project

*Taken verbatim from the assignment page.*

> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

> Here are the data for the project: 

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

> You should create one R script called run_analysis.R that does the following.

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Original "Raw" Data

Human Activity Recognition Using Smartphones Dataset, Version 1.0

Available for download at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

>  Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

>  **Smartlab - Non Linear Complex Systems Laboratory**
>  DITEN - Universit degli Studi di Genova.
>  Via Opera Pia 11A, I-16145, Genoa, Italy.
>  activityrecognition@smartlab.ws
>  www.smartlab.ws


# Repo Files

* *README.md* -- this document
* *CodeBook.md* -- description of the dataset attributes and how they were obtained
* *run_analysis.R* -- script to create the new "tidy" dataset from the original "raw" dataset

Following two files are provided for reference only. They will be overwritten when the run_analysis.R script is executed:

* *UCI HAR Data Set 1.csv* -- "tidy" dataset for steps #1-4 of the assignment
* *UCI HAR Data Set 2.csv* -- "tidy" dataset for step #5 of the assignment

# Generating "tidy" Dataset

The run_analysis.R script simply needs to be sourced and it will download, timestamp, and process the raw data to generate the tidy datasets required.

With the run_analysis.R script in the current working directory of your R session run the following command:

```
> source("run_analysis.R")
```

Following is the expected output if everything runs successfully:

```
Created ./data
Downloading ./data/UCI HAR Dataset.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 59.6M  100 59.6M    0     0   283k      0  0:03:35  0:03:35 --:--:--  132k
./data/UCI HAR Dataset.zip was downloaded on Sun Jun 22 12:50:42 2014.
Unzipping ./data/UCI HAR Dataset.zip
Parsing training data
Parsing test data
Merging test and training data
Writing UCI HAR Data Set 1.csv
Loading required package: plyr
Loading required package: reshape2
Writing UCI HAR Data Set 2.csv
```

This will generate "UCI HAR Data Set 1.csv" and "UCI HAR Data Set 2.csv" in your current working directory.

**WARNING:** Depending on your download speeds this script can take quite a while to execute since the raw data set is around 60MiB.

