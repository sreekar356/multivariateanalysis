data <- read.csv("data.csv")
str(data)
View(data)
data$Outcome <- as.factor(data$Outcome)

logmodel <- glm(Outcome~.,data,family = "binomial")
summary(logmodel)


split <- floor(0.66 * nrow(data))

set.seed(123)
train_Sample <- sample(seq_len(nrow(data)),size = split)
train <- data[train_Sample,]
test <- data[-train_Sample,]

log <- glm(Outcome~.,train,family = "binomial")
prediction <- predict(log,test,type = "link")

CM <- table(prediction,test$Outcome,dnn = c("Predicted","Actual"))