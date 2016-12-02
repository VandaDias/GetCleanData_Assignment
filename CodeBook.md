#Code Book
This code book describes the variables, the data, and any transformations or work that were performed to clean up the data set.

#Data Set
The data set consists on an Human Activity Recognition (HAR) database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and the data downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Variables
The variables consist in:

- 561 features with time and frquency domain variables,

- activity performed

- subject identifier

The 561 features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

angle(): Angle between to vectors


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
    
gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

#Analysis Performed
1. Open packages needed to perform the analysis: dplyr


2. Read all the files needed

- activity_labels.txt

- features.txt

- subject_train.txt

- X_train.txt

- y_train.txt

- subject_test.txt

- X_test.txt

- y_test.txt


3. Assgniment Goal 1: merge the training and the test sets to create one data set

- names the column headings for the 561 features dataset, both in the train and in the test sets

- creates new data frames to incorporate new columns, both in the train and in the test sets

- adds specific columns of subject and activity to both the train and the set data sets

- merges the training and the test sets: HAR_dataset


4. Assignment Goal 2: extracts only the measurements on the mean and standard deviation for each measurement

- removes duplicated column names

- identifies mean and std column names

- selects mean and std column names and last 2 columns (activity and subject)


5. Assignment Goal 3: uses descriptive activity names to name the activities in the data set


6. Assignment Goal 4: appropriately labels the data set with descriptive variable names

- labels all column names to lower case

- substitutes "-" for "_" in all column names

- eliminates the parenteses in all column names


7. Assignment Goal 5: from the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject: HAR_grouped
