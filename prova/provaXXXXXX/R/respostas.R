#' @export
respostas <- function() {
  yaml_respostas <- system.file("extdata",
                                "respostas.yaml",
                                package = "provaXXXXXX")
  return(yaml::read_yaml(yaml_respostas))
}
