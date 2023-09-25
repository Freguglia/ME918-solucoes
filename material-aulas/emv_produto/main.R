library(ggplot2)
source("R/gerador.R")

save(df, file = file.path("artifacts", paste0(configs$fname,".RData")))

#grafico <- visualiza(df)
#ggsave(file.path("artifacts", paste0(configs$fname,".pdf")), plot = grafico,
#       width = configs$sizes$width,
#       height = configs$sizes$height)
rmarkdown::render(file.path("templates", "relatorio.Rmd"),
                  params = list(fname = configs$fname),
                  output_file = file.path("..", "artifacts", paste0(configs$fname, ".pdf")))
