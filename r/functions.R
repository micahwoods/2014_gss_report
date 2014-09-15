# this mlsn function generates an mlsn value for a vector

mlsn <- function(x) {
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  new.mlsn <- qfisk(0.1, z[1], z[2])
  return(round(new.mlsn, 0))
}

# calculates mlsn based on normal distribution
mlsn.normal <- function(x) {
  v1 <- qnorm(0.1, mean = mean(x), sd = sd(x))
  return(round(v1, 0))
}

# calculates mlsn based on uniform distribution
mlsn.uniform <- function(x) {
  v1 <- qunif(0.1, min = min(x), max = max(x))
  return(round(v1, 0))
}

# calculates values for a parameter for use in summary table
sum.x <- function(x) {
  Count <- length(x)
  Minimum <- min(x)
  Median <- median(x)
  Mean <- mean(x)
  Maximum <- max(x)
  MLSN <- mlsn(x)
  return(c(Count, Minimum, Median, Mean, Maximum, MLSN))
}

# omcec function calculates om cec for given pH (x) and om (y)
omcec <- function(x, y) {
  cec <- (-311 + 268 * x) * (y / 100)
  return(round(cec, 1))
}

# diag plot function plots histogram and density, normal, fisk, and uniform
distplot <- function(x) {
  myhist <- hist(x, breaks = 50, xlab = NULL, main = NULL)
  multiplier <- myhist$counts / myhist$density
  mydensity <- density(x, na.rm = TRUE)
  mydensity$y <- mydensity$y * multiplier[1]
  
  plot(myhist, xlab = NULL, main = NULL)
  lines(mydensity, col = "#d7191c", lwd = 2, xlab = NULL, main = NULL)
  
  myx <- seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length.out= 200)
  mymean <- mean(x, na.rm = TRUE)
  mysd <- sd(x, na.rm = TRUE)
  
  normal <- dnorm(x = myx, mean = mymean, sd = mysd)
  
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  fisk.nums <- dfisk(myx, z[1], z[2])
  
  
  lines(myx, fisk.nums * multiplier[1], col = "#2c7bb6", lwd = 2)
  
  lines(myx, normal * multiplier[1], col = "#fdae61", lwd = 2)
}

# make an ECDF plot for an element
# x is vector to plot, x1 is the shift on legend
ecdf.plot <- function(x, x1) {
  
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  
  sim.data <- data.frame(y = rfisk(n = 1000,
                                   z[1], z[2])) 
  
  # makes a plot
  
  plot(ecdf(x), verticals=TRUE, do.p=FALSE,
       col.h="red", col.v="red",lty="dotted", lwd = 3)
  
  lines(ecdf(sim.data$y), verticals=TRUE, do.p=FALSE,
        col.h="black", col.v="black",lty="dashed", lwd = 2)
  
  legend(x1, .4, c("data", "model"),
         col=c("red", "black"),
         lty=c("dotted", "dashed"),
         lwd = 2) 
}
