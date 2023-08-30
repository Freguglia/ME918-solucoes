source("simulador.R")

devtools::source_url("https://ime.unicamp.br/~ra137784/lab01_ig.R")
planos <- input_lab01()

amostras <- purrr::map(planos, f)
