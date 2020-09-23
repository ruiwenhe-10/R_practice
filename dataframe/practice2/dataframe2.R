## If you want to run this on your own computer, you'll need to install the package "prettydoc" you can read more about it on https://prettydoc.statr.me/

library(dplyr)
library(knitr)

STmostrecent = read.csv('STmostrecent.csv')
STdensity = read.csv('STdensity.csv')



## 2A

# I’m going to think of question and to help me answer that question I will need to calculate a Covid- 19 death rate for each state (divide the population size by one hundred thousand this will be called the quotient. Then I will divide the number of death by the quotient. This gives the death rate of Covid-19 cases per 100,000 people.) By showing you the steps, I hope this will help you to answer your question using data.

## 2B


COlevel = read.csv('COlevel.csv')
COmostrecent = read.csv('COmostrecent.csv')

combined <- inner_join(COlevel,COmostrecent, by = c('county','state'))
head(combined,10)


# This one requires code mostly.  If you want to say something about it, you can.

## 3A

# Just text for answer.  This should be short.
# 
# There might be some counties that no one is diagnosed with Covid-19. Therefore, when taking the intersection. The number of row in combined set would be lower.

## 3B


STjan20 = read.csv("STjan20.csv")
STfeb20 = read.csv("STfeb20.csv")
STmar20 = read.csv("STmar20.csv")
STjanEX1 = left_join(combined[,c(2,32)], STjan20, by = "state")
STjanEX2 = right_join(combined[,c(2,32)], STjan20, by = "state")
STfebEX1 = left_join(combined[,c(2,32)], STfeb20, by = "state")
STfebEX2 = right_join(combined[,c(2,32)], STfeb20, by = "state")
STmarEX1 = left_join(combined[,c(2,32)], STmar20, by = "state")
STmarEX2 = right_join(combined[,c(2,32)], STmar20, by = "state")


## For each right_join dataframe, the number of row increase from 213 to 690, then to 2991. From January to March, the number of states is increasing.


# 3B needs code and some text in English which states how the numbers change.  Give
# us the numbers and then write something like "they are increasing."  Again, this should
# be really brief


# If you want R to print the numbers in your text instead of you copying them (and possibly making an error)  use a backtick and r like:

# ```{r}
## this is an example only, do not include it in your submission
x <- 300
x2 <- c(120, 100, 80)
# ```

# The number of cases is `r x` where x is a constant
# 
# 
# The number of cases is `r sum(x2)` where we used the result of a function
# 
# In either case, just needs to be valid r code.  So like the cases are `r x2[2]` will also work.

## 3C

# ```{r 3C}
C.1 = left_join(COlevel, COmostrecent, by = c("state","county"), all.x  = TRUE)
C.2 = right_join(COlevel, COmostrecent, by = c("state","county"), all.y = TRUE)
# ```

# ```
# Left join set has 3143 rows. And Right set has 3060 rows. The reason of difference is thatthere might be some counties that no one is diagnosed with Covid-19. Therefore, when doing right join. The number of row in dataset would be lower.
# ```

# 3C needs code and some text in English which gives some values and your opinion  Again, this should be really brief.  Why I do I want you to combine numbers and text?  This is the communication aspect of many jobs involving data and statistics and programming.  You need practice explaining these things to others, not just to graders who already know the answer....
