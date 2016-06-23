# Function to read in the UCI HAR Dataset
#
# Inputs:
#         type - type of input, either features, acitivity_labels, subject, X or Y
#         setName - either train or test to indicate the set name
#
# The structure of file is consistent so apply these in the read.csv

readData <- function(type, setName='') {
        if( setName == '' ) {
                fileName <- paste0('UCI HAR Dataset/', type, '.txt')
        } else {
                fileName <- paste0('UCI HAR Dataset/', setName, '/', type, '_', setName, '.txt')
        }
        cat0('\nReading from', fileName)
        x <- read.csv(fileName, header=FALSE, sep = '', stringsAsFactors=FALSE)
        cat0('Rows read in:', nrow(x))
        cat0('Columns read in:', ncol(x))
        return(x)
}
