# work with the GSS data as of 31 Aug 2014
# for the GSS annual report of Sep 2014

gss <- read.csv("data/20140910_gss.csv",
                  sep = ",", header = TRUE)

# make a cut for Ca only, to eliminate apparent calcareous at CaM3 > 3000
gssCa <- filter(gss, CaM3 <= 3000)

# make a table that can be printed pretty in report to summarize

# sum.x function will calculate n, min, max, mean, median, calculated MLSN
# do this for a table to include pH, OM, K, P, Ca, Mg, S

pH <- sum.x(gss$pH)
pH[4] <- "NA"
pH[6] <- "NA"
as.integer(pH)
OM <- sum.x(gss$OM360)
OM[6] <- "NA"
K <- sum.x(gss$KM3)
P <- sum.x(gss$PM3)
Ca <- sum.x(gssCa$CaM3)
Mg <- sum.x(gss$MgM3)
S <- sum.x(gss$SM3)

parameters <- c("pH", "OM %", "K ppm",
               "P ppm", "Ca ppm", "Mg ppm", "S ppm")

sum.table <- as.data.frame(rbind(pH, OM, K, P, Ca, Mg, S))

sum.table <- cbind(parameters, sum.table)

colnames(sum.table) <- c("Soil parameter", "n", "Min", 
                         "Median", "Mean", "Max", "GSS")

sum.table$Mean <- round(as.numeric(as.character(sum.table$Mean)), 0)
sum.table[[2, 5]] <- 2.4
sum.table$Mean <- as.factor(sum.table$Mean)
sum.table$MLSN <- as.numeric(as.character(sum.table$MLSN))