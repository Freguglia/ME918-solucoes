emv_df <- function(sample_list){
  data.frame(i = seq_along(sample_list),
             emv = purrr::map_dbl(sample_list, mean))
}
