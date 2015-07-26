# Project for Getting and Cleaning Data

This document describes the contents of this repository. It provides instructions on how to setup the environment for running the R script to transform the raw data set specified
in the [Course Project](https://class.coursera.org/getdata-030/human_grading/view/courses/975114/assessments/3/submissions) into a tidy data set.


## Content of repository

Filename       | Description
-------------  | ------------------------------------------------------------
README.md      | Describes the process of getting and cleaning the data
CODEBOOK.md    | Describes the variables within the tidy dataset submitted
run_analysis.R | R Script used for performing the data cleaning

## Setup
Before running the script, please ensure that:

1. The R environment is installed. Instruction is available [here](https://cran.r-project.org/doc/manuals/R-admin.html).

2. The data has been [downloaded](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

3. The data has been unzipped to the default working directory of your R environment and the directory structure and file names of the extracted files follows that of the origin ZIP file. 

4. The default data directory is "UCI_HAR_Dataset", and within it, in your R environment on LINUX or MAC, you should see something similar to this:
```{r}
> dir()
[1] "activity_labels.txt" "features_info.txt"   "features.txt"        "README.txt"         
[5] "test"                "train"              
```

## Steps

1. Copy the R script "run_analysis.R" into the data directory "UCI_HAR_Dataset". 

2\. Set your working directory to the data directory.
```{r}
> setwd("<your default working directory>/UCI_HAR_Dataset")
```

3\. You should see the following directory listing:
```{r}
> dir()
[1] "activity_labels.txt" "features_info.txt"   "features.txt"        "README.txt"         
[5] "run_analysis.R"      "test"                "train"              
```

4\. Source the R script named "run_analysis.R".
```{r}
> source("./run_analysis.R"))
```

5\. Once the R script has completed running, you will see a file named "average_by_subject_by_activity.txt" in your working directory. 
```{r}
> dir()
[1] "activity_labels.txt"                "average_by_subject_by_activity.txt"
[3] "features_info.txt"                  "features.txt"                      
[5] "README.txt"                         "run_analysis.R"                    
[7] "test"                               "train"                             
```

6\. To read the file into R for future/further processing, please use the following command:
```{r}
> read.table("average_by_subject_by_activity.txt", header = TRUE)
```



__References:__

1. Getting and Cleaning Data Course Project [Assignment Page](https://class.coursera.org/getdata-030/human_grading/view/courses/975114/assessments/3/submissions).
