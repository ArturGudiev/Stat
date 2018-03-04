# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 04.03.2018

n = 30
alpha = 0.05
sample = rnorm(n, mean = 4, sd = 4)


f = function(n, sd, alpha){
    sample = rnorm(n, mean = 4, sd = sd)

    m = mean(sample)
    q = qt(1-alpha/2, n)

    s1 = m - 4/sqrt(n)*q
    s2 = m + 4/sqrt(n)*q
    print(c(s1,s2))
}

f(30, 4, 0.05)


#print(q)
#print(c(mean(sample) - q*var(sample)/sqrt(30),
#mean(sample) + q*var(sample)/sqrt(30))
