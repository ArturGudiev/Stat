---
title: "???????? ???????"
author: "Artur Gudiev"
date: '27 ??????? 2018 ? '
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## ??????? 5

??????? ????????????? ????? ????? $$L(X_{[n]}, a) = (\frac{1}{b-a})^{10}$$. 

???????? ??????????? ??? a, ???????? ??????? ? b. ?? ??? ??? ???? ??????? $$a <= X_1 < X_2 < ... < X_{10} <= b$$
?? ????????? ??????? ??????????? ??? $$ a=X_1$$

## ??????? 6
?????? ???????? ??????????????? ?????????? ?? ???????? ?????? ?????? ????????????? ????????????. 

??? ?????????? ?????? ?????? = X_1 ?????????? c ??????????? ???????? a, ????????????? ????? ????? ???????????????

?????? ????????? ??? ??? ??????????? ??????? ? X_1 ?? ????? ????? ????????? a.

## ??????? 9
??????? ????? ????? ??????? ?????????????. 
```{r cars}
#???????, ????????? ?????????? ?????????? ? ????????? ? ??????????????????
count_win_lose = function(vector){
    w <- 0
    l <- 0
    for(i in c(1:length(vector))){
        if(vector[i] == 'W') {w <- w + 1}
        if(vector[i] == 'L') {l <- l + 1}
    }
    return(c(w,l))
}

#???????, ??????????? ????? ?????????? ?????????., ??????????, ?????? ? ?????????? ???, ????? ????? ????????? 
processFile = function(filepath) {
    con <- file(filepath, "r")
    win <- 0
    lose <- 0
    go <- 0
    stay <- 0
    fileLines <- c()
    while ( TRUE ) {
        line = readLines(con, n = 1)
        if ( length(line) == 0 ) {
            break
        }
        s <- unlist(strsplit(line, "\t"))
        last = tail(s,n=1)
        if(length(s) > 0){
            go <- go + 1
            stay <- stay + length(s) - 1
            wl = count_win_lose(s)
            win <- win + wl[1]
            lose <- lose + wl[2]
        }
    }

    close(con)
    return(c(win, lose, stay, go))
}


fpath = 'C:\\Artur\\University\\Stat\\HW\\2\\casino.txt'
Sys.setenv(LANG = 'en')

s = processFile(fpath)

cat('Win', s[1], '\nLose', s[2], '\nStay', s[3], '\nGo', s[4])

```

C????????????, ??????? ????????????? ????? ????? $$L(X_{[n]}, p\_win, p\_go) = {p\_win}^{802}*(1-p\_win)^{1181}*p\_go^{1000}*(1-p\_go)^{983}$$

??? ?????????? ?????? ????????? p_go ???????????????? ? ??????? ??????????, ?????????? ?? ? ????: 
$$ (1000ln(x) + 983ln(1-x))' = 0 
\\ $$ 
$$ \\ \frac{1000}{x} = \frac{983}{1-x}
\\ $$

$$ x = \frac{1000}{1983} 	\approx 0.50 $$

```{r }
options(scipen=999)
x <- seq(0.1,0.9,len=100)
plot(x, 1000/x-983/(1-x), type="l", col = "blue", xlab = expression(p_go), ylab = expression(f(p_go)))
```

??????????? ?????? ???? ? ????? ?? ?????, ??????, ??? ????????.

?????????? ??? ???????? p_win
$$ (802ln(x) + 1181ln(1-x))' = 0 
\\ $$ 
$$ \\ \frac{802}{x} = \frac{1181}{1-x}
\\ $$

$$ x = \frac{802}{1983} 	\approx 0.40 $$
```{r }
options(scipen=999)
x <- seq(0.1,0.9,len=100)
plot(x, 802/x-1181/(1-x), type="l", col = "blue", xlab = expression(p_win), ylab = expression(f(p_win)))
```


??? ???? ????? ?????????, ??? ??????? ?? ??????? ???????????

