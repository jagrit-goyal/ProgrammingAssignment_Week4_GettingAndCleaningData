# Read features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# Merge the training and test datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine all into one dataset
merged_data <- cbind(subject_data, y_data, x_data)

# Extract only measurements on mean and standard deviation
selected_features <- grep("mean|std", features$feature, ignore.case = TRUE)
extracted_data <- merged_data[, c(1, 2, selected_features + 2)]

# Use descriptive activity names
extracted_data$activity <- activities[extracted_data$activity, 2]

# Clean up variable names
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))

# Create a tidy dataset with the average of each variable for each activity and subject
tidy_data <- extracted_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

# Write the tidy dataset to a text file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

