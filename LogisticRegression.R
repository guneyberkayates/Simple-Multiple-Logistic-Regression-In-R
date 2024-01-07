# Load necessary libraries
install.packages("popbio")
library(popbio)

# Load the dataset
data(puffinbill)

# Display column names and a preview of the dataset
names(puffinbill)
print(puffinbill)

# Assign features to variables
sex <- puffinbill$sex
curlen <- puffinbill$curlen

# Apply encoding on the categorical column 'sex'
sexcode <- ifelse(sex == "F", 1, 0)
print(sexcode)

# Plot the observations
plot(curlen, jitter(sexcode, 0.15), pch = 19, xlab = "Bill Length (mm)", ylab = "Sex (0 - male, 1 - female)")

# Fit a generalized logistic regression model
model <- glm(sexcode ~ curlen, binomial)
summary(model)

# Explore the range of 'curlen' values
xv <- seq(min(curlen), max(curlen), 0.01)
summary(xv)

# Predict probabilities using the model
yv <- predict(model, list(curlen = xv), type = "response")
summary(yv)

# Plot the logistic regression curve
lines(xv, yv, col = "red")

# Display a frequency distribution of each category
logi.hist.plot(curlen, sexcode, boxp = FALSE, type = "count", col = "gray", xlabel = "Size")
