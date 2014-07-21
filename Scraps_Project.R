setwd("/Users/fenstjj1/MBA/R project (non Twitter)/PracMachLearn/")

require(caret)
'%!in%' <- function(x,y)!('%in%'(x,y))
is.blank <-function(x) (x == "")

training = read.delim(file = "pml-training.csv",sep=",")
attach(training)
training = training[ ,colnames(training) %!in% c("X",
                                                 "raw_timestamp_part_1",
                                                 "raw_timestamp_part_2",
                                                 "cvtd_timestamp",
                                                 "new_window",
                                                 "num_window")]

keep1=names(training)[(colSums(is.na(training)/nrow(training))<.1)]
training=training[ ,keep1]

keep2=names(training)[(colSums(is.blank(training)/nrow(training))<.1)]
training=training[, keep2]

featurePlot(x=training[, c("roll_belt","pitch_belt","yaw_belt")],
            y=training[,"classe"],plot="pairs")