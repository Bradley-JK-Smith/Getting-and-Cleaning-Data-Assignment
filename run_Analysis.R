library(plyr)

readData <- function(type, setName='') {
        if( setName == '' ) {
                fileName <- paste0('UCI HAR Dataset/', type, '.txt')
        } else {
                fileName <- paste0('UCI HAR Dataset/', setName, '/', type, '_', setName, '.txt')
        }
        x <- read.csv(fileName, header=FALSE, sep = '', stringsAsFactors=FALSE)
}

features_list <- readData('features')
labels_list <- readData('activity_labels')
colnames(labels_list) <- c('activity_id', 'activity_name')

idf <- grep('-mean\\(\\)|-std\\(\\)', features_list[,2])
features_names <- gsub('\\(\\)', '', features_list[idf,2])
features_names <- gsub('^t', 'time_', features_names)
features_names <- gsub('^f', 'frequency_', features_names)
idx <- grep('-mean', features_names)
features_names[idx] <- paste0('mean_', features_names[idx])
idx <- grep('-std', features_names)
features_names[idx] <- paste0('std_', features_names[idx])
features_names <- gsub('-mean|-std', '', features_names)

res <- NULL
for( type in c('test', 'train')) {
        subject <- readData('subject', type)
        y <- readData('y', type)
        x <- readData('x', type)
        # Bind the data together BEFORE merging (otherwise cannot control order)
        res <- rbind(cbind(type, subject, y, x[,idf]))
}
colnames(res) <- c('set_type', 'subject_id', 'activity_id', features_names)

z <- merge(labels_list, res, by='activity_id')

idx <- order(z[,'subject_id'], z[,'activity_name'], z[,'set_type'])
# Re-order and drop the activity_id
z <- z[idx,-1]

write.csv(z, 'tidy_data.csv', row.names=FALSE)

zz <- ddply(z, .(subject_id, activity_name), function(x) colMeans(x[,features_names]))

write.csv(zz, 'tidy_summary.csv', row.names=FALSE)
