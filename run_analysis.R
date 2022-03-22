# This is an assignment of week4 in Getting and Cleaning Data

# set work directory
setwd("/Users/serilee/Dropbox/내 PC (DESKTOP-B7IJKD9)/Desktop/Personal/Coursera/03_getting and cleaning data/week4/assignment/UCI HAR Dataset")

# read data set of train
## subject_train is the subject data  who performed the activity for each window sample.
## x_train is a Training data set.
## y_train is the labels of a Training data set.
subject_train = read.table("train/subject_train.txt", header = F)
X_train = read.table("train/X_train.txt", header = F)
y_train = read.table("train/y_train.txt", header = F)

# read data set of test
## subject_test is the subject data  who performed the activity for each window sample.
## x_test is a Testing data set.
## y_test is the labels of a Testing data set.
subject_test = read.table("test/subject_test.txt", header = F)
X_test = read.table("test/X_test.txt", header = F)
y_test = read.table("test/y_test.txt", header = F)

# read the data of label
## list of all features
features = read.table("features.txt", header = F)
## the class labels with thrie activity name.
activity_labels = read.table("activity_labels.txt", header = F)

# 4. Appropriately labels the data set with descriptive variable names. 
## assign descriptive activity names
colnames(X_test) = features[,2]
colnames(X_train) = features[,2]
colnames(subject_test) = "subject_ID"
colnames(subject_train) = "subject_ID"
colnames(y_test) = "data_ID"
colnames(y_train) = "data_ID"
colnames(activity_labels) = c("data_ID", "activity")

# 1. Merges the training and the test sets to create one data set.
## combine train data
train <- cbind(y_train, subject_train, X_train)
## combine test data
test <- cbind(y_test, subject_test, X_test)
## merge train and test
merge_train_test = rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## select column name containing "mean.." and "std.."
column_name = colnames(merge_train_test)
mean_sd = (grepl("data_ID", column_name) |
             grepl("subject_ID", column_name) |
             grepl("mean..", column_name) | 
             grepl("std..", column_name))
Ectract_mean_sd = merge_train_test[, mean_sd == TRUE]

# 3. Uses descriptive activity names to name the activities in the data set
## merge train & test data set and activity_labels by data_ID
data_label = merge(Ectract_mean_sd, activity_labels, by="data_ID", all.x = TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_d_set = aggregate(. ~subject_ID+data_ID, data_label, mean)

# save a file in txt format
write.table(tidy_d_set, "tidy_d_set.txt", row.names = F)
