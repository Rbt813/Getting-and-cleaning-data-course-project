  ## Working directory has been set to: 
  ##"C:/Users/Toshiba/Documents/Coursera/Data Science/Getting and cleanng data/Week 4/Course project/Dataset/UCI HAR Dataset"
  ## Reading the files into R
  ## Reading 'test' data
  xtest<-read.table("test/X_test.txt")
  ytest<-read.table("test/y_test.txt")
  subjectest<-read.table("test/subject_test.txt")
  
  ## Reading 'train' data
  xtrain<-read.table("train/X_train.txt")
  ytrain<-read.table("train/y_train.txt")
  subjectrain<-read.table("train/subject_train.txt")
  
  ## Features
  features<-read.table("features.txt")
  activity<-read.table("activity_labels.txt")
  
  ## QUESTION 1: Merging training and test sets
  Xset<-rbind(xtest,xtrain)
  Yset<-rbind(ytest,ytrain)
  subjectset<-rbind(subjectest,subjectrain)
  
  ## QUESTION 2: Extracts only the measurements on the mean and standard deviation for each measurement.
  
  meansd<-grep("mean\\(\\)|std\\(\\)",features[,2])
  Xset<-Xset[,meansd]
  
  ## QUESTION 3: Uses descriptive activity names to name the activities in the data set
  Yset[,1]<-activity[Yset[,1],2]
  
  ## QUESTION 4: Appropriately labels the data set with descriptive variable names.
  descriptivenames<-features[meansd,2]
  names(Xset)<-descriptivenames
  names(subjectset)<-"SubjectId"
  names(Yset)<-"Activity"
  
  completedata<-cbind(subjectset,Yset,Xset)

## QUESTION 5: From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
completedata<-data.table(completedata)
secondset<-completedata[,lapply(.SD,mean),by="SubjectId,Activity"]

write.table(secondset, file = "Second_tidy_dataset.txt",row.name=FALSE)
