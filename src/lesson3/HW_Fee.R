# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 06.03.2018
Sys.setenv(LANG = 'en')


s = c(128,107,107,92,118,114,117,109,115,106,109,106,109,120,112,105,114,119,110,130, 104, 103, 99, 113,104)
pr = function(x){print(round(x,3))}

m = mean(s)
std = sd(s)
n = length(s)
alpha = 0.02
q = qt(1-alpha/2, n-1)
pr(q)

s1 = m - std/sqrt(n)*q
s2 = m + std/sqrt(n)*q

print(round(c(s1,s2),1))