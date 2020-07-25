Code Book
=====

### Descriptions

Below is a description of each of the fields in the summarized data set. Please also see the Feature Selection section below for more detailed information on how the features were recorded.

| Field Name     | Description
|---             |---
| SubjectID      | Unique identifier number for a given subject in the experiment. In total, there are 30 individual subjects.
| ActivityName   | The name of the activity measured for the given record. The activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
| Feature        | The name of the feature against which the summary value was calculated. Please see below for further information on each of these features.
| AverageStd     | The average (mean) value of the standard deviation for the given SubjectID, ActivityName and Feature combination.
| AverageMean    | The average (mean) value of the mean for the given SubjectID, ActivityName and Feature combination.

A brief description of each of the features found in the Features column can be found below. **Note that for each feature, we selected only the mean and standard deviation values for this summary.**

Each feature can be broken down by a prefix, name and suffix. We first document the meaning of the prefixes and suffixes used and then go onto the basic feature names:

Features were recorded over time intervals of 50Hz. Additional features were created by applying a subsequent FFT (Fast Fourier Transform).

| Prefix  | Description
|---      |---
| t       | Time domain signal captured at a rate of 50Hz.
| f       | Transformed signal by applying FFT

Additionally, each feature is measured across three axes and on overall magnitude. These separate measurements are indicated by the feature suffix.

| Suffix    | Description
|---        |---
| X         | Quantity along the x-axis.
| Y         | Quantity along the y-axis.
| Z         | Quantity along the z-axis.
| Magnitude | The overall magnitude of the quantity calculated using the Euclideun norm.

Finally, the features themselves.

| Feature Name             | Description
|---                       |---
| BodyAcceleration         | The linear acceleration of the subject's body.
| BodyAccelerationJerk     | The linear jerk of the subject's body.
| BodyGyro                 | The angular velocity of the subject's body.
| BodyGyroJerk             | The angular jerk of the subject's body.
| GravityAcceleration      | The linear acceleration of gravity.

### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
