download_rawdata <- function() {
    # Downloads, timestamps and extracts raw data files for further processing
    
    datadir <- "./data"
    destfile <- "./data/UCI HAR Dataset.zip"
    unzipdata <- "./data/UCI HAR Dataset"
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    if (!file.exists(datadir)) {
        message(paste("Created", datadir))
        dir.create(datadir)
    }
    
    if (!file.exists(destfile)) {
        message(paste("Downloading", destfile))
        download.file(url, destfile, method="curl")

        # Save timestamp for downloaded data
        ts <- timestamp(prefix=paste(destfile, "was downloaded on "), suffix=".")
        write(ts, file=paste(destfile,".timestamp", sep=""))
    }
    
    if (!file.exists(unzipdata)) {
        message(paste("Unzipping", destfile))
        unzip(destfile, exdir=datadir)
    }
}

parse_rawdata <- function(raw_data, activity_labels, features) {
    # Contains processing that is common to the 'test' and 'train' datasets
    # that are run on each of them prior to being merged together

    x <- read.table(raw_data$X)
    names(x) <- features
    
    # Subset 'X' to only contain mean or standard deviation measurements
    # This is done based on the feature names
    include_measurement <- grepl("mean()", names(x), fixed=TRUE) | 
        grepl("std()", names(x), fixed=TRUE)
    
    x <- x[,include_measurement]
    
    # Clean column names so the syntax is correct
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

get_tidydata1 <- function() {
    # Generates a tidy data set as per steps #1-4 of the course project
    # implementation of which is primarily in parse_rawdata()

    # Activity labels are converted to a character from factor to get levels in
    # an expected order
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    activity_labels <- as.character(activity_labels$V2)
    
    # Feature names converted to a character from factor so it can be
    # manipulated and set as column names
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    features <- as.character(features$V2)
    
    raw_train <- list()
    raw_train["X"] <- "./data/UCI HAR Dataset/train/X_train.txt"
    raw_train["Y"] <- "./data/UCI HAR Dataset/train/y_train.txt"
    raw_train["Subject"] <- "./data/UCI HAR Dataset/train/subject_train.txt"

    raw_test <- list()
    raw_test["X"] <- "./data/UCI HAR Dataset/test/X_test.txt"
    raw_test["Y"] <- "./data/UCI HAR Dataset/test/y_test.txt"
    raw_test["Subject"] <- "./data/UCI HAR Dataset/test/subject_test.txt" 
    
    message("Parsing training data")
    train <- parse_rawdata(raw_train, activity_labels, features)
    
    message("Parsing test data")
    test <- parse_rawdata(raw_test, activity_labels, features)
    
    message("Merging test and training data")
    rbind(train, test)
}


get_tidydata2 <- function(data1) {
    # Generates 'tidy' dataset as per step #5 of course project

    # Note: Assumption is made that this dataset is derived from steps #1-4, 
    # i.e. get_tidydata1() as per this implementation, and is thus a subset of
    # the original raw data set.

    require(plyr)
    require(reshape2)

    dataMelt <- melt(data1, id=c("Subject", "Activity"))
    dcast(dataMelt, Activity + Subject ~ variable, mean)
}


# Code below is intentionally not in a function and runs when this file is 
# sourced, this was done to simplify the number of steps required to generate
# the tidy datasets

download_rawdata()

data1 <- get_tidydata1()
data1file <- "UCI HAR Data Set 1.csv"
message(paste("Writing", data1file))
write.csv(data1, data1file, row.names=FALSE)

data2 <- get_tidydata2(data1)
data2file <- "UCI HAR Data Set 2.csv"
message(paste("Writing", data2file))
write.csv(data2, data2file, row.names=FALSE)
