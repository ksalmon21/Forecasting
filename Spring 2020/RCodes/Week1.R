rm(list=ls())

if(!require(latex2exp))install.packages("latex2exp"); require(latex2exp)

set.seed("12345")
y <- rnorm(50)

plot(y,type="o",pch=19, lty="dashed",col="green4", main= expression("Random Variable with"~mu^2~"= 0"))
lines(abline(h=0),col="red")
grid()

if(1==2){
## Alternatively, using latex commands:
if(!require(latex2exp))install.packages("latex2exp"); require(latex2exp)

plot(y,type="b",pch=5, lty="dashed",col="green4", main=TeX("Random Variable with $\\mu^2 = 0$"))
grid()

####
}

if(!require(astsa))install.packages("astsa"); require(astsa)

plot(jj,type="o",main="J&J Quarterly Earnings",xlab="Earnings",ylab="Years")
plot(flu,type="o",pch= 19, main="Monthly flu data",xlab="Number of Cases",ylab="Years")
grid()

### globaltemp https://data.giss.nasa.gov/gistemp/graphs/
plot(globtemp,type="o", col="green4", main=list("Global mean land-ocean deviations from average temp of 1951-1980",
     cex=1, col="blue"), ylab="Temperature Anomaly", xlab="Years")
plot(globtempl,type="o", col="green4", main=list("Global mean land deviations from average temp of 1951-1980",
     cex=1, col="blue"), ylab="Temperature Anomaly", xlab="Years")


miny <- min(globtemp,globtempl)
maxy <- max(globtemp,globtempl)
plot(globtemp,type="o", col="green4", main=list("Global mean land-ocean deviations from average temp of 1951-1980",
      cex=1, col="blue"),  pch=15, ylab="Temperature Anomaly", xlab="Years", ylim=c(miny,maxy))
lines(globtempl,col="blue",pch=19)
legend("topleft",c("Land & Sea","Land Only"), col=c("green4","blue"), pch=c(15,19), y.intersp=1.3)


##################################################################################################

normal <- ts(rnorm(100))
acf(normal,type="covariance")
acf(normal,type="correlation",ylab="Autocorelation")


# Simulating a non-stationary time series

# Set seed so thet we generate the same dataset
set.seed(2017)
# time variable 
t=seq(0,1,1/100)
# generate a time series
some.time.series=2+3*t+ rnorm(length(t))
# obtain acf of the time series below


############### Simulating a Randowm Walk model
set.seed(2^10)
Xt <- z <- NULL
Xt[1] <- 0
z[1] <- rnorm(1)
for (t in 2:1000){
  z[t] <- rnorm(1)
  Xt[t] <- Xt[t-1] +z[t]
}
dataX <- ts(Xt,end=c(2019,10),frequency = 12)
dataz <- ts(z,end=c(2019,10),frequency = 12)
plot(dataX,main="Random Walk", xlab='Time',ylab='',col="blue", type="l",lwd=2)
#mtext(expression(x[t]~"="~x[t-1]~"+"~z[t]), side = 3,col="blue")
mtext(TeX('$\\x_t = x_{t-1} + z_t$'), side = 3,col="blue")  # Using the Latex2exp package
abline(h=mean(dataX),col="red",lty="dashed",lwd=2) #include the mean of the series on the graph

# Create a plot of the acf:
acf(dataX, type="correlation")
# What do we observe here?

#See that taking the difference would render our series stationary. We are left with a purely random process
# Let us use the difference operator:
diff_rw <- diff(dataX)  # Easy to see that this will be z_t in our equation above
# round(diff_rw,3) == round(dataz[-1],3) # Remember we lose the first observation through differencing

#Plot the differenced series
plot(diff_rw, main =  "Differenced Random Walk Series", xlab='Time',ylab='',col="blue", type="l",lwd=2)
#abline(h=0,col="red",lty="dashed")
abline(h=mean(diff_rw),col="red",lty="dashed",lwd=2) #Plot the mean of the series. Should be close to zero
mtext(expression(Delta~x[t]~"="~z[t]), side = 3,col="blue",font = 2)

