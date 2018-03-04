# Title     : TODO
# Objective : TODO
# Created by: gudiea
# Created on: 03.03.2018

count_win_lose = function(vector){
    w <- 0
    l <- 0
    for(i in c(1:length(vector))){
        if(vector[i] == 'W') {w <- w + 1}
        if(vector[i] == 'L') {l <- l + 1}
    }
    return(c(w,l))
}


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
print(paste('Win '), s[1])
print(paste('Lose '), s[2])
print(paste('Last win '), s[3])
print(paste('Last lose '), s[4])



first = function(p_win,p_go){
    return(1000*log(p_go) + 983*log(1-p_go) + 802*log(p_win) + 1181*log(1-p_win))
}

second = function(p_win, p_win_go, p_lose_go){
    return(802*log(p_win) + 1181*log(1-p_win) + 626*log(1-p_win_go) + 176*log(p_win_go) + 357*log(1-p_lose_go) + 824*log(p_lose_go) )
}

#print(first(0.4, 0.5))
#print(second(0.4, 0.22, 0.7))