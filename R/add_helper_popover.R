add_helper_popover <- function(x, help_text) {

  shinyInput_label_embed(
    x,
    htmltools::tags$i(class = "far fa-question-circle fa-2x",
                      style = "color: #b2bfc3")
    %>%
      # bs_attach_modal(id_modal = "modal")
      bs_embed_tooltip(help_text, html = TRUE)
  )
}
