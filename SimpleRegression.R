# Assuming your dataset is named 'heart'
# Fit the simple regression model
simple_model <- lm(heart.disease ~ biking, data = heart)
# Display the summary of the regression model summary(simple_model)
# Make predictions
predictions <- predict(simple_model, newdata = heart)
# Visualize the relationship
plot(heart$biking, heart$heart.disease, main = "Simple Regression",
xlab = "Biking", ylab = "Heart Disease", col = "blue") 
abline(simple_model, col = "red")
