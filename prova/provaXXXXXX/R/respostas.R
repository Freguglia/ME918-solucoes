#' @export
respostas <- function() {
  list(
    list(verdadeiro = TRUE),

    list(verdadeiro = FALSE,
         justificativa = paste(
           "Embora seja uma boa prática tentar manter uma função",
           "por arquivo, isso não é um requerimento e podemos",
           "definir múltiplos objetos no mesmo arquivo .R.",
           "Um caso comum é definir funções auxiliares junto com",
           "uma função principal, sendo essas funções auxiliares",
           "exportadas ou não.",
           sep = " ")
    ),

    list(verdadeiro = TRUE),

    list(verdadeiro = FALSE,
         justificativa = paste(
           "A relação não precisa ser um pra um, pois podemos",
           "documentar múltiplas funções no memso tópico utilizando,",
           "por exemplo, as tags do Roxygen @describeIn e @rdname.",
           "Além disso, não existe requerimento de que todas as funções",
           "sejam documentadas (estejam descritar em um arquivo .Rd).",
           sep = " ")
    )
  )
}
