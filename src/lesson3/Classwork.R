# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 04.03.2018

s1 = c(282, 226, 188, 327, 344, 304, 414, 224, 335, 270)
s2 = c(417,  851,  742, 1217, 1160,  993,  864,  852, 1286,  988)
m = c(mean(s1), mean(s2))
w = c(0.4, 0.6)

Xs = w[1]*m[1] + w[2]*m[2]
vars = c(var(s1), var(s2))
print(vars)

sum1 = w[1]*vars[1] + w[2]*vars[2]
sum2 = w[1]*(Xs-m[1])^2+w[2]*(Xs-m[2])^2
D = sum1+sum2

print(c(Xs, D))

simpson = function(x,y,z,w){
    m = mean(c(x,z))
    return(c(m, m*y/x, z, m*w/z))
}

simpson