# Code Book for Coursera Getting and Cleaning Data Course Project

## Overview
This Code Book describes the tidy dataset in `tidy_data.txt`, generated from the "Human Activity Recognition Using Smartphones" dataset. It includes details about the data, variables, and transformations performed to produce the final tidy dataset.

## Data
The `tidy_data.txt` file contains space-separated values. Each row represents an observation for a specific subject and activity. The dataset includes:
- **30 Subjects** performing activities.
- **6 Activities**: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- **79 Variables**: Mean and standard deviation measurements from accelerometer and gyroscope signals.

## Variables
### Identifiers
- **subject**: An integer identifier for each subject (1 to 30).
- **activity**: The activity performed, with values:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

### Measurements
All measurement variables are normalized to be within the range [-1, 1]. The variables include:
- **Time-Domain Variables** (prefixed with `timeDomain`):
  - Body acceleration mean (`timeDomainBodyAccelerometerMeanX`, `timeDomainBodyAccelerometerMeanY`, `timeDomainBodyAccelerometerMeanZ`)
  - Gravity acceleration mean (`timeDomainGravityAccelerometerMeanX`, `timeDomainGravityAccelerometerMeanY`, `timeDomainGravityAccelerometerMeanZ`)
  - Body angular velocity mean (`timeDomainBodyGyroscopeMeanX`, `timeDomainBodyGyroscopeMeanY`, `timeDomainBodyGyroscopeMeanZ`)
  - Standard deviations of the above signals.
  
- **Frequency-Domain Variables** (prefixed with `frequencyDomain`):
  - Mean frequency of body acceleration (`frequencyDomainBodyAccelerometerMeanX`, etc.)
  - Standard deviations and mean frequencies for jerk and gyroscope signals.

### Transformations
1. **Merge Data**: The training and test datasets were combined to form a single dataset.
2. **Extract Measurements**: Selected only the mean and standard deviation measurements for each signal.
3. **Descriptive Activity Names**: Converted numeric activity labels to descriptive names.
4. **Rename Variables**: Renamed columns for clarity (e.g., `tBodyAcc-mean()-X` to `timeDomainBodyAccelerometerMeanX`).
5. **Tidy Dataset**: Averaged each measurement for each activity and subject, resulting in a tidy dataset with 180 rows and 81 columns.

## Source
The source data is available at:
[Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Notes
- The transformations were performed using the `run_analysis.R` script.
- The final dataset was saved as `tidy_data.txt` using `write.table()` with `row.name=FALSE`.
