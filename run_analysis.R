# Getting and Cleaning Data
# April 2015
#
# Project
#
# Filename: run_analysis.R

#
# This script converts data in the "UCI HAR Dataset" folder in the working directory
# and produces a tidy data set in memory.
# See README.md for details.
#


#
# Load packages
#

library(dplyr)
library(tidyr)


#
# Read the data
#
# Note: Preliminary column names are assigned during the data read.
#       These column names will be cleaned up later
#

# setup the data folders
data_folder <- "UCI HAR Dataset/"
data_folder_train <- paste0(data_folder, "train/")
data_folder_test  <- paste0(data_folder, "test/")

# read the activity Labels
activity_labels <- tbl_df(read.table(paste0(data_folder, "activity_labels.txt"),
                                     col.names = c("activity_number", "activity")))

# read the features (i.e. column labels for the measured data)
features <- tbl_df(read.table(paste0(data_folder, "features.txt"),
                              col.names = c("feature_number", "feature")))

# read the subjects for the Train and Test data
subject_train <- tbl_df(read.table(paste0(data_folder_train, "subject_train.txt"),
                                   col.names = "subject"))
subject_test  <- tbl_df(read.table(paste0(data_folder_test, "subject_test.txt"),
                                   col.names = "subject"))

# read the values for the Train and Test data
# this can take a while
x_train  <- tbl_df(read.table(paste0(data_folder_train, "X_train.txt"),
                              col.names = features$feature))
x_test   <- tbl_df(read.table(paste0(data_folder_test, "X_test.txt"),
                              col.names = features$feature))

# read the activities for the Train and Test data
y_train  <- tbl_df(read.table(paste0(data_folder_train, "y_train.txt"),
                              col.names = "activity"))
y_test   <- tbl_df(read.table(paste0(data_folder_test, "y_test.txt"),
                              col.names = "activity"))


#
# 1. Merge the training and test data sets to create one data set
#

data <- tbl_df(bind_cols(bind_rows(y_train, y_test), 
                         bind_rows(subject_train, subject_test),
                         bind_rows(x_train, x_test)))


#
# 2. Extract only the measurements on the mean and standard deviation
#    for each measurement.
#

data_select <- data %>%
               select(-matches("^angle")) %>%
               select(activity, subject, matches("mean\\.\\.|std\\.\\."))



#
# 3. Use descriptive activity names to name the activities in the data set
#

data_select <- mutate(data_select, 
                      activity = factor(data_select$activity, 
                                        labels = activity_labels$activity))


#
# 4. Appropriately label the data set with descriptive variable names
#
#
# Note: The preliminary column names were already applied when the data was read.
#       Now the column names will be cleaned up and converted to camelCase.
#

# create cleaned column names
a <- sub('BodyBody', 'Body', colnames(data_select))
a <- sub('mean', 'Mean', a)
a <- sub('std', 'Stddev', a)
a <- gsub('\\.', '', a)
a <- sub('anglet', 'angleT', a)

# apply the cleaned column names to the data
colnames(data_select) <- a


#
# 5. From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject
#

tidy_data <- data_select %>%
             group_by(activity, subject) %>%
             summarise_each(funs(mean)) %>%
             gather(feature, meanValue, -activity, -subject)

