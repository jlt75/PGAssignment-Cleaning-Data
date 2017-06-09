# PGAssignment-Cleaning-Data
README.md


Analysis File from Samsung Data
V 1.0 


##############################  Step 1 ##################

upload, unzip folder and read files within
Merge train and test data without any computation
train = 7352 obs. of 561 variables
test  = 2947 obs. of 561 variables
Total = 10299 obs. of 561 variables




##############################  Step 2 ##################
Read from "features.txt" the 561 names/description of variable and convert it in charactere (coercion)
Select names which contains  the word "mean" or "std"
Select all corresponding colones in  the Total dataset 




##############################  Step 3 ##################
Merge train and test Activities without any computation
(files " y_train.txt" and "y_test.txt") 
## order train and test is crucial
#each row contain the activity ofthe equivalent row of the Total Dataset

from "activity_labels.txt" which contains labels of the 5 activities, substitute in the Total Dataset 
the index of activity by the equivallent label



##############################  Step 4 ##################
Rename first colone in Activity and others using the selected names from step 2





##############################  Step 5 ##################
Merge train and test Subjects without any computation
(files " subject_train.txt" and "subject_test.txt") 
## order train and test is crucial
#each row contain the subject of the equivalent row of the Total Dataset


add subject as first colone of Total Dataset, with the name of row "subject"

(l)apply the  mean function  for each variable, ordered by avtivity and subject.  

Write the result in an file named "TidyMean.txt" in the folder "PGAssignW4"



###########################################################

