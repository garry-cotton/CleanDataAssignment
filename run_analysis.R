# Accesses the UCI HAR Dataset and returns an average value summary of the data by Activity and Subject in
#   long data format.

# data_directory (default : getwd()) : Top level directory for the UCI HAR Dataset. This should be the path to the UCI HAR
#   Dataset folder extracted from the zip file.
# arrange (default : TRUE) : Whether to arrange the returned summary data by Subject, Activity and Measure names.

get_summary_data <- function(data_directory = getwd(), arrange=TRUE)
{
  require(dplyr)
  require(tidyr)
  require(readr)
  
  # Get activity and feature names
  existing_folder = getwd()
  setwd(data_directory)
  features = as.character(read.table("features.txt")[,2])
  activities = read.table("activity_labels.txt", sep=" ", col.names=c("ActivityID", "ActivityName"))

  # Get test data
  suppressWarnings({test_data = readr::read_table("test\\X_test.txt", col_names=features)})
  test_data = test_data[,grep("mean\\(\\)|std\\(\\)", names(test_data))]
  test_activities = read.table("test\\y_test.txt", sep=" ", col.names="ActivityID")
  test_data = cbind(test_data, test_activities)
  rm(test_activities)
  
  test_subjects = readr::read_table("test\\subject_test.txt", col_names=FALSE)
  names(test_subjects) = "SubjectID"
  test_data = cbind(test_data, test_subjects)
  rm(test_subjects)
  
  # Get train data
  suppressWarnings({train_data = readr::read_table("train\\X_train.txt", col_names=features)})
  train_data = train_data[,grep("mean\\(\\)|std\\(\\)", names(train_data))]
  train_activities = read.table("train\\y_train.txt", sep=" ", col.names="ActivityID")
  train_data = cbind(train_data, train_activities)
  rm(train_activities)
  
  train_subjects = readr::read_table("train\\subject_train.txt", col_names=FALSE)
  names(train_subjects) = "SubjectID"
  train_data = cbind(train_data, train_subjects)
  rm(train_subjects)
  
  # Merge data sets
  full_data = dplyr::union_all(test_data, train_data)
  rm(list=c("test_data", "train_data"))
  full_data = merge(full_data, activities)
  dim_cols = c("SubjectID", "ActivityID", "ActivityName")
  metric_cols = setdiff(names(full_data), dim_cols)
  full_data = full_data[c(dim_cols, metric_cols)]
  
  # Variable renaming
  cols = names(full_data)
  cols = gsub("mean\\(\\)", "Mean", cols)
  cols = gsub("std\\(\\)", "StandardDev", cols)
  cols[grep("Mag-", cols)] = paste0(gsub("Mag-", "-", cols[grep("Mag-", cols)]), "-Magnitude")
  cols = gsub("Acc", "Acceleration", cols)
  cols = gsub("BodyBody", "Body", cols)
  cols = gsub("-", "_", cols)
  names(full_data) = cols
  metric_cols = setdiff(names(full_data), dim_cols)

  # Summarize data
  full_data = full_data %>% 
    gather_("Feature", "Value", metric_cols) %>% 
    group_by(SubjectID, ActivityName, Feature) %>% 
    summarize(AverageValue = mean(Value))
  
  # Split data between mean and std features and normalize feature names
  mean_data = full_data[with(full_data, grep("_Mean", Feature)),]
  mean_data = rename(mean_data, AverageMean = AverageValue)
  mean_data["Feature"] = with(mean_data, gsub("_Mean", "", Feature))

  std_data = full_data[with(full_data, grep("_StandardDev", Feature)),]
  std_data = rename(std_data, AverageStd = AverageValue)
  std_data["Feature"] = with(std_data, gsub("_StandardDev", "", Feature))
  
  # Re-merge
  full_data = merge(mean_data, std_data, by=c("SubjectID", "ActivityName", "Feature"))
  
  # Arrange if required
  if (arrange)
    full_data = arrange_(full_data, c("SubjectID", "ActivityName", "Feature"))
  
  # Reset working directory and return data
  setwd(existing_folder)
  return(full_data)
}
