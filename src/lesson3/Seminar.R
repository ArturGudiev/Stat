# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 04.03.2018


f = function(n, alpha, std){
    sample = rnorm(n, mean = 4, sd = std)

    m = mean(sample)
    student_qunatile = qt(1-alpha/2, n-1)

    s1 = m - std/sqrt(n)*student_qunatile
    s2 = m + std/sqrt(n)*student_qunatile

    mean_vector = c()
    for(i in c(1:1000)){
        new_sample = rnorm(n, mean = 1, sd = std)
        mean_vector <- c(mean_vector, mean(new_sample))
    }
    cat("n = ", n)
    cat("\nalpha = ", alpha)
    cat("\nstd = ", std)
    cat("\nCI = ", s1, s2)
    cat("\nCI length= ", s2 - s1, '\n\n')

    qua = quantile(mean_vector,c(0.025,0.975))
    # cat('AAA')
    # cat(qua[[1]], qua[[2]])
    print(sprintf('Generated CI: %f %f', qua[[1]], qua[[2]]))
    # q25 = toString(qua[[1]])
    # q75 = toString(qua[[2]])
    # cat("asd", qua[1])
    # cat("\nGenerated CI :",q[1])
}
Sys.setenv(LANG = 'en')
f(30, 0.05, 1)
# f(30, 4, 0.05)


#print(q)
#print(c(mean(sample) - q*var(sample)/sqrt(30),
#mean(sample) + q*var(sample)/sqrt(30))