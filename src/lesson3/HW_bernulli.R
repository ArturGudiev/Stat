# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 06.03.2018

m = 4000
n = 10000
alpha = 0.05

q = qnorm(1-alpha/2)
r = m/n
s1 = r - q*(sqrt(r*(1-r)/n))
s2 = r + q*(sqrt(r*(1-r)/n))

print(round(c(s1,s2),2))
