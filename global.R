library(shiny)
library(shinyWidgets)
library(shinyjs)
library(data.table)
library(ggplot2)
library(r2d3)
library(bsplus)
# library(shinyBS),

# LANGUAGE ----------------------------------------------------------------

lang <- "en"
if(lang=="dk"){
  source("ui/ui_dk.R", encoding = "UTF-8")
} else{
  source("ui/ui_en.R", encoding = "UTF-8")

}


# LOAD OBJECTS ------------------------------------------------------------

risk_table <- fread("data/risk_table_rounded.txt")
