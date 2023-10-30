library(glue)
library(ggplot2)
dados <- gapminder::gapminder

#* @param pais País selecionado
#* @get /gapminder
function(pais = ""){
  print(glue("{Sys.time()} -- Solicitação: país {pais}."))
  dados[dados$country == pais,]
}

#* @param ano Ano relacionado à predição a ser feita.
#* @param continente Continente relacionado à predição a ser feita.
#* @param logpib Log-PIB per capta relacionado à predição.
#* @get /predicao
function(ano, continente, logpib){
  df <- data.frame(ano = dados$year,
                   continente = dados$continent,
                   logpib = log(dados$gdpPercap),
                   expvida = dados$lifeExp)
  modelo <- lm(expvida ~ ., data = df)
  Xpred <- data.frame(ano = as.numeric(ano), continente = continente,
                      logpib = as.numeric(logpib))
  list(predito = predict(modelo, Xpred))
}

#* @get /registro
function(country, continent, year, lifeExp, pop, gdpPercap){
  novo <- data.frame(country = country,
                     continent = continent,
                     year = as.integer(year),
                     lifeExp = as.numeric(lifeExp),
                     pop = as.numeric(pop),
                     gdpPercap = as.numeric(gdpPercap))
  print(novo)
  dados <<- rbind(dados, novo)
  return("Novo registro adicionado!")
}

#* @param pais País selecionado
#* @get /grafico
#* @png
function(pais = ""){
  print(glue("{Sys.time()} -- Gráfico: país {pais}."))
  df <- dados[dados$country == pais,]
  gr <- ggplot(df, aes(x = year, y = pop, color = country)) +
    geom_line()
  print(gr)
}