# generates an mlsn value for a vector
mlsn <- function(x) {
  fit.x <- vglm(x ~ 1, fisk)
  z <- Coef(fit.x)
  new.mlsn <- qfisk(0.1, z[1], z[2])
  return(round(new.mlsn, 0))
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