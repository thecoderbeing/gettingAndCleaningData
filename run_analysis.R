
TidySamsungData<-function(directory){
        
        #Read files
        test<-read.table(paste(directory,"/test/X_test.txt",sep = ""),header = FALSE,sep = "")
        test_labels<-read.table(paste(directory,"/test/y_test.txt",sep = ""),header = FALSE,sep = "")
        subject_test<-read.table(paste(directory,"/test/subject_test.txt",sep = ""),header = FALSE,sep = "")
        train<-read.table(paste(directory,"/train/X_train.txt",sep = ""),header = FALSE,sep = "")
        train_labels<-read.table(paste(directory,"/train/y_train.txt",sep = ""),header = FALSE,sep = "")
        subject_train<-read.table(paste(directory,"/train/subject_train.txt",sep = ""),header = FALSE,sep = "")
        columns<-read.table(paste(directory,"/features.txt",sep = ""),header = FALSE)
        activity_lookup<-read.table(paste(directory,"/activity_labels.txt",sep = ""),header = FALSE)
        
        #Analyze test data
        
        test_df<-test
        columns$V2<-as.character(columns$V2)
        #Appropriately labels the data set with descriptive variable names. 
        colnames(test_df)<-columns$V2
        test_df<-cbind(activity=test_labels$V1,subject=subject_test$V1,test_df)
        
        #Analyze training data
        
        train_df<-train
        #Appropriately labels the data set with descriptive variable names. 
        colnames(train_df)<-columns$V2
        train_df<-cbind(activity=train_labels$V1,subject=subject_train$V1,train_df)
        
        #combine test and training data
        combined_data<-rbind(test_df,train_df)
        #Extract only the measurements on the mean and standard deviation for each measurement.
        combined_data_mean_std<-combined_data[,grepl("mean|std|activity|subject",names(combined_data))]
        
        
        
        #Use descriptive activity names to name the activities in the data set
        combined_data_mean_std$activity<-activity_lookup$V2[combined_data_mean_std$activity]
        library(dplyr)
        #group by subject and activity
        summary_data<-group_by(combined_data_mean_std,subject,activity)
        #tidy data set with the average of each variable for each activity and each subject.
        final_data<-summarise_all(summary_data,mean)
        
        #write the tidy data to text file
        write.table(final_data,row.names = FALSE,file = paste(directory,"/tidyData.txt",sep = ""))
        final_data
}
