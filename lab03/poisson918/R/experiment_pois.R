#' @export
experiment_pois <- function(config_list){
  lista_experimentos <-
    purrr::map(config_list, function(x){
      df <- list_rpois(x$n, x$n_replicas, x$lambda) |> emv_df()
      df$n <- x$n
      df$lambda <- x$lambda
      return(df)
  })

  return(dplyr::bind_rows(lista_experimentos, .id = "exper"))
}

#configs <- list(
#  list(n = 10, n_replicas = 2, lambda = 3.14),
#  list(n = 50, n_replicas = 3, lambda = 3.14),
#  list(n = 50, n_replicas = 2, lambda = 20))

#purrr::map(configs, function(x){
#  list_rpois(x$n, x$n_replicas, x$lambda) |> emv_df() -> df
#  df$n <- x$n
#  df$lambda <- x$lambda
#  return(df)
#}) -> lista_experimentos

#dplyr::bind_rows(lista_experimentos, .id = "exper")


