ui <- div(
  tags$head(

    # TODO: Include JS script to add link to diff lang versions
    includeScript("www/checkBrowser.js")

  ),
  fluidPage(
    tags$a(
      img(
        src = "hf_logo_en.svg",
        align = "left",
        style = "padding-top: 20px; padding-bottom: 40px; padding-left: 1rem;",
        height = "110px"
      ),
      href = "https://hjerteforeningen.dk/", target ="_blank"),

    div(style = "padding-left: 0px; padding-right: 0px;",
        titlePanel(
          title = "", windowTitle = tags$head(
            tags$link(rel = "icon", type = "image/png", href = "hf-icon.png"),
            tags$title("HjerteTjek")
          )
        ))
  ),

  useShinyjs(),
  # use_bs_popover(),
  use_bs_tooltip(),
  navbarPage(
    title = "HjerteTjek",
    collapsible = TRUE,
    theme = "css-app-specifc.css",
    tabPanel(title = ui_main,
             fluidRow(
               # STROKE-INPUT-------------------------------------------------------------------
               column(
                 id = "input_col",
                 6,
                 wellPanel(
                   id = "tPanel",
                   style = "overflow-y:scroll; max-height: 75vh",
                   class = "well_input",
                   shinyWidgets::radioGroupButtons(
                     inputId = "sex",
                     label = in_sex,
                     choiceNames = ui_sex_labels,
                     choiceValues = c('male', "female"),
                     checkIcon = list(yes = icon("check")),
                     selected =  "male",
                     # width = button.width,
                     justified = TRUE
                   ),
                   br(),
                   numericInput(
                     inputId = "user_age",
                     label = in_age,
                     min = 30,
                     max = 85,
                     value = "Age"
                   ),
                   br(),
                   shinyWidgets::radioGroupButtons(
                     inputId = "edu",
                     label = in_edu,
                     choiceNames = edu_choices,
                     choiceValues = c("basic", "secondary", "tertiary", "postgraduate"),
                     justified = TRUE,
                     direction = "vertical",
                     selected = ""
                   ) %>%
                     add_helper_popover(help_text = tp_edu),
                   br(),
                   yesNoButton(id = "bp_lowering", label = in_bp_lowering),

                   br(),
                   yesNoButton(id = "smoking", label = in_smoking) %>%
                     add_helper_popover(help_text = tp_smoking),
                   br(),
                   yesNoButton(id = "dm", label = in_dm),
                   br(),
                   yesNoButton(id = "lipid_lowering", label = in_lipid_lowering),
                   br(),
                   yesNoButton(id = "antithromb", label = in_antithromb)
                 )
               ),
               fluidRow(div(
                 class = "results_well",
                 div(
                   class = "results_header",
                   missing_inputs_ui("missing_inputs"),
                   results_ui("results")
                 )
               ))
             )),
    tabPanel(title = ui_about,
             about_ui("about_text"))

  )
)
