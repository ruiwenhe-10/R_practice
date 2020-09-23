
# ```{r echo = FALSE, message= FALSE}
# load("Lesson12.RData")
library(dplyr)
# ```


## Introduction 

# In this section, please outline your analysis of response time and identify which variables you chose to use.  Just use the English language here.  A few sentences will be enough.
# ```
# My target response time is amount of time it took for the fire department to arrive at the caller’s location(Call it SE1), which is the difference of "Response.DtTm" and "On.Scene.DtTm". I would show a table of response time for each supervised district before and after start date. And I would visualize the data using a boxplot.
# ```

## Coding 

# In this section, you'll read the data and construct the variable(s) that you need for your analysis.  For example, if you are interested in the amount of time it takes for people to reach the hospital after an emergency call and whether this was affected by Covid-19, your code should reflect your attempt to answer that question.

# ```{r}

## you are demonstrating how to "spin gold" here
load("Lesson12.RData")
library(dplyr)
library(lubridate)
FD12$START <- as.POSIXct(FD12$Response.DtTm,format = "%m/%d/%Y %I:%M:%S %p")
FD12$daySTART <- yday(FD12$START)
FD12$END <- as.POSIXct(FD12$On.Scene.DtTm,format = "%m/%d/%Y %I:%M:%S %p")
FD12$SE1 = FD12$END - FD12$START
library(DT)
set.seed(1)
datatable(FD12[sample(nrow(FD12), 10), c("Response.DtTm","On.Scene.DtTm", "SE1")])

# ```

## Analysis

# In this section, at minimum, provide us with a table of results.  Let's suppose you know a lot about San Francisco and want to order some geographic area by wealth (e.g., zip code, supervisor district etc. -- this is where factors could be helpful/useful) and then provide stats like median response time for each area.  That would be enough you could stop there and turn it in.

# If you wanted to take it a step further, you could make an attempt to construct a visualization (but that is totally optional)


# ```{r}
## at minimum a table of results
library(dplyr)
FD12 %>% select(Supervisor.District, daySTART, SE1) %>% group_by(Supervisor.District, daySTART < 77) %>% summarise(n = n(), median = median(SE1), IQR = IQR(SE1)) %>% arrange(as.numeric(Supervisor.District))
# ```


# ```{r optional}
## a visualization (totally optional)
library(ggplot2)
ggplot(data = FD12, aes(x = Supervisor.District, y = as.numeric(SE1)))+geom_boxplot()
ggplot(data = FD12, aes(x = as.numeric(SE1))) + geom_density() +facet_wrap(~ Supervisor.District)
# ```
# After analyzing, I found that there is some error in the raw data. In "On.Scene.DtTm", some time should be "pm" but actually "am". Therefore, there are some negative response time in the visualization.

