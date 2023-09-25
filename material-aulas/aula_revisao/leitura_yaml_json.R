library(yaml)

leitura <- yaml::read_yaml("exemplo.yaml")

# Pré-requisitos Probabilidade II
leitura$cursos$`estatística`$disciplinas[[2]]$`pre-requisitos`

library(jsonlite)
library(palmerpenguins)
palmerpenguins::penguins

jsonlite::write_json(penguins, "penguins.json", pretty = TRUE)

jsonlite::read_json("penguins.json", simplifyDataFrame = TRUE) -> df
tibble::tibble(df)

