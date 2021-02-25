output_risk <- function(data, msg, is_data_valid){
  # Outputs results if age is valid, if not - gives warning to enter age


  if(is_data_valid)
    msg <- ifelse(data < 0.1,
           paste0("<0.1%"),
           paste0(sprintf(
             "%.1f",
             round(data,
                   digits = 1)
           ),
           "%"))
    return(msg)
}
