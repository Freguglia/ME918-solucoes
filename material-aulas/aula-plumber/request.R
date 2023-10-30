library(httr)
req <- GET(url = "http://127.0.0.1:8517/gapminder?pais=Brazil")
content(req)

meupais <- "Brazil"
req2 <- GET(url = "http://127.0.0.1:8517",
            path = "/gapminder",
            query = list(pais = meupais))
do.call(rbind, lapply(content(req2), data.frame))
