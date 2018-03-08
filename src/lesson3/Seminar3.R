# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 06.03.2018

Sys.setenv(LANG = 'en')
comb = function(n, m){
    return(factorial(n)/(factorial(m)*factorial(n-m)))
}
alpha = 0.5
n = 30
sample = rexp(n, 0.05)
sort_sample = sort(sample, decreasing = TRUE)

i <- 1
sum <- 1
while(TRUE){
    sum <- sum + comb(n,i)/2^n
    if(i > 100){
        i <- i - 1
        break
    }
    i <- i + 1
}

m <- i
# print(c(sort_sample[m+1], sort_sample[n-m]))
