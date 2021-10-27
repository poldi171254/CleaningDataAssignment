library(dplyr)
library(reshape2)


# read all required files
trainresult<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/X_train.txt",sep="",header = F)
trainlabel<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/y_train.txt",header = F)
trainsubject<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/train/subject_train.txt",header = F)
testresult<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/X_test.txt",header = F)
testlabel<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/y_test.txt",header = F)
testsubject<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/test/subject_test.txt",header = F)
activities<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/activity_labels.txt",header = F)
features<-read.table("~/RProjects/Getting and Cleaning Data/Assignment/UCI HAR Dataset/features.txt",header = F)

# populate column headers
testlabel$V1 <-factor(testlabel$V1, levels = activities$V1,labels = activities$V2)
trainlabel$V1<-factor(trainlabel$V1,levels = activities$V1,labels = activities$V2)
colnames(testlabel) <-c("activityID")
colnames(trainlabel)<-c("activityID")
colnames(trainsubject)<-c("subjectID")
colnames(testsubject) <-c("subjectID")
colnames(activities)<-c("activityID","activityType")
colnames(testresult) <-features$V2
colnames(trainresult)<-features$V2

# Merge labels and subjects with the result by column
testresult <-cbind(testresult, testlabel)
testresult <-cbind(testresult, testsubject)
trainresult<-cbind(trainresult,trainlabel)
trainresult<-cbind(trainresult,trainsubject)

#merge test and train by row
allresults<-rbind(trainresult,testresult)

# Only select Measurements on the mean and standard deviation
meansandsd<-select(allresults,contains("mean") | contains("sd") | contains("activityID") | contains("subjectID"))

# Meaningful names and labels
activity_names <- merge(meansandsd, activities, by = "activityID", all.x = TRUE)

# create tidy data set with the average of each variable for each activity and each subject.
meltedData <- melt(meansandsd, id = c("subjectID", "activityID"))
tidyData <- dcast(meltedData, subjectID + activityID ~ variable, mean)
write.table(tidyData,"cleanDataSet.csv",sep = "\t")


