

Rseeds <- unlist(read.delim("/Users/pjulien/Dropbox/Code/Seeds.20.01.2015.R.txt", header=FALSE))
names(Rseeds) <- NULL

Rseeds_count <- tapply(Rseeds, Rseeds, length)
Rseeds_perc <- Rseeds_count / sum(Rseeds_count) * 100


### Most chosen seeds

sort(Rseeds_perc, dec=TRUE)
barplot(sort(Rseeds_perc), horiz=TRUE)

### Choice of seeds per length

Rseeds_char <- as.character(Rseeds)

Rseeds_len_count <- tapply(nchar(Rseeds_char), nchar(Rseeds_char), length)
Rseeds_len_perc <- Rseeds_len_count / sum(Rseeds_len_count) * 100

barplot(rev(Rseeds_len_perc), horiz=TRUE, border=NA, xlab="Percentage of cases", las=1, ylab="Length of seed number")
grid(ny=0, col="gray80", lwd=1.5)
barplot(rev(Rseeds_len_perc), horiz=TRUE, border=NA, add=TRUE, col="darkturquoise", xlab="", ylab="", ann=FALSE, names.arg = NA, axes=FALSE)


###
######
######
###### Final plotting
######
######
###

thisCol <- "darkturquoise"

par(mfrow=c(2,1))

Rseeds_perc2 <- sort(Rseeds_perc, dec=TRUE)
Rseeds_perc2 <- Rseeds_perc2[1:10]

a <- barplot(rev(Rseeds_perc2), horiz=TRUE, border=NA, xlab="Percentage of cases", las=1, ylab="Chosen seed", cex.names=0.8, xlim=c(0, max(Rseeds_perc2) + 3))
grid(ny=0, col="gray80", lwd=1.5)
barplot(rev(Rseeds_perc2), horiz=TRUE, border=NA, add=TRUE, col=thisCol, xlab="", ylab="", ann=FALSE, names.arg = NA, axes=FALSE)
text(rev(Rseeds_perc2), a[,1], paste(round(rev(Rseeds_perc2), 1), "%", sep=""), pos=4, cex=0.8)


a <- barplot(rev(Rseeds_len_perc), horiz=TRUE, border=NA, xlab="Percentage of cases", las=1, ylab="Length of chosen seed (# of digits)", cex.names=0.8, xlim=c(0, max(Rseeds_len_perc) + 4.5))
grid(ny=0, col="gray80", lwd=1.5)
barplot(rev(Rseeds_len_perc), horiz=TRUE, border=NA, add=TRUE, col=thisCol, xlab="", ylab="", ann=FALSE, names.arg = NA, axes=FALSE)
text(rev(Rseeds_len_perc), a[,1], paste(round(rev(Rseeds_len_perc), 1), "%", sep=""), pos=4, cex=0.8)




barplot(sort(Rseeds_perc, dec=TRUE), col=thisCol, border=NA)

plot(cumsum(sort(Rseeds_perc, dec=TRUE)), type="l", lwd=2, col=thisCol)