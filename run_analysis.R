
setwd("F:/1-DataScientistCertification/GettingandCleaningData/PeerAssessmentAsgnmnt/test/UCI HAR Dataset")


y_train <- read.table("train/y_train.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")

subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

X_train <- read.table("train/X_train.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")


colnames(activity_labels)<- c("V1","Activity")

#to merge the y_train with the activity label
subject<- rename(subject_train, subject=V1)
train<- cbind(y_train,subject)
train1<- merge(train,activity_labels, by=("V1"))

colnames(X_train)<- features[,2]

train2<- cbind(train1,X_train)

# Eliminate the train2 1st column in order to avoid error "duplicate column name"

train3<- train2[,-1]

#to select only the columns that contains means and standard deviation

train4<- select(train3,contains("subject"), contains("Activity"), contains("mean"), contains("std"))


#Analysis of the Volunteer select for generating the test data

colnames(activity_labels)<- c("V1","Activity")

#merge the y_test with the activity label

subjecta<- rename(subject_test, subject=V1)
test<- cbind(y_test,subjecta)
test1<- merge(test,activity_labels, by=("V1"))


colnames(X_test)<- features[,2]

#Combining y_test, activity labels, X_test

test2<- cbind(test1,X_test)


# Eliminate the train2 1st column in order to avoid error "duplicate column name"
test3<- test2[,-1]

#select only the columns that contains means and standard deviation
test4<- select(test3,contains("subject"), contains("Activity"), contains("mean"), contains("std"))



# Combining Train data with Test data
run_analysis1<- rbind(train4,test4)


#Summary of data and produce TIDYDATA.txt


run_analysis<- (run_analysis1%>%
                  group_by(subject,Activity) %>%
                  summarise_each(funs( mean)))

print(run_analysis)

write.table(run_analysis,"TIDYDATA.txt",sep=" ",row.name=FALSE) 


