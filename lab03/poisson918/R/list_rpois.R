#' @title Lista de Amostras Poisson
#'
#' @param n Tamanho das amostras
#' @param n_replicas Número de Amostras
#' @param lambda Valor de \eqn{\lambda} utilizado nas amostras.
#'
#' @return Uma lista com `n_replicas` amostras de tamanho `n` da poisson \eqn{\lambda}.
#'
#' @examples
#' list_rpois(n = 10, n_replicas = 2, lambda = 4)
#' list_rpois(n = 5, n_replicas = 5, lambda = 5)
#'
#' @importFrom stats rpois
#' @export
list_rpois <- function(n, n_replicas, lambda) {
  purrr::map(seq_len(n_replicas),
             function(x) rpois(n, lambda = lambda))
}
