about_ui <- function(id) {
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  tagList(
    wellPanel(
      class = "explanitory_well",
      div(class = "results_header", about_header),
      br(),
      div(class = "explanitory_text", about_txt_1),
      br(),
      div(class = "explanitory_text", about_txt_2),
      br(),
      div(class = "explanitory_text", about_txt_3),
      br(),
    fluidRow(
      div(class = "ref_text", references),
      tags$ol(
        class = "ref_text",
        tags$li(ref1)))
    )
)
}
