# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 07.03.2018

s1 = rnorm(100, mean = 4, sd = 4)

T = function(m, a, std, n){
    return((m - a)/std*sqrt(n))
}

a1 = 2
a2 = 3
std = 4
n = 30

t1_vector = rep(NA,1000)
t2_vector = rep(NA,1000)
for(i in c(1:1000)){
    s1 = rnorm(n, mean = a1, sd = std)
    s2 = rnorm(n, mean = a2, sd = std)
    t1_vector[i] = T(mean(s1), a1, std, n)
    t2_vector[i] = T(mean(s2), a2, std, n)
}

#print(t1_vector)
#print(t2_vector)
x<-seq(-10,10,0.01)
# hist(t1_vector,freq=F, xlim=c(-10,10), ylim = c(0,0.5) ,col=rgb(0,1,0,1/4),main = '',xlab='')
# hist(t2_vector,freq=F, xlim=c(-10,10), col=rgb(1,0,0,1/4),add=T)
#
# lines(x,dt(x,df=n-1),col="blue")
# lines(x,dnorm(x,0,1),col="black")