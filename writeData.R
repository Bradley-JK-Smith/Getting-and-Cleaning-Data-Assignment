# Function to write out the data
#
# Inputs:
#         x - data to br written out
#         fileName - name of file
#
# The structure of file is consistent so apply these in the read.csv

writeData <- function(x, fileName) {
        cat0('\nWriting to', fileName)
        cat0('Rows written:', nrow(x))
        write.csv(x, fileName, row.names=FALSE)
}
