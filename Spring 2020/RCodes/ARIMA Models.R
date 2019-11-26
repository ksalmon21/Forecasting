#####################################
##### Simulating ARIMA processes
#####################################


x<- matrix(NA,nrow=10^3,ncol=10)

for (i in 1:10){
  x[,i] <- rnorm(10^6)
}
plot(ts(x))


set.seed(1); coefsacf <- acf(arima.sim(n=1000, model=list(order=c(0,0,2),ma=c(0.5,0.5))),type="covariance")$acf
set.seed(1); acf(arima.sim(n=1000, model=list(order=c(0,0,2),ma=c(0.5,0.5))),type="correlation")$acf


coefsacf[1]/coefsacf[3]


acf(arima.sim(1000,model=list(order=c(1,0,1),ar=c(0.5),ma=4)))
