##Open packages needed to perform the analysis
library(dplyr)

##Read all the files needed
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, row.names = NULL)
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE, row.names = NULL)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, row.names = NULL)
train_x <-read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE, row.names = NULL)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE, row.names = NULL)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, row.names = NULL)
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE, row.names = NULL)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE, row.names = NULL)

##Goal: Merge the training and the test sets to create one data set
names(train_x) <- features$V2 #names column headings
names(test_x) <- features$V2
train_set <- train_x #creates and renames data frames
test_set <- test_x
train_set$subject <- train_subject$V1 #adds specific columns to the sets
train_set$activity <- train_y$V1
test_set$subject <- test_subject$V1
test_set$activity <- test_y$V1
HAR_dataset <- rbind(train_set, test_set) #merges the training and the test sets

##Goal: Extracts only the measurements on the mean and standard deviation for each measurement.
HAR_dataset <- HAR_dataset[, !duplicated(colnames(HAR_dataset))] ##removes duplicated column names
selection <- grep("mean\\(|std\\(", names(HAR_dataset)) #identifies mean and std column names
HAR_selection <- select(HAR_dataset, c(selection, 478:479)) #selects mean and std column names and last 2 columns (activity and subject)

##Goal: Uses descriptive activity names to name the activities in the data set
names(activity_labels) <- c("activity", "activity_descrip")
HAR_selection$activity <- activity_labels$activity_descrip[match(HAR_selection$activity, activity_labels$activity)]

##Goal: Appropriately labels the data set with descriptive variable names
names(HAR_selection) <- tolower(names(HAR_selection)) #labels all column names to lower case
names(HAR_selection) <- chartr(old = "-", new = "_", names(HAR_selection)) #substitutes "-" for "_" in all column names
names(HAR_selection) <- gsub("\\()", "", names(HAR_selection)) #eliminates the parenteses in all column names

##Goal: From the data set in step 4, creates a second, independent tidy data set
##with the average of each variable for each activity and each subject
HAR_grouped <- HAR_selection %>%
    group_by(activity, subject) %>%
    summarise_each(funs(mean))

##Creates a text file to be submitted
#write.table(HAR_grouped, "HAR_grouped.txt", row.names = FALSE)