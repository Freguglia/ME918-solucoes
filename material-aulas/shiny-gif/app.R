library(shiny)
library(gapminder)
source("animate.R")

ui <- fluidPage(
  selectInput("s", "Continent:", unique(gapminder$continent)),
  imageOutput("gif")
)

server <- function(input, output) {
  output$gif <- renderImage({
    arquivo <- glue::glue("imagens/", input$s, ".gif")
    if(!file.exists(arquivo)){
      b <- anim(input$s)
      anim_save(arquivo, animate(b, renderer = gifski_renderer()))
    }
    
    list(src = arquivo,
         contentType = "image/gif")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
