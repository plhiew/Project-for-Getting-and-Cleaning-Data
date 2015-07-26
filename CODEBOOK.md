# CodeBook

This document describes the process of getting and cleaning the data as well as the data in the tidy data set.


## Data Cleaning and Transformation Process

1. Download the zip file containing the data set from  [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

2. Unzip the downloaded file to the default working directory of the R environment retaining the original directory structure and file names of the extracted files. 

3. Merge the training and the test sets:
    + "./test/subject_test.txt" with "./train/subject_train.txt"
    + "./test/X_test.txt" with "./train/X_train.txt"
    + "./test/y_test.txt" with "./train/y_train.txt"

4. Extract only the measurements on the mean and standard deviation for each measurement. 

5. Use descriptive activity names to name the activities in the data set. The activity names are "Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", and "Laying"

6. Appropriately labels the data set with descriptive variable names by clean up the names of the variables by removing "()" and transformaing variables names to human readable versions. 

7. Combine the data sets produced in step 3 and step 4 into on tidy data set.

8. Creates a second independent tidy data with the average of each variable for each activity and each subject from the data set produced in step 7.

9. Save the tidy data set produced in step 8 into a text file named "average_by_subject_by_activity.txt" in a tabular format onto the current working directory.


## Results
#### Summary

The resulting 180 X 68 data frame for the average of by subject by activity has the following dimensions:

* 180 rows / observations (30 Subjects X 6 Activities)    
* 68 columns / variables (Subject, Activity, 66 feature means or standard deviations)    


#### Variables and Units

Variable             | Description
-------------        | ------------------------------------------------------------
Subject            | A number between 1 and 30 identifying the subject who performed the activity for each window sample.    
Activity          | The activity name, 1 of 6 possibilities between "Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", and "Laying"
Col 3 to 68       | Means or Standard Deviations calculated from the raw data set grouped by subject and by activity


#### Column indices and variable names 
1. "Subject"                                                      
2. "Activity"                                                     
3. "TimeDomainBodyAccelerometer-mean-X-Axis"                      
4. "TimeDomainBodyAccelerometer-mean-Y-Axis"                      
5. "TimeDomainBodyAccelerometer-mean-Z-Axis"                      
6. "TimeDomainBodyAccelerometer-StandardDeviation-X-Axis"         
7. "TimeDomainBodyAccelerometer-StandardDeviation-Y-Axis"         
8. "TimeDomainBodyAccelerometer-StandardDeviation-Z-Axis"         
9. "TimeDomainGravityAccelerometer-mean-X-Axis"                   
10. "TimeDomainGravityAccelerometer-mean-Y-Axis"                   
11. "TimeDomainGravityAccelerometer-mean-Z-Axis"                   
12. "TimeDomainGravityAccelerometer-StandardDeviation-X-Axis"      
13. "TimeDomainGravityAccelerometer-StandardDeviation-Y-Axis"      
14. "TimeDomainGravityAccelerometer-StandardDeviation-Z-Axis"      
15. "TimeDomainBodyAccelerometerJerk-mean-X-Axis"                  
16. "TimeDomainBodyAccelerometerJerk-mean-Y-Axis"                  
17. "TimeDomainBodyAccelerometerJerk-mean-Z-Axis"                  
18. "TimeDomainBodyAccelerometerJerk-StandardDeviation-X-Axis"     
19. "TimeDomainBodyAccelerometerJerk-StandardDeviation-Y-Axis"     
20. "TimeDomainBodyAccelerometerJerk-StandardDeviation-Z-Axis"     
21. "TimeDomainBodyGyroscope-mean-X-Axis"                          
22. "TimeDomainBodyGyroscope-mean-Y-Axis"                          
23. "TimeDomainBodyGyroscope-mean-Z-Axis"                          
24. "TimeDomainBodyGyroscope-StandardDeviation-X-Axis"             
25. "TimeDomainBodyGyroscope-StandardDeviation-Y-Axis"             
26. "TimeDomainBodyGyroscope-StandardDeviation-Z-Axis"             
27. "TimeDomainBodyGyroscopeJerk-mean-X-Axis"                      
28. "TimeDomainBodyGyroscopeJerk-mean-Y-Axis"                      
29. "TimeDomainBodyGyroscopeJerk-mean-Z-Axis"                      
30. "TimeDomainBodyGyroscopeJerk-StandardDeviation-X-Axis"         
31. "TimeDomainBodyGyroscopeJerk-StandardDeviation-Y-Axis"         
32. "TimeDomainBodyGyroscopeJerk-StandardDeviation-Z-Axis"         
33. "TimeDomainBodyAccelerometerMag-mean"                          
34. "TimeDomainBodyAccelerometerMag-StandardDeviation"             
35. "TimeDomainGravityAccelerometerMag-mean"                       
36. "TimeDomainGravityAccelerometerMag-StandardDeviation"          
37. "TimeDomainBodyAccelerometerJerkMag-mean"                      
38. "TimeDomainBodyAccelerometerJerkMag-StandardDeviation"         
39. "TimeDomainBodyGyroscopeMag-mean"                              
40. "TimeDomainBodyGyroscopeMag-StandardDeviation"                 
41. "TimeDomainBodyGyroscopeJerkMag-mean"                          
42. "TimeDomainBodyGyroscopeJerkMag-StandardDeviation"             
43. "FrequencyDomainBodyAccelerometer-mean-X-Axis"                 
44. "FrequencyDomainBodyAccelerometer-mean-Y-Axis"                 
45. "FrequencyDomainBodyAccelerometer-mean-Z-Axis"                 
46. "FrequencyDomainBodyAccelerometer-StandardDeviation-X-Axis"    
47. "FrequencyDomainBodyAccelerometer-StandardDeviation-Y-Axis"    
48. "FrequencyDomainBodyAccelerometer-StandardDeviation-Z-Axis"    
49. "FrequencyDomainBodyAccelerometerJerk-mean-X-Axis"             
50. "FrequencyDomainBodyAccelerometerJerk-mean-Y-Axis"             
51. "FrequencyDomainBodyAccelerometerJerk-mean-Z-Axis"
52. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation-X-Axis"
53. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation-Y-Axis"
54. "FrequencyDomainBodyAccelerometerJerk-StandardDeviation-Z-Axis"
55. "FrequencyDomainBodyGyroscope-mean-X-Axis"                     
56. "FrequencyDomainBodyGyroscope-mean-Y-Axis"                     
57. "FrequencyDomainBodyGyroscope-mean-Z-Axis"                     
58. "FrequencyDomainBodyGyroscope-StandardDeviation-X-Axis"        
59. "FrequencyDomainBodyGyroscope-StandardDeviation-Y-Axis"        
60. "FrequencyDomainBodyGyroscope-StandardDeviation-Z-Axis"        
61. "FrequencyDomainBodyAccelerometerMag-mean"                     
62. "FrequencyDomainBodyAccelerometerMag-StandardDeviation"        
63. "FrequencyDomainBodyBodyAccelerometerJerkMag-mean"             
64. "FrequencyDomainBodyBodyAccelerometerJerkMag-StandardDeviation"
65. "FrequencyDomainBodyBodyGyroscopeMag-mean"                     
66. "FrequencyDomainBodyBodyGyroscopeMag-StandardDeviation"        
67. "FrequencyDomainBodyBodyGyroscopeJerkMag-mean"                 
68. "FrequencyDomainBodyBodyGyroscopeJerkMag-StandardDeviation"    


__References__

1. "features_info.txt"" included with the original dataset
2. README.md in this repository

