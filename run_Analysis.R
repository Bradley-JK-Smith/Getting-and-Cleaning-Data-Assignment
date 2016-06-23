library(plyr)

source('cat0.R')
source('readData.R')
source('writeData.R')

cat0('Run at', date())
cat0('Version:', R.version.string)

# Get activity labels
labels_list <- readData('activity_labels')
colnames(labels_list) <- c('activity_id', 'activity_name')

# Get features list
# Filter down to mean and standard deviation measurements
# Re-label names to make more readable
features_list <- readData('features')
idf <- grep('-mean\\(\\)|-std\\(\\)', features_list[,2])
features_names <- gsub('\\(\\)', '', features_list[idf,2])
features_names <- gsub('^t', 'time_', features_names)
features_names <- gsub('^f', 'frequency_', features_names)
idx <- grep('-mean', features_names)
features_names[idx] <- paste0('mean_', features_names[idx])
idx <- grep('-std', features_names)
features_names[idx] <- paste0('std_', features_names[idx])
features_names <- gsub('-mean|-std', '', features_names)

# Read in measurement data for test and train datasets
# There is no explicit 'id' column, the number of the row is the implicit
# label so these are column bound.
# Use the index defined earlier (idf) to filter down to required columns
allData <- NULL
for( type in c('test', 'train')) {
        subject <- readData('subject', type)
        y <- readData('y', type)
        x <- readData('x', type)
        # Bind the data together BEFORE merging (otherwise cannot control order)
        allData <- rbind(allData, cbind(type, subject, y, x[,idf]))
}
colnames(allData) <- c('set_type', 'subject_id', 'activity_id', features_names)

# Merge the labels information
mergeData <- merge(labels_list, allData, by='activity_id')

# Re-order based on the subject, activity name and set type as these are
# the control variables. Drop the activity id as the activity name is present
idx <- order(mergeData[,'subject_id'], mergeData[,'activity_name'], mergeData[,'set_type'])
tidyData <- mergeData[idx,-1]

# Output the tidy file
writeData(tidyData, 'tidy_data.csv')

# Calculate the second independent tidy data set with average of each variable
# for each activity and subject combination.
tidySummary <- ddply(tidyData, .(subject_id, activity_name), function(x) colMeans(x[,features_names]))

# Output the second independent tidy file
writeData(tidySummary, 'tidy_summary.csv')

cat0('Finished at', date())
