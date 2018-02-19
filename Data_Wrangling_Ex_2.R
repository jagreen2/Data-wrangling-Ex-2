# Add packages

# Import CSV file

# Run a summary on the embarked column to find 3 missing values
summary(tnc$embarked)

# View the structure of the data to determine that embarked contains a factor with 4 levels
str(tnc)

# Convert embarked column to characters
tnc$embarked <- as.character(tnc$embarked)

# Assign the value "S" to the 3 missing values
tnc$embarked[tnc$embarked==""] <- "S"

# Convert embarked column back to a factor, now of only 3 levels
tnc$embarked <- as.factor(tnc$embarked)

# Run a summary of the age column to determine it has 264 NA values
summary(tnc$age)

# Convert 264 NAs in age column to mean of age
tnc$age <- ifelse(is.na(tnc$age), mean(tnc$age, na.rm=TRUE), tnc$age)

# Convert boat column from factor to string
tnc$boat <- as.character(tnc$boat)

# Replace missing values with "None"
tnc$boat[tnc$boat==""] <- "None"

# Create a new column, cabin_presence, to store 1 if passenger had a cabin and 0 otherwise
tnc$cabin_presence <- ifelse(tnc$cabin == "", 0,1)

# Output data frame to a csv file
write.csv(tnc, "titanic_clean.csv")





