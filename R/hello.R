# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}

download.file("http://gss.norc.org/Documents/spss/2012_spss.zip", destfile="2012_spss.zip")
unzip("2012_spss.zip")
GSS <- foreign::read.spss("GSS2012.sav", to.data.frame=TRUE)

library(mgcv)
mydata <- na.omit(GSS[c("age", "tvhours", "marital")])
tv_model <- gam(tvhours ~ s(age, by=marital), data = mydata)

save(tv_model, file="data/tv_model.rda")

newdata <- data.frame(
  age = c(24, 54, 32, 75),
  marital = c("MARRIED", "DIVORCED", "WIDOWED", "NEVER MARRIED")
)
tv(input = newdata)

