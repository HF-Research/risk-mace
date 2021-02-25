results_server <- function(id, index, user_age, is_baseline,is_data_valid) {
  moduleServer(id,
               ## Below is the module function
               function(input, output, session) {
                 txt2num <- reactive({
                   as.numeric(user_age())
                 })

                 subsetData <- reactive({
                   req(user_age(), index())
                   risk_table[index() == index,
                              .(risk, risk_percent_point_diff, risk_relative)]
                 })


                 # output$enter_age <- renderText(enterAge())


                 output$risk_txt_1 <- renderText({
                   req(user_age(), index())
                   ui_risk_txt_1
                 })
                 output$risk_txt_2 <- renderText({
                   req(user_age(), index())
                   paste0(ui_risk_explain_1,
                          subsetData()$risk * 10,
                          ui_risk_explain_2)
                 })

                 output$risk_percentage <- renderUI({
                   req(is_data_valid())
                   HTML(paste0(
                     '<span style=font-size:5rem;>',
                     output_risk(subsetData()$risk, msg = enter_info, is_data_valid()),
                     '</span>'
                   ))
                 })

                 output$risk_base_txt <- renderText({
                   req(user_age(), index())
                   if (is_baseline() | subsetData()$risk_relative < 1)
                     return("")
                   if (subsetData()$risk_relative == 1)
                     return(ui_rr_explain_same_1)
                   paste0(ui_rr_explain_1,
                          subsetData()$risk_percent_point_diff,
                          ui_rr_explain_2)
                 })

                 output$rr_txt_1 <- renderUI({
                   req(user_age(), index())

                   no_rr <-
                     is_baseline() | subsetData()$risk_relative <= 1
                   if (no_rr)
                     return("")

                   HTML(paste0(ui_rr_explain_3,
                               '<span style=font-size:3.5rem;>',
                          subsetData()$risk_relative,
                          '</span>',
                          ui_rr_explain_4))
                 })


               })
}
