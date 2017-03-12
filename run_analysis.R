library(dplyr)
library(reshape2)

##Step 1: Merges the training and test sets to create one data set
voluntest <- read.table("./test/subject_test.txt", sep=" ")
activitytest <- read.table("./test/y_test.txt", sep=" ")
testfile = ("./test/x_test.txt")
testdata <- read.table(testfile, sep="",quote="")
datacolnames <- read.table("features.txt", sep=" ")
names(testdata) <- datacolnames[,2]
testrownames <-cbind(voluntest,activitytest)
names(testrownames) <- c("subject","activity")
tidytestdata <- cbind(testrownames, testdata)

voluntrain <- read.table("./train/subject_train.txt", sep=" ")
activitytrain <- read.table("./train/y_train.txt", sep=" ")
trainfile = ("./train/x_train.txt")
traindata <- read.table(trainfile, sep="",quote="")
names(traindata) <-datacolnames[,2]
trainrownames <-cbind(voluntrain,activitytrain)
names(trainrownames) <- c("subject","activity")

tidytraindata <- cbind(trainrownames,traindata)
mergedata <- rbind(tidytestdata,tidytraindata)

##Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement.
## My interpretation includes columns where mean and std are in the column names
appcol <- grep(c("mean|std"), names(mergedata))
submergedata <- mergedata[,c(1:2,appcol)]

##Step 3:  convert activity number to description of activity as identified in the activity_labels.txt file
activitylabels = read.table("activity_labels.txt",sep="")[,2]
submergedata[,2] <- factor(submergedata[,2], labels = activitylabels)

##Step 4:  Appropriately labels the data set with descriptive variable names
temp <- names(submergedata)
modcolnames <- gsub("()","",temp, fixed=TRUE) ## replaces the parenthesis
modcolnames <- gsub("-","",modcolnames, fixed=TRUE) ## replaces hyphen
modcolnames <- gsub("BodyBody","Body", modcolnames)
modcolnames <- gsub("mean", "Mean", modcolnames)
modcolnames <- gsub("std", "Std", modcolnames)
names(submergedata) <- modcolnames

##Step 5:  From the data in step 4, creates a second, independent tidy data set with the average of each variable for each activity
## and each subject.
tempmelt <- melt(submergedata, id=c("subject","activity")) ## creates a narrow table with subject and activity as the main identifiers
meanvalues <- dcast(tempmelt, subject + activity ~ variable, fun.aggregate=mean)  ## creates a wide table summarizing variables by mean
write.table(meanvalues, "TidyMeanOfVariables.txt", row.names=FALSE, quote=FALSE)
