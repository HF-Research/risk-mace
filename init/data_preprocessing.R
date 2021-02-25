library(data.table)
# DATA PREP ---------------------------------------------------------------

risk_table <- fread(input = "data/risk_table.txt")
risk_table[, risk := round(risk, digits = 1)]
risk_table[, index := tolower(paste0(age, sex, edu, dm, smoke_COPD, bp_lowering, lipid_lowering, antithromb))]

# Calculate risk for baseline "no risk factor" person for each age/sex
n <- length(unique(risk_table$age))
x <-
  data.table(age = as.character(rep(
    x = min(risk_table$age):max(risk_table$age),
    each = 2
  )),
  sex = rep(c("male", "female"), n))

for (i in unique(risk_table$age)) {
  x[age == i &
      sex == "male", index := tolower(paste0(i, "male", "postgraduate00000"))]
    x[age == i & sex == "female", index :=
        tolower(paste0(i, "female", "postgraduate00000"))]

}

base_risk <- merge(risk_table, x[, .(index)],by = "index")
setnames(base_risk, "risk", "risk_base")
risk_table  <- merge(risk_table, base_risk[, .(age, sex, risk_base)], all.x = TRUE, by = c("age", "sex"))

risk_table <- risk_table[, .(index, risk, risk_base)]
risk_table[, risk_percent_diff:= round((risk-risk_base)/risk_base*100, digits=0)]
risk_table[, risk_percent_point_diff:= round((risk-risk_base), digits=1)]

risk_table[, risk_relative:= round(risk/risk_base, digits = 1)]
setkey(risk_table, index)
write.table(x = risk_table,
            file = "data/risk_table_rounded.txt",
            row.names = FALSE)


# CSS PREPERATION ---------------------------------------------------------

# In order to have a common CSS template for all HFs shiny apps, we create use a
# common css template that has all classes and such defined. Any references to
# element IDs goes in the second, app specific css file.
css_common <-
  readLines(con = "https://raw.githubusercontent.com/matthew-phelps/hf-css/main/css-main.css")
css_app_specific <-
  readLines(con = "https://raw.githubusercontent.com/matthew-phelps/hf-css/main/stroke-risk-patient.css")


writeLines(text = c(css_common, css_app_specific),
           con = "www/css-app-specifc.css")
