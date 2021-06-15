

# Using the data from the lesson, solve the following tasks:

# What if the question was: is the competitor open rate EXACTLY 40%. What would be the decision then?

# 1. Test at 5% significance. Comment on the decision with the appropriate statistical jargon.
# 2. Test at 1% significance. Comment on the decision with the appropriate statistical jargon.

# Hint: Think about what type of test would be suitable here (one- or two-sided).

library(psych)

rate <- read.csv("ttest-a.csv") # load your data
describe(rate) # understand your data

my.t.test <- function(a, hmean){
  t <- (mean(a) - hmean)/(sd(a)/sqrt(length(a)))
  return(t) # create the test
}

my.t.test(rate$Open.rate, 0.4)

# H0 = open rate is NOT 40%
# H1 = open rate is 40%
# The problem is a two-sided test
# T = 0.53
# t1 = 2.26 Accept the null. At the 5% significance level we cannot say that the competitor's open rate is 40%
# t2 = 3.25 Accept the null. The test on that sample shows that at 1% significance, our competitor's open rate is not 40%.

