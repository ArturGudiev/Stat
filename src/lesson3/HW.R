# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 06.03.2018

##1
# w = c(0.3, 0.6, 0.1)
# a = c(3,2,5)
# disp = c(1,4,0.01)
#
# E <- 0
# for(i in c(1:3)){
#     E = E + w[i]*a[i]
# }
# #print(E)
#
# D = 0
# for(i in c(1:3)){
#     D = D + w[i] * (disp[i] + (a[i] - E)^2)
# }
# #print(D)

########################
Sys.setenv(LANG = 'en')
n = 5

alpha = 0.1
q1 = qnorm(1-alpha/2)
q2 = qnorm(alpha/2)
print(c(q1,q2))
s1 = -q1*20/sqrt(n)
s2 = -q2*20/sqrt(n)
delta = (s2-s1)/2 # <= 15

print(round(q1,2))
print(round(c(s1,s2),2))
print(delta)

######################