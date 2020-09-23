
## 4A


library(stringr)
bookstore = read.delim("https://www.gbcnv.edu/bookstore/2020-Fall.txt",header=F)
bookstore = subset(bookstore,select = -c(V1,V5,V9,V12,V13))
names(bookstore)[1:8] = c('dept', 'coursenum' ,'title' ,'room'  ,'last' ,'first' ,'enrolled' ,'capacity')



## 4B


write.csv(bookstore, "bookstore.csv")


## 4C.1


library('haven')
us_countries = read_dta('us_counties.dta')
set1.1 = us_countries[1:round(dim(us_countries)[1]*0.7),]
set1.2 = us_countries[(round(dim(us_countries)[1]*0.7)+1):dim(us_countries)[1], ]



## 4C.2



set2.1 = us_countries[,1:2]
set2.2 = us_countries[,3:6 ]


