config <- yaml::read_yaml("config.yaml")

arquivo_entrada <- file.path("data", config$arquivo_entrada)
arquivo_saida <- file.path("results", config$arquivo_saida)

saida <- arquivo_entrada |>
  jsonlite::read_json(simplifyDataFrame = TRUE) |>
  provaXXXXXX::quadrado_coluna(config$nome_coluna)

save(saida, file = arquivo_saida)
