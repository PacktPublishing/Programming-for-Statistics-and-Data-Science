

setwd("C:/Users/Simona/R/Data")

### Load the libraries you will need 

library(tidyverse) 
library(psych) # good for descriptives, remember? 

# this is an additional library I have included (I want to show you something super useful :))
library(scales) # new package! we will use this to create a custom format when plotting the data

### Load the data as a tibble (readr has a function that does this directly)

data <- read_csv("real_estate_price_size_year_view.csv")

### Get the descriptives for your data so you can understand what you're dealing with a little better

describe(data) # get a sense of your data
summary(data) # get a sense of your data


### Explore the data and see if there are any interesting trends to consider

point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE) # this helps us get rid of the scientific notation in the graph
ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)

### Define the linear model 

linmod <- lm(price~size, data = data)

### Plot the regression line

ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)


### Print the results of the model

summary(linmod)

### How many observations was the regression run on?

# 100. this is evident from the degrees of freedom (residual)
# degrees of freedom (residual) is calculated based on the sample size (n) minus the number of parameters (k) being estimated minus 1
# degrees of freedom (residual) = n - k - 1 
# 98 = n - 1 - 1 
# n = 100


### What is the R-squared of this regression? What does it tell you?

# Adjusted R-squared:  0.7421 - we only look at the adjusted R-squared because it is more reliabel.
# the adjusted R-squared increases only if the new term improves the model more than would be expected by chance
# it decreases when a predictor improves the model by less than expected by chance

# The value tells us that this regression model explains a big part of the variablity in the model (~75%)


### Determine if size is a statistically significant predictor of price. 

# Size is indeed a statistically significant predictor of price. This is evident from the p-value of the t-statistic.

### What is the regression equation associated with this regression model?

# y-hat = 101912.6 + 223.2*x1 

