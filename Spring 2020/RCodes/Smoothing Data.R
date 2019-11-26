
#### Smoothing data
hpfilter <- function(x,lambda=1600){
  eye <- diag(length(x))
  result <- solve(eye+lambda*crossprod(diff(eye,lag=1,d=2)),x)
  return(result)
}

set.seed(22^6)
x<- rnorm(100,0,1)
plot(x,type="o",lty="dashed",pch=19,lwd=1,col="blue",main= "Data Filtering and Smoothing")
lines(hpfilter(x),col="red",lwd=5,lty="dotted")
legend("bottomleft",legend=c("Smoothed Data","Simulated Data"),lty=c("dotted","dashed"),col= c("red","blue"))

