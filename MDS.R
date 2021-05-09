data <- read.csv(file = "MDA.csv")
View(data)
MDS_data <- data
d <- dist(MDS_data)
MDS_model <- cmdscale(d,k = 2)
plot(MDS_model)
MDS_data_t <- t(MDS_data)
d1 <- dist(MDS_data_t)
MDS_model1 <- cmdscale(d1,k = 2)
plot(MDS_model1,col = "red",cex = 1.25,pch = 19,xlim = c(-15,+15),ylim = c(-15,+15))
x <- MDS_model1[,1]
y <- MDS_model1[,2]
name <- row.names(MDS_model1)
text(x,y,name,pos = 4,col = "green",cex = 0.8)
abline(h = 0)
abline(v = 0)
