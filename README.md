#Coursera: Getting and Cleaning Data Course Project

Human Activity Recognition Using Smartphone Dataset
Version 1

Raw data and full data described at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Summary:**
Thirty volunteers performed six activities wearing a smartphone on the waist.  The sensor signals were processed and 
a vector of features was obtained by calculating variables from the time and frequency domain.  The data was randomly 
sectioned into test and training subjects.  

The dataset used for this project is fixed at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the data and set the working directory to the directory of the unzipped data, UCI HAR Dataset.
Running the run_analysis.R script without any parameters will return a tidy data set which shows the average of each 
variable for each activity and each subject.



**To View the data:**
Set the working directory to the UCI HAR Dataset and enter:

    data<-read.table(“TidyMeanOfVariables.txt”, header=TRUE)
    View(data)





###License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
