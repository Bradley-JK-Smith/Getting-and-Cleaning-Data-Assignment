# Getting-and-Cleaning-Data-Assignment

## Set up

* Extract analysis scripts
** https://github.com/Bradley-JK-Smith/Getting-and-Cleaning-Data-Assignment
* Download zip file
** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract data to same location as run_analysis.R
** Must be a 'UCI HAR Dataset' folder in the same directory as run_analysis.R

## Running

* Run the run_analysis.R script with R version 3.2.1 (2015-06-18)
* Alternatively (on windows) double-click the run_Analysis.bat file
** This may require changing the path to the R bin directory

## Code structure

* run_Analysis.R
** This is the main analysis script.
** Reads in the data from the UCI HAR Dataset
** Combines the test and train data sets
** Extracts just mean and standard deviation measurements
** Replaces numeric activity id with descriptive activity name string
** Relabels variables to be more descriptive
** Writes out tidy data set
** Creates summary of tidy data set with average of variables over activity and subject
** Writes out summary of tidy data set

* readData.R
** Function to read in the data from the UCI HAR Dataset directory
** Echo back the filename, number of rows and number of columns

* writeData.R
** Function to write out the tidy data
** Echo back the filename, number of rows and number of columns

* cat0.R
** Simple function used with echoing lines