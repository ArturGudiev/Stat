# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 04.03.2018
Sys.setenv(LANG = 'en')

explore_lambda = function(n, lambda){
    estim_vector = c()
    for(i in c(1:1000)){
        sample = rexp(n,rate=lambda)
        estim = 1/mean(sample)
        estim_vector = c(estim_vector, estim)
    }
    hist(estim_vector,freq=F,col=rgb(0,0,1,1/4), main=sprintf("N = %s", n))
    boxplot(estim_vector,main = sprintf("N = %s", n))
}
lambda = 1.5
explore_lambda(100, lambda)
explore_lambda(1000, lambda)
explore_lambda(5000, lambda)

