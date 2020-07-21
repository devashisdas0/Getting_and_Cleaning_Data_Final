# Code Book

**Data** 
1. The initial data set can be downloaded from the following [LINK](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. The dataset contains 8 text files that need to be downloaded and merged
  * features.txt
  * activity_labels.txt
  * training sets for x, y, and subjects
  * testing sets for x, y, and subjects

**Transformations**
1. Combine by rows test and train sets for x, y, and subjects using rbind
2. Combine these three datasets toegther using cbind so all the columns are together, the resulting dataset is 10,299 rows and 563 columns
3. Only select the combined dataset's individuals, activity code, and columns containing meaning or standard  deviation values
4. Rename columns so that the name makes more sense by replacing the shortended version of words with the full versions

**Final Results**
1. From the cleaned version of the table listed at the end of transformation, group the data by the subject and activity code so that each individual 
can be seen with their 6 values
2. The mean can then be found across each individual
3. The final table has 180 rows and 88 columns
