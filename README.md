# Getting and Cleaning Data - Human Activity Recognition
1. Download and extract the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
to "UCI HAR Dataset" folder
2. Install dplyr package
3. Download and load run_analysis.R to RStudio.
4. Pass the path to "UCI HAR Dataset" folder to the TidySamsungData function. E.g "C:/UCI HAR Dataset"
5. The function returns a tidy dataset and creates a tidyData.txt in the directory given.

#Analysis Steps
1. Read test,training,subject,features and activity files to R
2. Rename test data set variables with proper names from features file.
3. Add activity and subject variables to the test data set
4. Rename training data set variables with proper names from features file.
5. Add activity and subject variables to the training data set
6. Combine training and test data sets
7. Extract only columns with mean and STD in to new data set
8. Use descriptive activity names to name the activities in the data set
9. Group the combined data set by subject and activity.
10. Create a new data set by the mean of the remaining variables 
11. Write the findal tidy data to file.