?????? ???????? ??????????????? ??????? ?????????????
```{r }
first = function(p_win,p_go){
    return(1000*log(p_go) + 983*log(1-p_go) + 802*log(p_win) + 1181*log(1-p_win))
}

print(first(0.4, 0.5))
```

## ??????? 10
?????? ??????? ?????????????.

```{r} 
# ?????? ??????? ???????????? ?????????? ???, ????? ?????
# 1) ??????? ? ???????
# 2) ???????? ? ???????
# 3) ??????? ? ????
# 4) ???????? ? ????
processFile2 = function(filepath) {
    con <- file(filepath, "r")
    win <- 0
    lose <- 0
    lastW <- 0
    lastL <- 0
    fileLines <- c()
    while ( TRUE ) {
        line = readLines(con, n = 1)
        if ( length(line) == 0 ) {
            break
        }
        s <- unlist(strsplit(line, "\t"))
        last = tail(s,n=1)
        length(s) <- length(s)-1
        if(length(s) > 0){
            wl = count_win_lose(s)
            win <- win + wl[1]
            lose <- lose + wl[2]
        }
        if(last=="W"){
            lastW <- lastW + 1
        }else{
            lastL <- lastL + 1
        }
    }

    close(con)
    return(c(win, lose, lastW, lastL))
}


fpath = 'C:\\Artur\\University\\Stat\\HW\\2\\casino.txt'
Sys.setenv(LANG = 'en')
s = processFile2(fpath)


cat('Win and stay\t', s[1], '\nLose and stay', s[2], '\nWin and go\t', s[3], '\nLose and go\t', s[4],'\nAll win\t\t', s[1]+s[3],'\nAll lose\t\t', s[2]+s[4])

```

C????????????, ??????? ????????????? ????? ????? $$L(X_{[n]}, p\_win, p\_lose, p\_win\_go, p\_lose\_go) =  {p\_win}^{802}*(1-p\_win)^{1181}*(1-p\_win\_go)^{626}*p\_win\_go^{176}*(1-p\_lose\_go)^{357}*p\_lose\_go^{824}$$

??? ????????? p_win ???????? ????????? ? ??????? ? ?????????? ???????? $$p\_win = 0.40$$

?????????? ?????????, ???????? ???????? ????????? ??? p_win_go: 

$$ (626ln(1-x) + 176ln(x))' = 0 
\\ $$ 
$$ \\ \frac{176}{x} = \frac{626}{1-x}
\\ $$

$$ x = \frac{176}{802} 	\approx 0.22 $$

```{r }
options(scipen=999)
x <- seq(0.1,0.9,len=100)
plot(x, 176/(x)-626/(1-x), type="l", col = "blue", xlab = expression(p_win_go), ylab = expression(f(p_win_go)))
```

?? ??????? ??????????? ???????, ??? ??? ????????. 

????????? ??? ???????? p_lose_go: 
$$ (357ln(1-x) + 824ln(x))' = 0 
\\ $$ 
$$ \\ \frac{824}{x} = \frac{357}{1-x}
\\ $$

$$ x = \frac{824}{1181} 	\approx 0.70 $$

```{r }
x <- seq(0.1,0.9,len=100)
plot(x, 824/(x)-357/(1-x), type="l", col = "blue", xlab = expression(p_win_go), ylab = expression(f(p_win_go)))
```

??? ????????. 

?????? ???????? ??????????????? ??????? ?????????????: 

```{r }
second = function(p_win, p_win_go, p_lose_go){
    return(802*log(p_win) + 1181*log(1-p_win) + 626*log(1-p_win_go) + 176*log(p_win_go) + 357*log(1-p_lose_go) + 824*log(p_lose_go) )
}

print(second(0.4, 0.22, 0.7))
```

???????? ??????? ????????????? ??? ?????? ???????? ??????, ??? ??? ??????. 
??????, ????? ?????? ????????. 