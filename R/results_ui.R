# Module UI function
results_ui <- function(id) {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  tagList(

            textOutput(ns("risk_txt_1")),
            br(),
            htmlOutput(ns("risk_percentage")),
        br(),
        div(class = "output_desc", textOutput(ns("risk_txt_2"))),
        br(),
        div(class = "output_desc", textOutput(ns("risk_base_txt"))),
        br(),
        div(class = "output_desc", htmlOutput(ns("rr_txt_1")))



    )
}
