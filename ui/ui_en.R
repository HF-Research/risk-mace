ui_main <- "CVD Risk"
ui_about <- "About"



# MISSING INPUTS ----------------------------------------------------------
enter_info <- "Please enter your information"
missing_inputs_txt_1 <- "Number of questions remaining:"
age_message <- "Please enter an age between 30 and 85"

# INPUT TXT ---------------------------------------------------------------
enter_info <- "Please enter your information"
in_yesNo_choice <- c("No", "Yes")
in_age <- "How old are you? (30-85)"
in_bp_lowering <-
  "Have you taken prescription drugs for hypertension within the past year?"
in_smoking <-
  "Have you ever taken prescription drugs to reduce or stop smoking
OR do you have chronic obstructive pulmonary disease (COPD)?"
in_sex <- "What is your sex?"
in_dm <-
  "Have you ever taken prescription drugs against diabetes?"
in_edu <- "What's the highest education you've completed?"
in_lipid_lowering <-
  "Have you taken prescription drugs to lower your cholesterol within the past year?"
in_antithromb <-
  "Have you taken prescription antithrombotic drugs (medication that prevents
  blood clots) within the past year to lower your risk of heart attack or stroke?"

edu_choices <- c("Basic", "Secondary", "Tertiary", "Postgraduate")
ui_sex_labels <- c("Male", "Female")


# TOOLTIP TXT -------------------------------------------------------------

tp_edu <- "Basic = primary school<br><br>
Secondary = high school or vocational training<br><br>
Tertiary = Bachelor’s degree<br><br>
Postgraduate = Master’s degree or higher"

tp_bp_lowering <-
  "Defined as taking two or more antihypertensive medications
within 180 days"
tp_smoking <- "Click 'Yes' if either are true"

# RESULTS TXT -------------------------------------------------------------

ui_risk_txt_1 <-
  "Your estimated risk of having a cardiovascular event within
five years is:"

ui_risk_explain_1 <-
  "This means that "
ui_risk_explain_2 <-
  " out of 1000 patients with the same risk factors as you
  would experience their first cardiovascular disease event within 5 years."

ui_rr_explain_1 <-
  "Your estimated risk is "
ui_rr_explain_2 <-
  " percentage points higher than some the same age as you, but who does not
have any of the risk factors included in this model."

ui_rr_explain_same_1 <-
  "Your estimated risk is the same as someone who is the same age as you, but does
no have any of the risk factors included in this model."


ui_rr_explain_3 <-
  "This means your risk of having a cardiovascular disease event within five
years is "

ui_rr_explain_4 <-
  " times higher, as compared to someone the same age as you, but who has none
  of the risk factors included in this model."


# ABOUT SECTION -----------------------------------------------------------
about_header <- "About the risk calculator"
about_txt_1 <-
  "This calculator presents predicted 5-year risk of first time cardiovascular disease (CVD) outcomes for Danish individuals aged 30-85 years who have no previous CVD. For the purposes of this tool, a CVD outcome  is defined as either stroke, ischemic heart disease, heart failure, peripheral artery disease, or death due to any of the above. More details on the codes used to define  predictors and outcomes can be found in the scientific publication that this tool is based on.[1]"
about_txt_2 <-"The model this tool is based on was developed using nationwide administrative healthcare data, but it does not contain clinical and laboratory variables such as cholesterol or blood pressure. Therefore, it is easy to use in the community setting, but lacks information about modifiable risk factors, which could be pursued after consultation with a clinician."

about_txt_3 <- "Since the model was developed and validated on data from Danish individuals, the validity of this calculator for non-Danish users is undetermined."


references  <- "References:"
ref1 <-
  "Christensen DM, Phelps M, Gislason G et al. Prediction of first cardiovascular disease event in 2.9 million individuals using Danish administrative healthcare data: a nationwide, registry-based derivation and validation study. 2021"

