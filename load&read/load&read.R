## 1A

# ```{r include=FALSE}
library(foreign)
library(haven)
load('Lesson5.RData')
A.1 = read.spss("RN08_CNTY_data.sav",to.data.frame = T)
#cat("the number of row and columm are",dim(A.1))
# ```
# ```{r}
head(A.1)
head(subset(A.1, select = c(AGE_GP, RACE_GP, PREP_SUM_PUF, MAR_CHLD, TOTSAL, TOTRNHRS_YR)))
# ```


## 1B

# ```{r 1B}
library(haven)

B.1 = read_dta('us_counties.dta')
head(B.1)
cat("the number of row and column are",dim(B.1))
cat("columns are", colnames(B.1))
summary(B.1)
#subset(B.1,select = c(quantity,value))


# ```

## 1C

# ```{r 1C}

# this is a comment
C.1 = read_sas('us_states.sas7bdat')
head(C.1)
summary(subset(C.1,select=c(fips,cases,deaths)))
cat("the number of row and column are",dim(C.1))

# ```


## 1D

# ```{r 1D}
D.1 = read.delim("https://www.gbcnv.edu/bookstore/2020-Fall.txt",header=F)
D.1 = subset(D.1,select = -c(V1,V5,V9,V12,V13))
summary(D.1)
cat("the number of row and column are",dim(D.1))
# ```


## 2A

# ```{r 2A}
load(url("http://www.stat.ucla.edu/~vlew/datasets/ucpay2017.RData"))
head(uclaPayroll2017)
save(uclaPayroll2017,file = 'Lesson5.RData')
# ```

## 2B

# ```{r 2B}

# this is a comment
save(A.1,B.1,C.1,D.1, file = "2B.RData")
#load("2B.RData")
# ```
