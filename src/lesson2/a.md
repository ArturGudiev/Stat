## R Markdown

```{r }

disp = function(sample){
	l = length(sample)
	return((l-1)*var(sample)/l)
}

smallVar = c()
smallNotCorrected = c()
largeVar = c()
largeNotCorrected = c()

for(i in c(1:1000)){
	sampleSmall = rnorm(30, mean = 4, sd = 4)
	smallVar = c(smallVar, var(sampleSmall)) 
	smallNotCorrected = c(smallNotCorrected, disp(sampleSmall))
	
	sampleLarge = rnorm(1000, mean = 4, sd = 4) 
	largeVar = c(largeVar, var(sampleLarge)) 
	largeNotCorrected = c(largeNotCorrected, disp(sampleLarge))
}


```