library(ggplot2)
library(gganimate)
library(dplyr)

anim <- function(continente){
  a <- dplyr::filter(gapminder::gapminder, continent == continente)
  ggplot(a,
         aes(x = log(gdpPercap),
             y = lifeExp,
             size = pop)) +
    geom_point() +
    ggtitle(continente) +
    transition_time(year)
}
