Human Activity Recognition Using Smartphones Dataset
=====
### Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

____

Data Location
=====

The required data can be found at this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please download and extract the data as a first step, noting the path to the base folder named UCI HAR Dataset. This path will be required for executing the script run_analysis.R

Summarized Data
=====

The included script run_analysis.R takes the original files as input and outputs a summarized long dataset on a subset of features. Data from both the test and training set are joined together.

The script takes as arguments:

- **data_directory**: the path to the base UCI HAR Dataset folder.
- **arrange**: whether the output dataset should be arranged by subject, activity and feature.

Only mean and standard deviation features are retained (ie. tBodyAcc-mean()-X, fBodyAccJergMag-std(), etc.). Additional features including the word mean but not explicitly indicating the function mean() were dropped. This is due to the possibility of these features including additional calculation or transformation beyond simply providing the mean average value.

Average values were calculated for both of these measures, split into two separate datasets and then merged together in a normalized fashion. As such, each record provides the average (mean) value of both the mean and standard deviation of a feature for a given subject and activity.

Additionally, features are renamed slightly for better readability. Underscores are utilized to visually separate out the activity of the feature (ie. BodyAcceleration, GravityAcceleration etc.) and the type of measurement (-X, -Y, -Z or Magnitude). Prefixes were retained with prefix "t" alluding to a time measurement and "f" to a frequency measurement.

For more information on the variables and the calculations performed please check code_book.md.

Original Data
=====

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Again, please check code_book.md for more details.

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes
=====
- Features are normalized and bounded within [-1,1].

For more information about the original dataset contact: activityrecognition@smartlab.ws

License
=====
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
