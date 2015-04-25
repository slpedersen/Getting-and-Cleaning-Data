# CodeBook.md

# Project To Create A Tidy Dataset
## Getting and Cleaning Data
## April 2015
## Codebook for the tidy data set produced by the run_analysis.R script

## Source of data

A study on "Human Activity Recognition Using Smartphones" was carried out measuring motion data during 6 different activities engaged in by each of 30 subjects.  The study was carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto in the Smartlab - Non Linear Complex Systems Laboratory at DITEN - Università degli Studi di Genova, activityrecognition@smartlab.ws, www.smartlab.ws. [1]

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

(Source: README.txt in the "UCI HAR Dataset" folder obtained by downloading and unzipping the zipped data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .)

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, [fBodyAccMag,] fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>tBodyAcc-XYZ
>tGravityAcc-XYZ
>tBodyAccJerk-XYZ
>tBodyGyro-XYZ
>tBodyGyroJerk-XYZ
>tBodyAccMag
>tGravityAccMag
>tBodyAccJerkMag
>tBodyGyroMag
>tBodyGyroJerkMag
>fBodyAcc-XYZ
>fBodyAccJerk-XYZ
>fBodyGyro-XYZ
>fBodyAccMag
>fBodyAccJerkMag
>fBodyGyroMag
>fBodyGyroJerkMag
>The set of variables that were estimated from these signals [include]: 
>
>mean(): Mean value
>std(): Standard deviation

(Source: features_info.txt in the "UCI HAR Dataset" folder obtained by downloading and unzipping the zipped data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .)

## Calculation of data for this project

To produce the tidy dataset for this project, the data was summarized by activity and subject and the mean calculated for each of the 66 mean and standard deviation variables described above.  Then the data was transformed to a narrow form with four columns: subject, activity, feature, meanValue.

The resulting dataset is tidy because:
```
* Each variable forms a column
* Each observation forms a row
* Each type of observational unit forms a table
```
(Source: Swirl module for "Getting and Cleaning Data".)

(In the original data, additional variables involving means were calculated, for example the "[w]eighted average of the frequency components to obtain a mean frequency" and "additional vectors obtained by averaging the signals in a signal window sample.... used on the angle() variable"  These variables were not extracted for this tidy dataset.  The reason was for this tidy dataset to focus on the means of means and standard deviations calculated directly from the 33 basic variables listed initially in the original codebook.)

## Data dictionary

| activity | - activity performed |
|          | WALKING |
|          | WALKING_UPSTAIRS |
|          | WALKING_DOWNSTAIRS |
|          | SITTING |
|          | STANDING |
|          | LAYING |
| | |
| subject | - number assigned to subject|
|         | 1..30 |
| | |
| feature | name of feature calculated |
|         | tBodyAccMeanX |
|         | tBodyAccMeanY |
|         | tBodyAccMeanZ |
|         | tBodyAccStddevX |
|         | tBodyAccStddevY |
|         | tBodyAccStddevZ |
|         | tGravityAccMeanX |
|         | tGravityAccMeanY |
|         | tGravityAccMeanZ |
|         | tGravityAccStddevX |
|         | tGravityAccStddevY |
|         | tGravityAccStddevZ |
|         | tBodyAccJerkMeanX |
|         | tBodyAccJerkMeanY |
|         | tBodyAccJerkMeanZ |
|         | tBodyAccJerkStddevX |
|         | tBodyAccJerkStddevY |
|         | tBodyAccJerkStddevZ |
|         | tBodyGyroMeanX |
|         | tBodyGyroMeanY |
|         | tBodyGyroMeanZ |
|         | tBodyGyroStddevX |
|         | tBodyGyroStddevY |
|         | tBodyGyroStddevZ |
|         | tBodyGyroJerkMeanX |
|         | tBodyGyroJerkMeanY |
|         | tBodyGyroJerkMeanZ |
|         | tBodyGyroJerkStddevX |
|         | tBodyGyroJerkStddevY |
|         | tBodyGyroJerkStddevZ |
|         | tBodyAccMagMean |
|         | tBodyAccMagStddev |
|         | tGravityAccMagMean |
|         | tGravityAccMagStddev |
|         | tBodyAccJerkMagMean |
|         | tBodyAccJerkMagStddev |
|         | tBodyGyroMagMean |
|         | tBodyGyroMagStddev |
|         | tBodyGyroJerkMagMean |
|         | tBodyGyroJerkMagStddev |
|         | fBodyAccMeanX |
|         | fBodyAccMeanY |
|         | fBodyAccMeanZ |
|         | fBodyAccStddevX |
|         | fBodyAccStddevY |
|         | fBodyAccStddevZ |
|         | fBodyAccJerkMeanX |
|         | fBodyAccJerkMeanY |
|         | fBodyAccJerkMeanZ |
|         | fBodyAccJerkStddevX |
|         | fBodyAccJerkStddevY |
|         | fBodyAccJerkStddevZ |
|         | fBodyGyroMeanX |
|         | fBodyGyroMeanY |
|         | fBodyGyroMeanZ |
|         | fBodyGyroStddevX |
|         | fBodyGyroStddevY |
|         | fBodyGyroStddevZ |
|         | fBodyAccMagMean |
|         | fBodyAccMagStddev |
|         | fBodyAccJerkMagMean |
|         | fBodyAccJerkMagStddev |
|         | fBodyGyroMagMean |
|         | fBodyGyroMagStddev |
|         | fBodyGyroJerkMagMean |
|         | fBodyGyroJerkMagStddev |
| | |
| meanValue | - mean value of measured feature |
|           | These values are unitless because as stated in the README.txt for the original data: "Features are normalized and bounded within [-1,1]" |

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
