library(devtools)
library(fs)
#step 0
# create_package("Path of Package Folder")

#step 1
use_r("fbind.R")

# step 2
load_all()

#step 3
check()
