library(readxl)
raw <- read_excel("Barcs_S1_21748(z6-21748)-1739546198.xlsx", skip = 2)[-1,]
library(xts)
Sys.setenv(TZ = "UTC")
all.xts <- xts(as.matrix(raw[,2:ncol(raw)]), raw[,1,drop = TRUE])

## Watch
plot(all.xts[, Oszlop], main = colnames(all.xts)[Oszlop])

## All in one file with zoo
pdf("Mind.pdf", widt = 14)
for(Oszlop in 1:ncol(all.xts)){
    plot.zoo(all.xts[, Oszlop], ylab = colnames(all.xts)[Oszlop],
             xaxs = "i", xlab = "")
}
dev.off()
