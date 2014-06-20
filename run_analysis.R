DATA_DIR <- "./data"
DEST_FILE <- paste(DATA_DIR, "data.zip", sep="/")
DATA_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FEATURES <- "./data/UCI HAR Dataset/features.txt"
ACTIVITY_LABELS <- "./data/UCI HAR Dataset/activity_labels.txt"
X_TRAIN <- "./data/UCI HAR Dataset/train/X_train.txt"
Y_TRAIN <- "./data/UCI HAR Dataset/train/y_train.txt"
SUBJECT_TRAIN <- "./data/UCI HAR Dataset/train/subject_train.txt"

download_rawdata <- function() {
    if (!file.exists(DATA_DIR)) {
        dir.create(DATA_DIR)
    }
    
    if (!file.exists(DEST_FILE)) {
        download.file(DATA_URL, DEST_FILE, method="curl")
        unzip(DEST_FILE, exdir=DATA_DIR)
    }
}

download_rawdata()

# Activity labels converted to a character from factor to get levels in
# correct order
activity_labels <- read.table(ACTIVITY_LABELS)
activity_labels <- as.character(activity_labels$V2)

y_train <- read.table(Y_TRAIN)
names(y_train) <- "Activity"
y_train$Activity <- as.factor(y_train$Activity)
levels(y_train$Activity) <- activity_labels

subject_train <- read.table(SUBJECT_TRAIN)
names(subject_train) <- "Subject"
subject_train$Subject <- as.factor(subject_train$Subject)

features <- read.table(FEATURES)
features$V2 <- as.character(features$V2)
include_measurement <- grepl("mean()", features$V2, fixed=TRUE) | grepl("std()", features$V2, fixed=TRUE)

x_train <- read.table(X_TRAIN)






