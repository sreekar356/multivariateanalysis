#car(engine,price,color,mileage)
#engine = low, medium, high
#price = low, medium, high
#color = red, green, silver
#mileage = average, high
library(conjoint)
# number of profiles = 3^3 * 2^1 = 54
engine <- c("low","medium","high")
price <- c("low","medium","high")
color <- c("red","green","silver")
mileage <- c("average","high")
attribute <- expand.grid(engine,price,color,mileage)
design <- caFactorialDesign(attribute,type = 'full')
design1 <- caFactorialDesign(attribute,type = "orthogonal")
design2 <- caFactorialDesign(attribute,type = "fractional")
design3 <- caFactorialDesign(attribute,type = "ca")
design4 <- caFactorialDesign(attribute,type = "aca")
cor(caEncodedDesign(design))
cor(caEncodedDesign(design1))
cor(caEncodedDesign(design2))
cor(caEncodedDesign(design3))
cor(caEncodedDesign(design4))



