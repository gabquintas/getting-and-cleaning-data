filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

## Read all the files and save them in variables. Please note the Innertial Signals folder is not used

features <- read.table ("/Users/Gavrik/Downloads/UCI HAR Dataset/features.txt")
activity <- read.table ("/Users/Gavrik/Downloads/UCI HAR Dataset/activity_labels.txt")

x_train <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("/Users/Gavrik/Downloads/UCI HAR Dataset/test/subject_test.txt")

# Step 1

## Concatenate the data by row using rbind
sub <- rbind (sub_train, sub_test)
y <- rbind (y_train, y_test)
x <- rbind (x_train, x_test)

## Name the columns
colnames(sub) = "SubID"
colnames(y) = "ActID"
colnames(x) = features[,2]
colnames(activity) <-  c('ActID','ActType')

## Merge them all in one data frame
full_data <- cbind(sub,y,x)

## Create a variable with the column names
cnames  = colnames(full_data); 

# Step 2
## select columns whose name of features with ???mean()??? or ???std()???
filtered <- full_data[grepl("mean|std|ActID|SubID|-ActType", cnames)]
cnames = colnames(filtered)

#Step 3
## merge function can be used here to replace the 'ActID' column by the data in activity. Don't forget to update cnames
renamed <- merge(activity ,filtered, by ="ActID")
cnames = colnames (renamed)

#Step 4
## use gsub and keep updating the cnames variable with the new column names. In the end, just substitute in the data frame.
cnames = gsub("^t", "time", cnames)
cnames = gsub("^f", "frequency", cnames)
cnames = gsub("Acc", "Accelerometer", cnames)
cnames = gsub("Gyro", "Gyroscope", cnames)
cnames = gsub("Mag", "Magnitude", cnames)
cnames = gsub("BodyBody", "Body", cnames)

colnames(renamed) = cnames

#Step 5
## Make sure plyr is installed. Use aggregate to make your data tidy =D
tidy <-aggregate(. ~ActType + SubID, renamed, mean)
write.table(tidy, './tidy.txt',row.names=TRUE,sep='\t')

