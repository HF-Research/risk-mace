is_valid_age <- function(x) {
  !is.na(x) &&
    x >= 30 &&
    x <= 85 &&
    x %% 1 == 0
}
