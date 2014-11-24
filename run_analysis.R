
run_analysis <- function() {

wd<-getwd()
  print(wd)
#loading train data
  train <- read.table("UCIHARDataset/train/X_train.txt", header=FALSE)
#paste(directory, "UCIHARDataset/train/X_train.txt", header=FALSE)
  ytrain <- read.table("UCIHARDataset/train/y_train.txt", header=FALSE)
  strain <- read.table("UCIHARDataset/train/subject_train.txt",header=FALSE)

  print("train loaded ...");

#loading test data
  test <- read.table("UCIHARDataset/test/X_test.txt", header=FALSE)
  stest <- read.table("UCIHARDataset/test/subject_test.txt",header=FALSE)
  ytest <- read.table("UCIHARDataset/test/y_test.txt",header=FALSE)

  print("test loaded ...");

  data<-rbind(train, test)

  print("combined ...")

#get descriptive names from feature.txt
  features <- read.table("UCIHARDataset/features.txt")
  i<-sapply(features, is.factor)
  tmp<-lapply(features[i], as.character)
  n<-make.names(tmp$V2)

#change the combined data column names
  colnames(data)<-n

#adding activity and subject data
  activity<-rbind(ytrain,ytest)
  subject<-rbind(strain, stest)
  data$activity<-activity$V1
  data$subject<-subject$V1

#std and mean column
  stdcol<-grep("std", names(data), ignore.case=TRUE, value=TRUE)
  grep("mean", names(data), ignore.case=TRUE)
  x<-append(stdcol,meancol)

  newdata<-data[,x]

  data$activity_label<-"WALKING"
  data$activity_label[data$activity == 1]<-"WALKING"
  data$activity_label[data$activity == 2]<-"WALKING_UPSTAIRS"
  data$activity_label[data$activity == 3]<-"WALKING_DOWNSTAIRS"
  data$activity_label[data$activity == 4]<-"SITTING"
  data$activity_label[data$activity == 5]<-"STANDING"
  data$activity_label[data$activity == 6]<-"LAYING"

  newdata$activity<-data$activity_label
  newdata$subject<-data$subject

# initialize a temporary data frame
  sumdata <- aggregate(newdata[,3] ~ subject + activity, data = newdata, FUN = 'mean')

#calculate the means for each column
  for (i in 4:ncol(newdata)) {
    sumdata[,i] <- aggregate(newdata[,i] ~ subject + activity, data = newdata, FUN = 'mean')[,3]
  }

# renames the columns to the descriptive name
  colnames(sumdata) <- colnames(newdata)

  write.table(sumdata, file="tidydata.txt")
}
