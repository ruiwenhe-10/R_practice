# 2.  Typical tabling questions from a SQL interview

# Just write "yes" or "no" next to each question and if you wrote "yes", please indicate whether you could program it in base R, dplyr or both:
  # ```{r}
load(url("http://www.stat.ucla.edu/~vlew/datasets/ucpay2017.RData"))
library(dplyr)
library(DT)
# ```
### A.1 minimum "RegularPay" and          
# Yes, both
# 
# ### A.2 maximum "RegularPay" 
# Yes, both
# 
# ### B. Count all employees whose Position contains the string 'Prof'  (and not 'Profl'):
# Yes, base
# 
# ### C.1 total "Total Wages", 
# Yes, both
# 
# ### C.2 mean "Total Wages" 
# Yes, both
# ### C.3 median "Total Wages" 
# Yes, both
# ### D  Find the total and mean "RegularPay" for each unique Position which contains the string 'Prof' (and not 'Profl') and also has at least (at minimum) 40 employees (40 rows, observations).
# Yes, both

# 3. Optional

### A.

### B.

### C.

# 5. See how many you can answer now that you've read the entire lesson

### A.1 minimum "RegularPay" and 
# ```{r}
uclaPayroll2017 %>% summarise(RegularPay = min(RegularPay))
# ```
### A.2 maximum "RegularPay" 
# ```{r}
uclaPayroll2017 %>% summarise(RegularPay = max(RegularPay))
# ```

### B. Count all employees whose Position contains the string 'Prof'  (and not 'Profl'):

# ```{r}
length(uclaPayroll2017$RegularPay[grepl("Prof",uclaPayroll2017$Position)])
# ```

### C.1 total "Total Wages", 
# ```{r}
uclaPayroll2017 %>% summarise(TotalWages = sum(TotalWages))
# ```
### C.2 mean "Total Wages" 
# ```{r}
uclaPayroll2017 %>% summarise(TotalWages = mean(TotalWages))
# ```
### C.3 median "Total Wages" 
# ```{r}
uclaPayroll2017 %>% summarise(TotalWages = median(TotalWages))
# ```
### D  Find the total and mean "RegularPay" for each unique Position which contains the string 'Prof' (and not 'Profl') and also has at least (at minimum) 40 employees (40 rows, observations).

# ```{r}
prof = uclaPayroll2017[grepl("Prof",uclaPayroll2017$Position),]
a <- prof %>% group_by(Position) %>% count(Position)
pos_larger40 = a$Position[a$n>=40]
prof_large_40 = prof[prof$Position %in% pos_larger40, ]

prof_large_40 %>% group_by(Position) %>% summarise(
  MeanRegularPay = mean(RegularPay, na.rm = TRUE),
  totalRegularPay = sum(RegularPay)
)
# ```





