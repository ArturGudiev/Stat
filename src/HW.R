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
        #print(length(s))
    }

    close(con)
    print (c(win, lose, lastW, lastL))
    return(c(win, lose, lastW, lastL))
}

fpath = 'C:\\Artur\\University\\Stat\\HW\\2\\casino.txt'
# Sys.setenv(LANG = 'en')
s = processFile(fpath)
print(paste('Win ', s[1]))
print(paste('Lose ', s[2]))
print(paste('Last_Win ', s[3]))
print(paste('Last_Lose ', s[4]))
