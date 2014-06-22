This repo implements the course project for the Coursera course, Getting and Cleaning Data offered by the John Hopkins Bloomber School of Public Health. It is taught by Jeff Leek, PhD, Roger D. Peng, PhD, and Brian Caffo, PhD.

The original dataset contains a series of measurements from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


The run_analysis.R script simply needs to be sourced and it will download and timestamp the raw data, process it and generate the tidy data sets requested in the assignment.

Following is the expected output if things run as expected.

```
> source("run_analysis.R")
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