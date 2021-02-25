shinyServer(function(input, output, session) {
  index <- reactive({
    req(
      input$user_age,
      input$sex,
      input$edu,
      input$dm,
      input$smoking,
      input$bp_lowering,
      input$lipid_lowering,
      input$antithromb
    )
    tolower(
      paste0(
        input$user_age,
        input$sex,
        input$edu,
        input$dm,
        input$smoking,
        input$bp_lowering,
        input$lipid_lowering,
        input$antithromb
      )
    )
  })

  is_data_valid <- reactive({
    any_missing <- any(
      is.na(input$user_age),
      is.na(input$sex),
      is.null(input$edu),
      is.null(input$dm),
      is.null(input$smoking),
      is.null(input$bp_lowering),
      is.null(input$lipid_lowering),
      is.null(input$antithromb))
      if (!any_missing)
        return(TRUE)
    return(FALSE)
  })

  n_missing_inputs <- reactive({

    sum(c(
      is.na(input$user_age),
      is.na(input$sex),
      is.null(input$edu),
      is.null(input$dm),
      is.null(input$smoking),
      is.null(input$bp_lowering),
      is.null(input$lipid_lowering),
      is.null(input$antithromb)
    ))
  })

    is_baseline <- reactive({
      x <- index()
      paste0(
        input$edu,
        input$dm,
        input$smoking,
        input$bp_lowering,
        input$lipid_lowering,
        input$antithromb
      ) == "postgraduate00000"
    })
    results_server("results",
                   index,
                   reactive(input$user_age),
                   is_baseline,
                   is_data_valid)
    missing_inputs_server("missing_inputs",
                   reactive(input$user_age),
                   is_data_valid,
                   n_missing_inputs)

    showModal(
      modalDialog(
        title = "NOTICE!",
        easyClose = TRUE,
        fade = TRUE,
        tags$p(tags$b("This tool is only for people who: ")),
        tags$li("Have no history of heart disease (including atrial fibrillation,
                stroke, heart failure, ischemic heart disease, or peripheral
                artery disease)"),
        tags$li("Are between 30 - 85 years old"),
        tags$br(),
        footer = NULL,
        modalButton("Yes, I understand")

      )
    )
})
