# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 06.03.2018
Sys.setenv(LANG = 'en')
w = c(0.2, 0.5, 0.3)
n = 40 #500

pr = function(x){
    print(round(x,2))
}

disp = function(a,b){
    return (b-a)^2/12
}

a = c(1,7,3)
b = c(2,15,7)

# a = c(1,1,1)
# b = c(2,2,2)
# a = c(1,7,3)
# b = c(2,8,4)

D = c(disp(a[1],b[1]),disp(a[2],b[2]),disp(a[3],b[3]))
s1 = runif(n,a[1],b[1])
s2 = runif(n,a[2],b[2])
s3 = runif(n,a[3],b[3])

samples = list()
samples[[1]] = s1
samples[[2]] = s2
samples[[3]] = s3

m = c(mean(s1), mean(s2), mean(s3))
vars = c(var(s1), var(s2), var(s3))
std = c(sd(s1), sd(s2), sd(s3))
# print(c(D,s1,s2,s3))

MO = w[1]*m[1] + w[2]*m[2] + w[3]* m[3]

sum = w[1]*std[1] + w[2]*std[2] + w[3]*std[3]
opt = c(n*w[1]*std[1]/sum, n*w[2]*std[2]/sum, n*w[3]*std[3]/sum)
print(round(opt,0))

newN = opt[1]+opt[2]+opt[3]
newD = c(0,0,0)
newE = c(0,0,0)
for(i in c(1:3)){
    v = c()
    for(j in c(1:opt[i])){
        index <- sample(1:length(samples[i]), 1)
        v <- c(v,samples[[i]][index])
    }
    print(v)
    print(mean(v))
    print(var(v))
    newE[i] = mean(v)
    newD[i] = var(v)

    # stopifnot(2 > 3)
}
# pr(newE)
# pr(newD)


disp = 0
for(i in c(1:3)){
    disp = disp + w[i]^2 * vars[i]/opt[i]
}

# pr(m)
# pr(vars)
# pr(w)
# pr(MO)
# pr(disp)