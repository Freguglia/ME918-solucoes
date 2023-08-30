purrr::walk(seq_along(planos), function(i){
  
  fname <- sprintf("resultados/simulacao%02d.RData", i)
  
  distribution <- planos[[i]]$distribution
  result <- amostras[[i]]
  
  if (distribution == "poisson"){
    lambda <- planos[[i]]$lambda
    save(distribution, lambda, result, file = fname)
    
  } else if(distribution == "bernoulli") {
    p <- planos[[i]]$p
    save(distribution, p, result, file = fname)
    
  } else {
    mu <- planos[[i]]$mu
    sigma2 <- planos[[i]]$sigma2
    save(distribution, mu, sigma2, result, file = fname)
  }
})
