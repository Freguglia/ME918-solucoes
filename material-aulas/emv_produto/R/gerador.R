library(poisson918)
library(yaml)

configs <- yaml::read_yaml("config.yaml")

df <- experiment_pois(configs$params)
