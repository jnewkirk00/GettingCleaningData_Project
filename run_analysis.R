## Script is designed to prepare Samsung data in accordance with the instructions

## Complete key steps that apply to both test and training data
## Going to use setnames of data.table package
require(data.table)
require(reshape2)
## Get desciptions for activities
act <- read.table("activity_labels.txt")
## Get description for the features. use to make labels for the "X" file columns.
feat <- read.table("features.txt")

## Step 1
## First read in all necessry data.

## Note that directions say this should run so long
## as Samsung data is in the working directory. I have interpreted this to mean that
## each file is in the working directory (not in the original folder structure)

## Read in the "y" file for test data. this file has the activity code
ytest <- read.table("y_test.txt")
## Same but now for train data.
ytrain <- read.table("y_train.txt")

## Read in the "X" file for test data. this file has 561 data elements that measure activity
xtest <- read.table("X_test.txt")
## Same but now for train data.
xtrain <- read.table("X_train.txt")

## Read in the test subjects
subjtest <- read.table("subject_test.txt")
## Same but now for train data.
subjtrain <- read.table("subject_train.txt")

## Now merge the pairs using rbind
y <- rbind(ytest, ytrain)
X <- rbind(xtest, xtrain)
subj <- rbind(subjtest, subjtrain)

## Step 2
## Extract only mean and std variables. Keep all columns that contain mean or std at
## any location. Instructions say exact column count doesn't matter
meancols <- grep("mean", feat$V2, ignore.case=TRUE)
stdcols <- grep("std", feat$V2, ignore.case=TRUE)
cols <- c(meancols, stdcols)

## use the vector of mean and std cols to subset the original data.table
X <- X[, cols]

## Step 3
## Bring in the activity labels as factors
y$mapped <- factor(y$V1, labels=act$V2)
## Add this to the eventual resultant data.table
X$Activity <- y$mapped

## Step 4
## Label the dataset
## use setnames from the data.table package to label the activity measurements
setnames(X, c(as.character(feat$V2[cols]), "Activity"))

## I don't think this was asked for, but I am identifying the subject too.
## It is needed in Step 5
## Identify the subjects
X$Subject <- subj$V1

## Step 5
## Melt the data and recognize that Subject and Activity are the id variables and the rest are measure
## variables
meltX <- melt(X, id=c("Subject", "Activity"))
## Now use dcast to bring to group by all combinations of Activity and Subject and calculate the mean
sumX <- dcast(meltX, Subject + Activity ~ variable, mean)
write.table(sumX, file="summarizedBySubjectActivity.txt", row.name=FALSE)
