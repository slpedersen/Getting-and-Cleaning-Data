# README.md

# Project To Create A Tidy Dataset
## Getting and Cleaning Data
## April 2015
## README file explaining how to run run_analysis.R script

## Introduction

These are the instructions to create a tidy data set using the R script run_analysis.R .

This script was produced and tested on a Windows 7 machine using R 3.1.2, RStudio 0.98.1087 and packages dplyr 0.4.1 and tidyr 0.2.0 .

## Preparation

The run_analysis.R script uses input data found in the "UCI HAR Dataset" folder within the working directory.  The data can be downloaded and unzipped into the correct folder as follows.  The original folder structure within "UCI HAR Dataset" is preserved:

```
#
# get data
# 

# data source
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# zip file destination
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# download zipped data
download.file(fileurl, destfile = filename, method = "auto", mode = "wb")

# unzip data
unzip(filename)
```

## Running the script

Open and run_analysis.R in R or RStudio.  This will:
* Load the dplyr and tidyr libraries.
* Read in the required input data.
* Transform it into the tidy data set (variable name "tidy_data") in memory.

The tidy dataset has four columns (subject, activity, feature, meanValue).  See the codebook (CodeBook.md) for more information.

## Tidy dataset

A copy of the tidy dataset has been submitted with this project on the course project submission page.  The file was produced after running the run_analysis.R script by running the following command:
```
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
```

## Verifying the tidy data set
To read the submitted tidy dataset into R or RStudio, save it from the course project submission page into a file (e.g. "tidy_data.txt").  Then run the following R command:
```
test_data <- read.table("tidy_data.txt", header = TRUE)
```
