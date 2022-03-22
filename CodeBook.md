Data is "Human Activity Recognition Using Smartphones Dataset Version 1.0"

Site Link is "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

Data link is "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


The process to make a tidy data set is in below.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* train data 70%, test data 30% among all


file name : run_analysis.R

Variables
1. features Variables
- features : List of all features. (file 'features.txt')
- activity_labels : Links the class labels with their activity name. (file 'activity_labels.txt')

2. Measure Variables
- X_train : Training set. (sourcefile 'train/X_train.txt')
- y_train : Training labels. (sourcefile 'train/y_train.txt')
- X_test : Test set. (sourcefile 'test/X_test.txt')
- y_test : Test labels. (sourcefile 'test/y_test.txt')

The following files are available for the train and test data. Their descriptions are equivalent. 
- subject_train/subject_test : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. (sourcefile 'train/subject_train.txt'/'test/subject_test.txt' )


