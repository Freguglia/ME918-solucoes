f <- function(arg){
  if(arg$distribution == "poisson"){ 
    return(rpois(arg$obs, arg$lambda)) 
  } 
  else if(arg$distribution == "normal"){ 
    return(rnorm(arg$obs, arg$mu, sqrt(arg$sigma2)))
  } 
  else if(arg$distribution == "bernoulli"){
    return(rbinom(arg$obs, 1, arg$p))
  } 
  else{
    stop()
  }
}