configuracoes <- yaml::read_yaml("configuracoes.yaml")

purrr::map(configuracoes$arquivos, function(x) {
  read_json(file.path("dados", x))
}) -> lidos

listao <- do.call(c, args = lidos)

library(purrr)

map(listao, as.data.frame) -> listao_df
list_rbind(listao_df) -> tabelao

library(tidyverse)
tabelao <- tibble(tabelao)
tabelao$horario <- as_datetime(tabelao$horario)

tabelao %>%
  filter(evento == "recalibragem") %>%
  select(horario, evento) %>%
  arrange(horario) %>%
  mutate(total = 1:n()) -> tabela_r

ggplot(tabela_r, aes(x = horario, y = total)) +
  geom_line()

tabelao %>%
  filter(evento == "recalibragem") %>%
  select(horario) %>%
  mutate(anterior = lag(horario)) %>%
  mutate(diferenca = horario - anterior) %>%
  filter(diferenca > 8*60*60) -> horario_validos

tabelao %>%
  filter(horario < horario_validos$anterior[1] |
           horario > horario_validos$horario[1]) %>%
  filter(horario < horario_validos$anterior[2] |
           horario > horario_validos$horario[2]) -> tabelao_bom

combin <- expand.grid(v1 = c(T,F), v2 = c(T,F), v3 = c(T,F), v4 = c(T,F))
l <- unlist(apply(combin, 1, list), recursive = FALSE)
nomes <- lapply(l, function(x) names(x)[x])

f <- function(n){
  aux <- tabelao_bom[, c("intensidade", n)]
  lm(intensidade ~ ., data = aux)
}

map(nomes, f)
