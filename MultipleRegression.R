# Install and load necessary libraries install_and_load <- function(package_name) {
if (!requireNamespace(package_name, quietly = TRUE)) { install.packages(package_name)
}
library(package_name, character.only = TRUE) }
# Install and load libraries install_and_load("ggplot2")
 install_and_load("dplyr")
# Assuming your dataset is named 'heart'
# Replace 'heart' with the actual name of your dataset if it's different
# Fit the multiple regression model
model <- lm(heart.disease ~ biking + smoking, data = heart)
# Display the summary of the regression model summary(model)
# Check assumptions par(mfrow = c(2, 2)) plot(model)
# Make predictions
predictions <- predict(model, newdata = heart)
# Visualize actual vs. predicted values
ggplot(heart, aes(x = heart.disease, y = predictions)) +
geom_point() +
geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") + labs(title = "Actual vs. Predicted Values", x = "Actual", y = "Predicted")
# Residual analysis residuals <- residuals(model)
# Visualize residuals
ggplot(heart, aes(x = heart.disease, y = residuals)) +
geom_point() +
geom_hline(yintercept = 0, color = "red", linetype = "dashed") + labs(title = "Residual Analysis", x = "Fitted values", y = "Residuals")
# Scatterplot Matrix
pairs(heart[, c("heart.disease", "biking", "smoking")], main = "Scatterplot Matrix")
# Residuals vs. Fitted Values Plot
plot(model, 1, main = "Residuals vs. Fitted Values", col = "blue") abline(h = 0, col = "red", lty = 2)
# Check normality of residuals qqnorm(residuals) qqline(residuals)

# Check homoscedasticity plot(model, which = 3)
# Check for multicollinearity
cor(heart[, c("heart.disease", "biking", "smoking")])
# Perform hypothesis tests on coefficients
summary(htest <- coef_test(model, hypothesis = "biking = 0"))
