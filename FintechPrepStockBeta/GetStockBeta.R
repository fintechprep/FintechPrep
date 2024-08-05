#install.packages("tidyquant") -- https://cran.r-project.org/web/packages/tidyquant/tidyquant.pdf
#install.packages("tidyverse") --https://www.tidyverse.org/
#install.packages("ggplot2") -- https://ggplot2.tidyverse.org/
#install.packages("openslsx")
library(tidyquant)
library(tidyverse)
library(ggplot2)
library(openxlsx)

rm(list=ls())

stockData<-tq_get("ACC.NS", from = "2022-01-01", to = "2022-12-31")
stockData<-select(stockData,-c(open,high,low,volume,adjusted))

indexData<-tq_get("^NSEI", from = "2022-01-01", to = "2022-12-31")
indexData<-select(indexData,-c(open,high,low,volume,adjusted))

stockReturns<-stockData %>%
               group_by(symbol) %>%
                 tq_transmute(select = close, mutate_fun = periodReturn,
                              period="daily",col_name="stockReturns")
                              
indexReturns<-indexData %>%
  group_by(symbol) %>%
  tq_transmute(select = close, mutate_fun = periodReturn,
               period="daily",col_name="indexReturns")

stockDataReturns<-inner_join(stockData,stockReturns,by=c("symbol"="symbol","date"="date"))
stockIndexDataReturns<-inner_join(stockDataReturns,indexReturns,by=c("date"="date"))
stockIndexDataReturns<-stockIndexDataReturns %>% 
                        rename (
                                 stockSymbol = symbol.x,
                                 stockPrice = close,
                                 stockReturns = daily.returns.x,
                                 indexSymbol = symbol.y,
                                 indexReturns = daily.returns.y
                        )
stockIndexDataReturns<-stockIndexDataReturns[-1,]
#write.xlsx(stockIndexDataReturns,'C:/Users/anih0/Desktop/data.xlsx')
