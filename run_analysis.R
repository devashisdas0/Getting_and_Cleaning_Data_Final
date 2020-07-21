
setwd("C:/Users/devdas2/Desktop/Cert_R_Projects/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

features <- read.table("features.txt", col.names = c("ID","Signals"))

subject_test <- read.table("test/subject_test.txt", col.names = "Individuals")
x_test <- read.table("test/X_test.txt", col.names = features$Signals)
y_test <- read.table("test/y_test.txt", col.names = "Codes")

subject_train <- read.table("train/subject_train.txt", col.names = "Individuals")
x_train <- read.table("train/X_train.txt", col.names = features$Signals)
y_train <- read.table("train/y_train.txt", col.names = "Codes")

activities <- read.table("activity_labels.txt", col.names = c("Codes", "Activity"))

x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subjects <- rbind(subject_train, subject_test)
combined <- cbind(subjects, y_merged, x_merged)

library(dplyr)
tidy <- select(combined, Individuals, Codes, contains("mean"), contains("std"))

names(tidy) <- gsub(pattern = "^t", replacement = "Time", names(tidy))
names(tidy) <- gsub(pattern = "^f", replacement = "Frequency", names(tidy))

names(tidy) <- gsub(pattern = "Acc", replacement = "_Acceleration", names(tidy))
names(tidy) <- gsub(pattern = "Gyro", replacement = "_Gyroscopic", names(tidy))
names(tidy) <- gsub(pattern = "BodyBody", replacement = "Body", names(tidy))
names(tidy) <- gsub(pattern = "Mag", replacement = "_Magnitude", names(tidy))
names(tidy) <- gsub(pattern = "tBody", replacement = "TimeBody", names(tidy))
names(tidy) <- gsub(pattern = "Jerk", replacement = "_Jerk", names(tidy))
names(tidy) <- gsub(pattern = "Time", replacement = "Time_", names(tidy))
names(tidy) <- gsub(pattern = "Frequency", replacement = "Frequency_", names(tidy))


grouped_avg <- tidy %>% group_by(Individuals, Codes) %>% summarise_all(funs(mean))
result <- select(grouped_avg, Individuals, Codes, contains("mean"))
