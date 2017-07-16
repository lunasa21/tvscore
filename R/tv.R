#' @title Funciones de prueba para predicciones
#' @description Funcion que predice basadndos een una linea de tiwmpo
#' @param input vector de datos
#' @return un vectorde datos de prediccion

#' @examples
#' newdata <- data.frame(
#' age = c(24, 54, 32, 75),
#' marital = c("MARRIED", "DIVORCED", "WIDOWED", "NEVER MARRIED")
#' )
#' tv(input = newdata)
#' @export
#' @import mgcv

tv <- function(input){
  #input can either be csv file or data
  newdata <- if(is.character(input) && file.exists(input)){
    read.csv(input)
  } else {
    as.data.frame(input)
  }
  stopifnot("age" %in% names(newdata))
  stopifnot("marital" %in% names(newdata))

  newdata$age <- as.numeric(newdata$age)

  #tv_model is included with the package
  newdata$tv <- predict.gam(tv_model, newdata = newdata)
  return(newdata)
}
