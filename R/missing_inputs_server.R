missing_inputs_server <-
  function(id,
           user_age,
           is_data_valid,
           n_missing_inputs) {
    moduleServer(id,
                 function(input, output, session) {
                   ## Below is the module function
                   output$missing_inputs <- renderUI({
                     req(!is_data_valid())

                     HTML(
                       '<span style=font-size:5rem;>',
                       missing_inputs_helper(
                         age = user_age(),
                         age_message = age_message,
                         msg = enter_info,
                         is_data_valid = is_data_valid(),
                         n_missing_inputs = n_missing_inputs()
                       ),
                       '</span>'
                     )
                   })
                 })
  }
