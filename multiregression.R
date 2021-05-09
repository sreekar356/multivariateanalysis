data <- read.csv("Factor-Hair-Revised.csv")
head(data)
tail(data)
dim(data)
str(data)
summary(data)
boxplot(data)
describe(data)
library(psych)
describe(data)
data$ID <- NULL
cor(data)
library(corrplot)
a <- cor(data)
corrplot(a,method = "number")
library(ppcor)
pcor(data,method = "pearson")
r <- lm(Satisfaction~.,data )
summary(r)
#variable inflation factor >2.5 multicollinearity is high
vif(r)
library(HH)
data$DelSpeed <- NULL
b <- lm(Satisfaction~.,data )
vif(b)
data$CompRes <- NULL
c <- lm(Satisfaction~.,data )
vif(c)
X <- data[,-c(1,13)]
Y <- data[,13]
Cor <- cor(X)
KMO(X)
# if MSA value >0.5 data is adequate so factor analysis can be done.
NOF<-fa.parallel(X, fm = "minres", fa = 'fa')
Fact_Ana = fa(data,nfactors = 4,rotate = "oblimin", fm = "minres")
print(Fact_Ana$loadings,cutoff = 0.5)
fa.diagram(Fact_Ana)
Fact_Ana$scores
finaldata<- cbind(Y,Fact_Ana$scores)
names(finaldata) <- c("satisfaction","purchase","marketing","post_purchase","product_positioning") 
reg <- lm(satisfaction~.,finaldata)
finaldata <- as.data.frame(finaldata)
summary(reg)
