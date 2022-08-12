# Load Libraries --------------------
library(data.table)      # Extension of 'data.frame'
library(tidyverse)       # Data wrangling and visualization
library(rpart)           # Regression trees
library(pROC)            # Receiver-operator curves
library(scales)          # Scale Functions for Visualization

# Set working directory
setwd("C:/Users/marte/OneDrive/Desktop")
getwd() # make sure working directory is set to desktop
home.path = getwd()
print(home.path)
wrkngDir<-file.path(home.path, "Final Project")

# Set seed to 1
set.seed(1)

# Read in CSV file, must be read_csv2 because csv file is semicolon deliminated not comma.
train<-read_csv2(file.path(wrkngDir , "train.csv"))
test<-read_csv2(file.path(wrkngDir , "test.csv"))

# Summarize Training Data
summary(train)
str(test)

# Summarize Testing Data
summary(test)
str(test)

# Model training ------------
mod<-rpart(y ~ ., data=train, method="class")

#----------------------------------

# Plot decision tree
#png("decision-tree.png")
plot(mod)
text(mod, digits = 3)
#dev.off()

# View model summary
print(mod, digits = 2)
summary(mod)

# Evaluate with testing data ------------
# Add predictions to testing dataset
test$predicted <- predict(mod, test, type = "class")

# Accuracy
accuracy <- mean(test$y == test$predicted)
cat("Accuracy:", percent(accuracy/1.0, accuracy = 1))

# Confusion matrix (CM)
# Total 
cm <- table(test$y, test$predicted, dnn = c("Obs.", "Pred."))
cm

# CM as Probabilities
cm/nrow(test)

# Precision and Recall
tp <- cm[2,2]
fp <- cm[1,2]
tn <- cm[1,1]
fn <- cm[2,1]

precision <- tp / (tp + fp)
cat("precision:", precision)
recall <- tp / (tp + fn)
cat("recall:", recall)

f1 <- 2*(recall * precision) / (recall + precision)

# ROC curve  -----------------------
# Get prediction probabilities
predict_prob <- predict(mod, test, type = "prob")[,2]
print(predict_prob)

# Calculate ROC curve using pROC package
mod_roc <- roc(test$y, predict_prob)

# Plot with ggplot
ggroc(mod_roc) +
  geom_segment(aes(x = 1, xend = 0, y = 0, yend = 1), linetype="dashed") +
  annotate("text",label = paste("AUC:",round(auc(mod_roc), 3)), x = 0.7, y=0.5) +
  labs(title = "Decision tree model performance",
       y = "True positive rate",
       x = "False positive rate") +
  theme_minimal()
ggsave("ROC-plot.png", height = 5, width = 5)

# Area under curve
auc(mod_roc)