#Create a plot of the acf:
acf(diff_rw,type="correlation",lag.max = 24) 


# Simulating a Randowm Walk model w/drift
set.seed(2^10)
d <- rnorm(1000)
Xt2 <- NULL
Xt2[1] <- d[1] <- 0
for (i in 2:1000){
  Xt2[i] <- d[i] + Xt2[i-1]+rnorm(1)
}
dataX2 <- ts(Xt2,end=c(2019,10),frequency = 12)
plot(dataX2,main="Random Walk with drift", xlab='Time',ylab='',col="blue", type="l",lwd=2)
acf(dataX2)




# Simulating MA(3) process.
# X_t= Z_t+0.2 Z_(t-1)+0.3 Z_(t-2)+ 0.4 Z_(t-3) #Xt is a linear combination of noises 3 days back.

set.seed(2^10)
N <- 10000
z <- data <- NULL
z <- rnorm(N)

for(i in 4:N){
  data[i-3] <- z[i]+0.2*z[i-1]+0.3*z[i-2]+0.4*z[i-3]
}
dataz <- ts(data,end=c(2019,10),frequency = 12)

par(mfrow=c(2,1)) #Creating a multipframe graph with 1 row and 2 cols

plot(dataz,main="MA(3) Model", xlab='Time',ylab='',col="blue", type="l",lwd=2)
mtext(TeX("$x_t = z_t + z_{t-1} + z_{t-2} + z_{t-3}$"),side = 3, col="blue")

# What do we observe from the acf plot?
acf(dataz,type="correlation",main="Correlogram of a MA(3) Model",col="green4") 

################################################ Potential Question 
# (1) Simulating a non-stationary time series

# Set seed so thet we generate the same dataset
set.seed(2017)
# time variable 
t=seq(0,1,1/100)
# generate a time series
some.time.series=2+3*t+ rnorm(length(t))

# obtain acv for this time series below
# acf(some.time.series,type="covariance") #student required

# What is sample autocovariance coefficient gamma_5? 


# (2) # Simulating MA(4) process.
# X_t= Z_t+0.2 Z_(t-1)+0.3 Z_(t-2)+ 0.4 Z_(t-3)

set.seed(2^10)
z <- NULL
z <- rnorm(1000)
data<- NULL
for(i in 4:1000){
  data[i-3]=z[i]+0.2*z[i-1]+0.3*z[i-2]+0.4*z[i-3]
}
data=ts(data)

# find acf below

acf(data,type="correlation")
# What is the autocorrelation coefficient at lag 4? Ans. 0


##################################
## Creating Cycles
###################################
#qt = 2*cos(2pit/50 + .6pi) + wt
n <- 500
q <- p <- r <- NULL
set.seed(1920)
w <- rnorm(n)
w2 <- rnorm(n,mean=0,sd=sqrt(25))

for (t in 1:n){
  q[t] <- 2*cos((2*pi*t)/50 + 0.6*pi)# + w[t]
  p[t] <- q[t] + w[t]
  r[t] <- q[t] + w2[t]
}

par(mfrow=c(3,1), cex.main=1.5)
plot(q,col="blue", lwd = 2,type="l",xlab="",ylab="",main=TeX("$2\\cos(2\\pi_t/50 + 0.6\\pi)$"))
plot(p,col="blue", lwd = 2,type="l",xlab="",ylab="",main=TeX("$2\\cos(2\\pi_t/50 + 0.6\\pi) + N(0,1)$"))
plot(r,col="blue", lwd = 2,type="l",xlab="",ylab="",main=TeX("$2\\cos(2\\pi_t/50 + 0.6\\pi)+ N(0,25)$"))
# If your prefer the expression command:
# plot(r,col="blue", lwd = 2,type="l",xlab="",ylab="",main=expression(2*cos(2*pi*t/50+.6*pi) + N(0,25)))
par(mfrow=c(1,1)) # Return to original single graphic plot


