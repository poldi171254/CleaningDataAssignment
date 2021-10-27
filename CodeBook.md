Study Design
------------------

The data came from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file was decompressed via the command line (Linux) with the resulting file structure

UCI HAR Dataset
  README.txt
  activity_labels.txt
  features.txt
  features_info.txt
  train
    X_train.txt
    subject_train.txt
    y_train.txt
    Inertial Signals
      body_acc_x_train.txt
      body_acc_z_train.txt
      body_gyro_y_train.txt
      total_acc_x_train.txt
      total_acc_z_train.txt
body_acc_y_train.txt  body_gyro_x_train.txt  body_gyro_z_train.txt  total_acc_y_train.txt
  subject
    X_train.txt
    subject_train.txt
    y_train.txt    
    Inertial Signals
      body_acc_x_train.txt
      body_acc_z_train.txt
      body_gyro_y_train.txt
      total_acc_x_train.txt
      total_acc_z_train.txt

The files in the "Inertial Signals" folder was used for this analysis

Codebook
------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


I only extracted the mean and standard deviation data from the data set. The variables are

subjectID:  The subject's ID
activityID: The Activity for the measurements

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc.mean-X, tBodyAcc.mean-Y, tBodyAcc.mean-Z
tGravityAcc.mean-X, tGravityAcc.mean-Y, tGravityAcc.mean-Z
tBodyAccJerk.mean-X, tBodyAccJerk.mean-Y, tBodyAccJerk.mean-Z,
tBodyGyro.mean-X, tBodyGyro.mean-Y, tBodyGyro.mean-Z,
tBodyGyroJerk.mean-X, tBodyGyroJerk.mean-Y, tBodyGyroJerk.mean-Z
fBodyAcc.meanFreq-X, fBodyAcc.meanFreq-Y, fBodyAcc.meanFreq-Z,
fBodyAccJerk.mean-X, fBodyAccJerk.mean-Y, fBodyAccJerk.mean-Z,
fBodyAccJerk.meanFreq-X, fBodyAccJerk.meanFreq-Y, fBodyAccJerk.meanFreq-Z,
fBodyGyro.mean-X, fBodyGyro.mean-Y, fBodyGyro.mean-Z,
fBodyGyro.meanFreq-X, fBodyGyro.meanFreq-Y, fBodyGyro.meanFreq-Z

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

tBodyAccMag.mean, tGravityAccMag.mean, tBodyAccJerkMag.mean, tBodyGyroMag.mean, tBodyGyroJerkMag.mean,
gravityMean, angle.tBodyGyroMean.gravityMean, angle.tBodyGyroJerkMean.gravityMean, angle.X.gravityMean, angle.Y.gravityMean,angle.Z.gravityMean,
fBodyAccMag.mean, fBodyAccMag.meanFreq, fBodyBodyAccJerkMag.mean, fBodyBodyAccJerkMag.meanFreq, fBodyBodyGyroMag.mean, fBodyBodyGyroMag.meanFreq, fBodyBodyGyroJerkMag.mean, fBodyBodyGyroJerkMag.meanFreq, angle.tBodyAccMean.gravity, angle.tBodyAccJerkMean


