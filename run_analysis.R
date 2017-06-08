rm()


############################   Part 1  ################################################
# creat   directory, if not exist
if (!file.exists("PGAssignW4")) {
   dir.create("PGAssignW4")
}
#download datafile into Folder
myFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=myFile ,destfile="PGAssignW4/Dataset.zip")

#Unzip files 
zipF<- "PGAssignW4/Dataset.zip"
unZipDir<-"PGAssignW4"
unzip(zipF,exdir=unZipDir)

#read train and test files 
trainSet = read.table("PGAssignW4/UCI HAR Dataset/train/X_train.txt", header = FALSE)
testSet  = read.table("PGAssignW4/UCI HAR Dataset/test/X_test.txt", header = FALSE)


# Merge train + test 
MyData = rbind.data.frame(trainSet, testSet)


############################   Part 2  ################################################
#install.packages("stringr")
library(stringr)
#read labels of variables 
NamesOfVariables = read.table("PGAssignW4/UCI HAR Dataset/features.txt", header = FALSE)
#select labels with mean() or std()
Selection = str_detect(NamesOfVariables[,2], "mean()") | str_detect(NamesOfVariables[,2], "std()")

# keep only names of var within selection 
SelectedVar = as.character(NamesOfVariables[Selection,2])

############################   Part 3  ################################################
# Select colones (features) where Selection is TRUE
Result = MyData[,Selection]

#read train and test Activity files
trainActivities = read.table("PGAssignW4/UCI HAR Dataset/train/y_train.txt", header = FALSE)
testActivities  = read.table("PGAssignW4/UCI HAR Dataset/test/y_test.txt", header = FALSE)


# read activities labels
ActivitiesLabels = read.table("PGAssignW4/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Merge train + test Activities 
MyActivities = rbind.data.frame(trainActivities, testActivities)

# Add activities labels  to result 
MyActivities = merge(MyActivities, ActivitiesLabels, x.all = TRUE)
Result = cbind(MyActivities, Result)[-1]

############################   Part 4  ################################################

#Rename colones with explicit labels 
colnames(Result) = c("Activity", SelectedVar)

#Write Result as TidyData
write.csv(Result, file = "PGAssignW4/TidyData.csv")

############################   Part 5  ################################################

#read train and test Subject 
trainSubjects = read.table("PGAssignW4/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
testSubjects  = read.table("PGAssignW4/UCI HAR Dataset/test/subject_test.txt", header = FALSE)




# Merge train + test subjects 
MySubjects = rbind.data.frame(trainSubjects, testSubjects)
colnames(MySubjects) = "subject"

# add Subject as first Col. 
Result = cbind(MySubjects, Result)


# Compute the mean of each variable for each activity and each subject
install.packages("data.table")
library(data.table)
ResultMean = setDT(Result)[, lapply(.SD, mean), by = .(Activity, subject)] 

#Write ResultMean as TidyMean
write.table(ResultMean, file = "PGAssignW4/TidyMean.txt",row.names=FALSE)





