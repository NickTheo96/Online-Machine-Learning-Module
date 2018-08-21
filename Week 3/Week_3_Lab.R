setwd("~/Documents/R/Online_Machine_Learning_Lab_Scripts/Week 3")

#creating a time series
beer <- read.csv("beer.csv", header = T, dec=",", sep=";")
beer <- ts(beer[,1], start=1965, frequency = 12)
plot(beer)#time series beer is about monthly beer prediction in Australia (millions of litres) from Jan 1956 to Dec 2004

#simple analysis
data(LakeHuron)
plot(LakeHuron)
LakeHuron.1 <- filter(LakeHuron, filter=rep(1/5,5))#simple linear class of 
LakeHuron.2 <- filter(LakeHuron, filter=rep(1/15,15))
LakeHuron.3 <- filter(LakeHuron, filter=rep(1/25,25))
lines(LakeHuron.1, col="red")
lines(LakeHuron.2, col="purple")
lines(LakeHuron.3, col="blue")

#lm is a linear model used for regresion analysis
#assume we wish to fit log(X_t)= alpha_0 + alpha_1*t + alpha_2*t^2 + e_t, this is done as:

lbeer <- log(beer)#log of beer calculated and stored as lbeer
t <-seq(1965,2005,length=length(beer))#t is defined
t2 <- t^2
plot(lbeer)
lm(lbeer~t+t2)#return a list - obective whose elements can be accessed using the "$" sign
lines(t,lm(lbeer~t+t2)$fit,col=2,lwd=2)#lm(lbeer^t+t2)$fit returns the fitted values of X^^_t of the model


#time series decomposition

#time series with additive trend, seasonal and irreguar components can be decomposed using the stl() function.
#t.window trend window
#s.window seasonal window
plot(stl(log(beer),s.window="periodic"))

#ARMA models

#to plot correlogram use acf() function, to plot partial correlogram use pacf() function in R
#get actual values of autocorrelations and partial autocorrelations, set plot=FALSE in the functions
#arima() function can be used to fit an autoregressive integrad moving averages model

#order of "pure" AR and MA processes can be identified from ACF and PACF using:

#function arima.sim() used to simulate ARIMA(p,d,q) models and ARIMA models. If d=0, ARIMA(p,0,q)=ARIMA(p,q)
sim.ar<-arima.sim(list(ar=c(0.4,0.4)),n=1000)#1000 observations of an ARIMA(2,0,0) model i.e AR(2) model was simulated and saved as sim.ar 
sim.ma<-arima.sim(list(ma=c(0.6,-0.6)),n=1000)#1000 obs of an MA(2) model simulated
sim.arma<-arima.sim(list(ar=c(0.7,0.2),ma=c(0.6,-0.4)),n=1000)#1000 obs of an ARMA(2,2) model simulated

par(mfrow=c(2,3))#splits the graphics window into (h x v) regions



acf(sim.ar,main="ACF of AR(2) process")#create the 6 plots
acf(sim.ma,main="ACF of MA(2) process")
acf(sim.arma,main="ACF of ARMA(2,2) process")
pacf(sim.ar,main="PACF of AR(2) process")
pacf(sim.ma,main="PACF of MA(2) process")
pacf(sim.arma,main="PACF of ARMA(2,2) process")

#Once order of ARIMA(p,d,q) model has been specified, function arima() can be used to estimate the parameters.
#done as arima(data,order=c(p,d,q))

data(LakeHuron)
fit<-arima(LakeHuron,order=c(1,0,1))#fitting an ARIMA(1,0,1) model on the Lake Huron dataset
#fit is a list containing the coefficients,resiudual and Akaike Information Criterion AIC


#forcasting using an ARIMA model 

#once selected the best candidate ARIMA(p,d,q) model, for series data, can estimate the parameters of that ARIMA model 
#and use it for making forcasts for future values of the time series
#paramates of an ARIMA(p,d,q) model can be esimated using the arima() funtion
#forecast.arima() makes forcasts for future values of the time series

#now assume satisfied with fit of ARIMA(1,0,1) model
LH.pred<-predict(fit,n.ahead=8)#function predict predicts future values of the levels under the model
#predicted the levels of Lake Huron for next 8 years
#LH.pred is a list containing two entries: the predicted value and standard errors of the predicted values

#using a rule of thumb for an approximate confidence interval (95%) of prediction, can plot Lake Huron data, 
#predicted values and approximatin confidence interval

par(mfrow=c(1,1))#splits the graphics window into (h x v) regions

plot(LakeHuron,xlim=c(1875,1980),ylim=c(575,584))#levels of Lake Hurron plotted, to leave space for new values, x-axis 
#limited from 1875 to 1980 with xlim=c(1875,1980)
LH.pred<-predict(fit,n.ahead=8)#function that makes the prediction
lines(LH.pred$pred,col="red")#prediction line added
lines(LH.pred$pred+2*LH.pred$se,col="red",lty=3)#confidence bands added
lines(LH.pred$pred-2*LH.pred$se,col="red",lty=3)

