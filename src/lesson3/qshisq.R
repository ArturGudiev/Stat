# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 04.03.2018

disp = function(sample){
    n <- length(s)
    return((n-1)/(n)*var(sample))
}

# s = c(0.47, 0.13, -0.98, 0.74, -2.11, -3.36, -0.35, -2.21, 1.14, -0.13, 1.12, 1.49, 0.77, 0.79, 1.13, -1.45, 0.92, -0.08, 0.62, -0.51)
s = c(0.96, 0.26, -0.17, -0.19, 1.15, -0.34, -0.19, -0.34, -0.06, 0.18, 0.03, -0.84, -0.45, -1.25, -1.98, -0.89, 1.25, 1.51, -0.83, 0.25)
l = length(s)
m = mean(s)
q1 = qchisq(.975, df=20)
q2 = qchisq(.025, df=)
q11 = qchisq(.975, df=19)
q12 = qchisq(.025, df=19)


s2 = 0
for(i in c(1:length(s))){
    s2 = s2 + s[i]^2
}
s2 = s2/length(s)
print(s2)

f = function(s2, l, y){
    return(s2*l/y)
}

print(c(f(s2,l,q1), f(s2,l,q2)))



# ans1 = disp(s)*(l-1)/qchisq(.975, df=20)
# ans2 = disp(s)*(l-1)/qchisq(.025, df=20)
# # print(c(ans1, ans2))
#
# ans1 = var(s)*(l-1)/qchisq(.975, df=20)
# ans2 = var(s)*(l-1)/qchisq(.025, df=20)
# # print(c(ans1, ans2))