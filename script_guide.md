# Script 'run_Analysis.r' guide

This document explains how the 'run_Analysys.r' script works.

The script creates the Second_tidy_dataset.txt file.

1.The first thing is to read the required data from the train and test sets. For this we must read into R 
“the ‘X’, ’Y’ and ‘Subject’ data for both sets mentioned above.

*The data for 'Features' and 'Activity' are also loaded into R.
* _It is important to note that the complete dataset is created later in the script._

2. Once the data is loaded into R, the script merges the train and test sets for each of the types of data into a single data frame for each type (Xset, Yset, Subjectset).

3.-Next, from the Xset we subset only the columns that contain 'mean()' and 'std()' in the title and remove the other variables.

4. We replace the values of the Yset with the corresponding name of the activity stored in the 'activity' data frame.

5. We extract the from the 'Features' data frame the names of the variables and store them in the 'descriptivenames' variable and then assign these values to the names of the 'Xset'.

6. __Right after this, we merge the 'subjectset', 'Yset' and 'Xset' into a single data frame called 'completedata'__.

7. For the following step we must first load the 'data.table' package and right after We convert the 'completedata' data frame into a table.

8. Finally, we create the 'secondset' table by estimating the means of each variable by subject ID and Activity.
