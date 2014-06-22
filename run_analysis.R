download_rawdata <- function() {
    # Downloads and extracts raw data files

    datadir <- "./data"
    destfile <- "./data/data.zip"
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    if (!file.exists(datadir)) {
        dir.create(datadir)
    }
    
    if (!file.exists(destfile)) {
        download.file(url, destfile, method="curl")
        unzip(destfile, exdir=datadir)
    }
}

parse_rawdata <- function(raw_data, activity_labels, features) {

    x <- read.table(raw_data$X)
    names(x) <- features
    
    # Subset 'X' to only contain mean or standard deviation measurements
    # This is done based on the feature names
    include_measurement <- grepl("mean()", names(x), fixed=TRUE) | 
        grepl("std()", names(x), fixed=TRUE)
    
    x <- x[,include_measurement]
    
    # Clean column names
    colnames <- names(x)
    colnames <- gsub("-std()", "StdDev", colnames, fixed=TRUE)
    colnames <- gsub("-mean()", "Mean", colnames, fixed=TRUE)
    colnames <- gsub("-", "", colnames, fixed=TRUE)
    names(x) <- make.names(colnames, unique=TRUE)
    
    
    y <- read.table(raw_data$Y)
    names(y) <- "Activity"
    y$Activity <- as.factor(y$Activity)
    levels(y$Activity) <- activity_labels
    
    # Subject is stored as an integer rather than a factor to allow clearer
    # sorting. It was found that the levels assigned by default during read.table
    # were not as expected.
    subject <- read.table(raw_data$Subject)
    names(subject) <- "Subject"
    subject$Subject <- as.character(subject$Subject)
    subject$Subject <- as.integer(subject$Subject)
    
    cbind(x, y, subject)   
}



get_tidydata <- function() {
    
    # Activity labels converted to a character from factor to get levels in
    # correct order
    ACTIVITY_LABELS <- "./data/UCI HAR Dataset/activity_labels.txt"
    activity_labels <- read.table(ACTIVITY_LABELS)
    activity_labels <- as.character(activity_labels$V2)
    
    # Feature names converted to a character from factor so it can be
    # manipulated and set as column names
    FEATURES <- "./data/UCI HAR Dataset/features.txt"
    features <- read.table(FEATURES)
    features$V2 <- as.character(features$V2)
    
    RAW_TRAIN <- list()
    RAW_TRAIN["X"] <- "./data/UCI HAR Dataset/train/X_train.txt"
    RAW_TRAIN["Y"] <- "./data/UCI HAR Dataset/train/y_train.txt"
    RAW_TRAIN["Subject"] <- "./data/UCI HAR Dataset/train/subject_train.txt"

    RAW_TEST <- list()
    RAW_TEST["X"] <- "./data/UCI HAR Dataset/test/X_test.txt"
    RAW_TEST["Y"] <- "./data/UCI HAR Dataset/test/y_test.txt"
    RAW_TEST["Subject"] <- "./data/UCI HAR Dataset/test/subject_test.txt" 
    
    train <- parse_rawdata(RAW_TRAIN, activity_labels, features$V2)
    test <- parse_rawdata(RAW_TEST, activity_labels, features$V2)
    
    data <- rbind(train, test)
}

download_rawdata()

require(plyr)
require(reshape2)

data <- get_tidydata()
write.csv(data, "tidy_data1.csv", row.names=FALSE)

dataMelt <- melt(data, id=c("Subject", "Activity"))
data2 <- dcast(dataMelt, Activity + Subject ~ variable, mean)

write.csv(data2, "tidy_data2.csv", row.names=FALSE)
