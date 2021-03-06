
# ```{r message = FALSE, warning = FALSE}
library(readr)
library(tidyverse)
library(gridExtra)
library(ggthemes)
# ```

## 1 Scatterplot
# ```{r}
load("Lesson9SU.RData")
# ```
# ```{r}
## this is a comment
## just need a graphic, no text necessary
dataset = inner_join(nbaall, salary, by = "Player")
head(dataset)
# ```

# ```{r}
dataset <- dataset %>% 
  mutate(salary = log(dataset$`Salary2019-20`), height = (as.numeric(substr(dataset$Ht, start = 1, stop = 1)) * 12) + (as.numeric(substr(dataset$Ht, start = 3, stop = 4))))
#head(dataset)
ggplot(dataset, aes(x = height, y = salary)) + geom_point(data = dataset, aes(color = Pos)) + geom_smooth(mapping=aes(color = Pos),method='lm',fill=NA)+ggtitle("NBA Player Salary on Height\n2019-2020")+
  theme(plot.title = element_text(hjust = 0.5))
# ```


## 2 Boxplots

# ```{r, fig.width=12, fig.height=8}

# this is a comment
# just need a graphic, no text required
#ggplot(dataset, aes(x = Pos, y = `Salary2019-20`)) + geom_boxplot()

is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 2 * IQR(x) | x > quantile(x, 0.75) + 2 * IQR(x))
}
dataset <- dataset %>%
  mutate(outlier = ifelse(is_outlier(`Salary2019-20`), Player, as.numeric(NA)) )
## now create the boxplot
ggplot(dataset, aes(x = reorder(Pos, `Salary2019-20`, FUN = median), y = `Salary2019-20`)) +
  stat_boxplot(geom = "errorbar", width = 0.75, coef = 1.5) + geom_boxplot() +
  scale_fill_manual(values=c("grey", "cyan"),
                    name = "NBA Final 2019") + geom_text(aes(label = outlier), na.rm = TRUE, size = 4,
                                                         angle = 45, hjust = -0.05, color = "blue") + ylim(0, 42000000) +
  labs(title="Salary Distribution by Players' Position, 2019-2020", x ="Position", y = "Salary in Dollars") +
  theme_few() +
  theme(text = element_text(size=50),plot.title = element_text(hjust = 0.5),
        legend.position="bottom")

# ```

## 3 Histograms

# ```{r, fig.height=20, fig.width=12}
# this is a comment
# just need a graphic, no text required
yelp = read.csv("http://www.stat.ucla.edu/~vlew/datasets/yelp3.csv")


g1 = ggplot(yelp[yelp$categories.0=="Vegan",],aes(x=stars,after_stat(density))) + geom_histogram(binwidth =0.5,fill="orange",colour='black',size=2) + ggtitle("Vegan Ratings",)+theme(text = element_text(size=50), plot.title = element_text(hjust = 0.5))+labs(x = "Yelp Rating")
g2 = ggplot(yelp[yelp$categories.0=="Buffets",],aes(x=stars,after_stat(density))) + geom_histogram(binwidth =0.5,fill="blue",colour='black',size=2) + ggtitle("Buffet Ratings",)+theme(text = element_text(size=50), plot.title = element_text(hjust = 0.5))+labs(x = "Yelp Rating")
g3 = ggplot(yelp[yelp$categories.0=="Sports Bars",],aes(x=stars,after_stat(density))) + geom_histogram(binwidth =0.5,fill="maroon",colour='black',size=2) + ggtitle("Sports Bars Ratings",)+theme(text = element_text(size=50), plot.title = element_text(hjust = 0.5))+labs(x = "Yelp Rating")

grid.arrange(g1,g2,g3, nrow=3)
# ```

## 4 Multiple Line Graph, Stacked Data

# ```{r}

# this is a comment
# just need a graphic, no text required
AAPL2020 <- AAPL %>%
  slice(1227:1256) %>% ## heh, slicing apple...
  select(Date, Open, High, Low, Close) %>%
  pivot_longer(-Date, names_to = "status", values_to = "price")
ggplot(data=AAPL2020, aes(x = Date, y = price, color = status)) + geom_line() +
  labs(title="Apple (AAPL) Price in the past 30 days",
       caption="Source: Yahoo.com finance",
       y="Price in Dollars") +
  scale_x_date(date_breaks = "days" ,date_labels = "%m/%d") + theme_fivethirtyeight() + theme(axis.text=element_text(size=8, angle = 90))
# ```

# ```{r}
library(tidyquant)
library(tibble)
options("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)
getSymbols("COST", from = '2020-05-19',
           to = "2020-07-04",warnings = FALSE,
           auto.assign = TRUE)

COST <-  data.frame(COST)
COST <-  add_column(COST, Date = rownames(COST), .before = 1)
names(COST)[2:7] <-  c("Open","High","Low","Close","Volume","Adj Close")
rownames(COST) <- 1:nrow(COST)

#COST[c("Date","Open","High","Low","Close","Adj Close","Volume")]

COST2020 <- COST %>%
  select(Date, Open, High, Low, Close) %>%
  pivot_longer(-Date, names_to = "status", values_to = "price")

COST2020$Date <- as.Date(COST2020$Date)

ggplot(data=COST2020, aes(x = Date, y = price, color = status)) + geom_line() +
  labs(title="COST (COST) Price in the past 30 days",
       caption="Source: Yahoo.com finance",
       y="Price in Dollars") +
  scale_x_date(date_breaks = "days" ,date_labels = "%m/%d") + theme_fivethirtyeight() + theme(axis.text=element_text(size=8, angle = 90))
# ```

