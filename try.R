#******************#
# Learn "stargazer"
#******************#

install.packages("stargazer")
library(stargazer)


# create a summary statistics table

stargazer(attitude)

stargazer(attitude[1:4, ], summary = FALSE, rownames = F)


## a single regression table with 3 side by side models
  # 2 OLS, 1 probit regression
  # set align == T, so coefficients in each col are aligned along decimal point


l1 <- lm(rating ~ complaints + privileges + learning + raises + critical, 
   data = attitude)

l2 <- lm(rating ~ complaints + privileges + learning, data = attitude)

# create n indicator dependent variable, then probit model
attitude$high.rating <- (attitude$rating > 70)
probit.model <- glm(high.rating ~ learning + critical + advance, data = attitude,
    family = binomial(link = "probit"))


stargazer(l1, l2, probit.model, title = "Results", align = T)



