<head>The Data</head>

The dataset was split into several subsidiary files:

x_test.txt: contained the raw measurements and computed summaries for each observation, split from master data at 70%
x_training.txt: contained the raw measurements and computed summaries for each observation, split from master data 30%
subject_train.txt: contained the IDs for each subject observation assigned to TRAIN group
subject_test.txt: contained the IDs for each subject observation assigned to TEST group
y_train.txt: contained the coded activity values for each observation assigned to TRAIN group
y_test.txt: contained the coded activity values for each observation assigned to TEST group
activity_labels.txt: contained coded (1-6) values for activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) monitored in the experiment
features.txt: contained 561 variable names representing the both the measurements (in volts) and measurement summaries (also in volts)

Data Manipulation and Analysis Plan

An assumption is made that the user has downloaded and unzipped into the directory named "UCIHARDataset":
./run_analysis.R
./UCIHARDataset/activity_labels.txt
./UCIHARDataset/features.txt
./UCIHARDataset/test
./UCIHARDataset/train
