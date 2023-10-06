#' @title Transformação de coluna elevando ao quadrado
#'
#' @description
#' Esta função substitui uma coluna numérica (\code{numeric} ou \code{integer})
#' especificada de uma tabela por seu valor ao quadrado.
#'
#' @param df Um objeto do tipo \code{Data.Frame} a ser tranformado.
#' @param nome_coluna String identificando o nome da coluna a ter
#' seu valor transformado. Precisa ser o nome de uma coluna de \code{df}
#' que tenha os tipos \code{numeric} ou \code{integer}.
#'
#' @return Retorna um objeto do tipo \code{Data.Frame} com os mesmos nomes
#' de coluna, porém com a coluna especificada substituída por seus valores
#' ao quadrado.
#'
#' @examples
#' quadrado_coluna(iris, "Sepal.Length")
#' quadrado_coluna(mtcars, "qsec")
#'
#' @importFrom glue glue
#'
#' @export
quadrado_coluna <- function(df, nome_coluna){

  if(length(nome_coluna) != 1){
    stop("Utilize apenas um nome de coluna.")
  }

  if(!nome_coluna %in% colnames(df)){
    stop(glue("'{nome_coluna}' não é uma coluna da tabela 'df'."))
  }

  if(!class(df[[nome_coluna]]) %in% c("numeric", "integer")){
    stop(glue("'{nome_coluna}' não tem um tipo numérico."))
  }

  df[,nome_coluna] <- df[,nome_coluna]^2
  return(df)
}

