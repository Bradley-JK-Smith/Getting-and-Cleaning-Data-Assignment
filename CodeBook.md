# Getting-and-Cleaning-Data-Assignment - CODE BOOK

This codebook should be read in conjunction with the following files contained in the UCI HAR Dataset directory

## Background

* README.txt
	* This has the background information about the experiment design and data files

* features.txt
	* List of variables in the raw data set

* features_info.txt
	* The list of features in the raw data set
	* This file has been modified below to show just the tidied data 

## Feature Selection 

### Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time\_' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tim\e_BodyAcc-XYZ and time\_GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time\_BodyAccJerk-XYZ and time\_BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time\_BodyAccMag, time\_GravityAccMag, time\_BodyAccJerkMag, time\_BodyGyroMag, time\_BodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency\_BodyAcc-XYZ, frequency\_BodyAccJerk-XYZ, frequency\_BodyGyro-XYZ, frequency\_BodyAccJerkMag, frequency\_BodyGyroMag, frequency\_BodyGyroJerkMag. (Note the 'frequency\_' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The mean and standard deviation are calculated for each feature and output in the Tidy\_Data.csv file.



### Variables - Tidy\_Data.csv

These are the control variables

- subject\_id
	- integer
	- identifier of subject who carried out the experiment
- activity\_name
	- string
	- one of 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING\_DOWNSTAIRS', 'WALKING\_UPSTAIRS'
- set\_type
	- string
	- one of 'test', 'train'

For the remaining listed variables, these are all
	- decimal
	- normalised and bounded between [-1,1]

These variables are organised as follows:

- the prefix identifies the measurement (either 'mean' or 'std')
- the next section identifies the domain signal (either 'time' or 'frequency')
- the suffix identifies the cartesian co-ordinates if applicable.

_I've specifically used underscores to break up the components because I thought this was easier to read and also easier to break up if required_

The full list of variables is given below:

- mean\_time\_BodyAcc-X
- mean\_time\_BodyAcc-Y
- mean\_time\_BodyAcc-Z
- std\_time\_BodyAcc-X
- std\_time\_BodyAcc-Y
- std\_time\_BodyAcc-Z
- mean\_time\_GravityAcc-X
- mean\_time\_GravityAcc-Y
- mean\_time\_GravityAcc-Z
- std\_time\_GravityAcc-X
- std\_time\_GravityAcc-Y
- std\_time\_GravityAcc-Z
- mean\_time\_BodyAccJerk-X
- mean\_time\_BodyAccJerk-Y
- mean\_time\_BodyAccJerk-Z
- std\_time\_BodyAccJerk-X
- std\_time\_BodyAccJerk-Y
- std\_time\_BodyAccJerk-Z
- mean\_time\_BodyGyro-X
- mean\_time\_BodyGyro-Y
- mean\_time\_BodyGyro-Z
- std\_time\_BodyGyro-X
- std\_time\_BodyGyro-Y
- std\_time\_BodyGyro-Z
- mean\_time\_BodyGyroJerk-X
- mean\_time\_BodyGyroJerk-Y
- mean\_time\_BodyGyroJerk-Z
- std\_time\_BodyGyroJerk-X
- std\_time\_BodyGyroJerk-Y
- std\_time\_BodyGyroJerk-Z
- mean\_time\_BodyAccMag
- std\_time\_BodyAccMag
- mean\_time\_GravityAccMag
- std\_time\_GravityAccMag
- mean\_time\_BodyAccJerkMag
- std\_time\_BodyAccJerkMag
- mean\_time\_BodyGyroMag
- std\_time\_BodyGyroMag
- mean\_time\_BodyGyroJerkMag
- std\_time\_BodyGyroJerkMag
- mean\_frequency\_BodyAcc-X
- mean\_frequency\_BodyAcc-Y
- mean\_frequency\_BodyAcc-Z
- std\_frequency\_BodyAcc-X
- std\_frequency\_BodyAcc-Y
- std\_frequency\_BodyAcc-Z
- mean\_frequency\_BodyAccJerk-X
- mean\_frequency\_BodyAccJerk-Y
- mean\_frequency\_BodyAccJerk-Z
- std\_frequency\_BodyAccJerk-X
- std\_frequency\_BodyAccJerk-Y
- std\_frequency\_BodyAccJerk-Z
- mean\_frequency\_BodyGyro-X
- mean\_frequency\_BodyGyro-Y
- mean\_frequency\_BodyGyro-Z
- std\_frequency\_BodyGyro-X
- std\_frequency\_BodyGyro-Y
- std\_frequency\_BodyGyro-Z
- mean\_frequency\_BodyAccMag
- std\_frequency\_BodyAccMag
- mean\_frequency\_BodyBodyAccJerkMag
- std\_frequency\_BodyBodyAccJerkMag
- mean\_frequency\_BodyBodyGyroMag
- std\_frequency\_BodyBodyGyroMag
- mean\_frequency\_BodyBodyGyroJerkMag
- std\_frequency\_BodyBodyGyroJerkMag


## Variables - Tidy\_Summary.csv

The list of variables in the Tidy\_Summary file is exactly the same as the Tidy\_Data.csv file