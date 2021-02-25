missing_inputs_ui <- function(id) {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  tagList(

            htmlOutput(ns("missing_inputs")))
}
