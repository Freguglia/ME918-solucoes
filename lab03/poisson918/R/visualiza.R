#' @importFrom ggplot2 ggplot aes geom_density facet_wrap theme_bw
#' @export
visualiza <- function(df){
  df$n <- as.factor(df$n)
  ggplot(df, aes(x = emv, color = n)) +
    geom_density() +
    facet_wrap(~lambda, scales = "free") +
    theme_bw() -> output
  plot(output)
  return(output)
}

# configs <- list(
#   list(n = 10, n_replicas = 200, lambda = 5),
#   list(n = 50, n_replicas = 200, lambda = 5),
#   list(n = 100, n_replicas = 200, lambda = 5),
#   list(n = 10, n_replicas = 200, lambda = 20),
#   list(n = 50, n_replicas = 200, lambda = 20),
#   list(n = 100, n_replicas = 200, lambda = 20))
# experiment_pois(configs) -> df1
#
# df1$n <- as.factor(df1$n)
# ggplot(df1, aes(x = emv, color = n)) +
#   geom_density() +
#   facet_wrap(~lambda, scales = "free") +
#   theme_bw()
