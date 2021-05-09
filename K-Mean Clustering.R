library(factoextra)
library(animation)
library(cluster)
data<-read.csv('Country-data.csv',sep=",",dec=".",header=TRUE,row.names = 1)
data <- scale(data)
str(data)

KM1 <- kmeans(data, 4, nstart = 50)
kmeans.ani(data, 4)
KM1$cluster
data1 <- cbind(data, cluster = KM1$cluster)
KM2 <- eclust(data, "kmeans" , nstart = 25)

fviz_gap_stat(KM2$gap_stat)
fviz_silhouette(KM2)
