# GettingCleaningData_Project
Repository for class project

## Script
### Name: 
run_analysis.r

### Purpose: 
This script is designed to clean and prepare data associated with wearable device measurements - specifically the Samsung data described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The script combines multiple data sources and descriptive files to produce a single labeled data frame. This data frame is a subset of the original data and focuses on "mean" and "std" measure variables. The measure variables are associated with specific Subject(s) (people) and Activity(ies). The script further processes this data and groups it in the way instructed. The data frame is then written to an output files described below and in the CODEBOOK.

Please note that "mean" and "std" measure variables are identified by examing all available variables for names that include "mean" or "std" without applying case sensitivity. 

### Instructions:
This is a single script that runs on 8 wearable device data files obtained [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

In order for the script to run, the 8 data/descriptive files need to be saved in the working directory (extract from the folder structure of the source). These 8 files are also included in this repository.

Once the script is ran/sourced, the output file is generated.

### Output: 
The output of the script is a summary text file that groups wearable mean and std measurement data by Subject (person) and Activity (walking, standing, etc.).

The name of this output file is "summarizedBySubjectActivity.txt".