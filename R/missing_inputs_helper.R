missing_inputs_helper <-
  function(age,
           age_message,
           msg,
           is_data_valid,
           n_missing_inputs) {
    # Outputs results if inputs are all is valid, if not - gives warning to enter age


    # if (age_out_of_range(as.integer(age))) {
    #   return(age_message)
    # }
    paste0(msg,
           ". ",
           "<br><br>",
           missing_inputs_txt_1,
           " ",
           n_missing_inputs)
  }
