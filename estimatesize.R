# Estimating the size of memory required to load the object
# using a sample set and object.size command
# higher the number of rows in the sample set, closer the estimate

# Getting the sample size of the file
# Skipping the header row eliminates the characters
# sampling the size of 1000 rows, we know that seperator is ";" and NA character is "?"
# Estimate size is an extrapolation of the head size to the actual number of rows (2075259) 

estsize <- format(object.size(read.table("household_power_consumption.txt", skip = 1, nrow=1000,na.strings = "?",sep = ";")) * 2075259 / 1000,units = "auto")


