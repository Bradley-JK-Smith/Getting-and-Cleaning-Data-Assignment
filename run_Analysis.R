library(plyr)

source('readData.R')

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
res <- NULL
for( type in c('test', 'train')) {
        subject <- readData('subject', type)
        y <- readData('y', type)
        x <- readData('x', type)
        # Bind the data together BEFORE merging (otherwise cannot control order)
        res <- rbind(cbind(type, subject, y, x[,idf]))
}
colnames(res) <- c('set_type', 'subject_id', 'activity_id', features_names)

# Merge the labels information
z <- merge(labels_list, res, by='activity_id')

# Re-order based on the subject, activity name and set type as these are
# the control variables. Drop the activity id as the activity name is present
idx <- order(z[,'subject_id'], z[,'activity_name'], z[,'set_type'])
z <- z[idx,-1]

# Output the tidy file
write.csv(z, 'tidy_data.csv', row.names=FALSE)

# Calculate the second independent tidy data set with average of each variable
# for each activity and subject combination.
zz <- ddply(z, .(subject_id, activity_name), function(x) colMeans(x[,features_names]))

# Output the second independent tidy file
write.csv(zz, 'tidy_summary.csv', row.names=FALSE)
