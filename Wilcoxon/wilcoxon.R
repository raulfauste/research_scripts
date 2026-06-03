################################################################################
# Author: Raul Fauste Jimenez
# Date: 02/06/2026
# Title: Wilcoxon non-parametric signed-rank test (paired version).
################################################################################

library(readxl)

########################### PARAMETERS #########################################
# * Path of the results. Two columns, old, new.
# * Confidence value, by default 0.95. Typically 1 - alpha.

path = "example\\path\\excel.xlsx"
confValue <- 0.95

############################# BODY #############################################

data <- read_excel(path, col_names=TRUE, col_types = "numeric")

result <- wilcox.test(data$new, 
                      data$old, 
                      paired = TRUE,
                      conf.level = confValue,
                      conf.int = TRUE)

print(result)

############################# GRAPHICS #########################################


differences <- data$new - data$old

boxplot(differences, 
        main = "Difference distribution (ALG2 - ALG1)",
        ylab = "Objective Function difference",
        col = "lightblue", 
        las = 1,
        outline = FALSE,
        ylim = c(min(differences), max(differences)))

abline(h = 0, col = "red", lty = 2, lwd = 2)

stripchart(differences[differences != 0], 
           method = "jitter", 
           jitter = 0.25,      
           vertical = TRUE, 
           add = TRUE, 
           pch = 21,           
           bg = "gray",        
           col = "black")
