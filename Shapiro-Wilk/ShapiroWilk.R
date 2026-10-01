library(readxl)

path = "example\\path"

data <- read_excel(path, col_names=TRUE, col_types = "numeric")

new <- data$NEW
old <- data$OLD

diferences <- new - old

shapiro_res <- shapiro.test(diferences)
print(shapiro_res)

