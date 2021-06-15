

library(tidyverse)
library(ggthemes)
install.packages("wesanderson")
library(wesanderson)
library(scales)

emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- factor(emp$gender)
emp$title <- factor(emp$title, levels = c("Senior Engineer", "Engineer", "Assistant Engineer", "Senior Staff", "Technique Leader", "Staff"), ordered = TRUE)

emp.a <- filter(emp, salary > 45000)

boxx <- ggplot(emp, aes(x = title, y = salary))
my.bp <- boxx + geom_boxplot(outlier.color = "orangered1", outlier.shape = 3) +
  geom_jitter(width = 0.3, aes(color = gender)) +
  ggtitle("Salary distribution", subtitle = "based on position and gender") +
  ylab("Salary") + xlab("Job position") + 
  theme_economist_white() + 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() + scale_y_continuous(labels = comma)

my.bp + scale_color_manual(values=wes_palette(name = "Darjeeling1", n = 2))

# or


my.bp + scale_color_brewer(palette="Set1")

# the palette is part of the RColorBrewer package which you should already have on your
# machines because it comes with the tidyverse