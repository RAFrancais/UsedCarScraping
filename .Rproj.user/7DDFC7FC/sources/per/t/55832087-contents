library(robotstxt)
library(rvest)
library(selectr)
install.packages("xml2")
library(xml2)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(purrr)

tempestAccord <- read_html("")


tempestAccord %>% html_nodes("li") %>% html_nodes('')


###V8

link <- "https://www.autotempest.com/results?make=honda&model=accord&zip=90720&radius=300"
tempestAccord <- read_html("https://www.autotempest.com/results?make=honda&model=accord&zip=90720&radius=300")
tempestAccord %>% html_nodes("li") %>% h


#cars.com
carsLexus <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&rd=500&searchSource=QUICK_FORM&zc=92845")

carsPrice <- carsLexus %>% html_nodes(".listing-row__price") %>% html_text()
carsTitle <- carsLexus %>% html_nodes(".listing-row__title") %>% html_text()
carsMileage <- carsLexus %>% html_nodes(".listing-row__mileage") %>% html_text()

#2nd Page of Results
carsLexus2 <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&page=2&perPage=20&rd=500&searchSource=PAGINATION&sort=relevance&zc=92845")

carsPrice2 <- carsLexus2 %>% html_nodes(".listing-row__price") %>% html_text()
carsTitle2 <- carsLexus2 %>% html_nodes(".listing-row__title") %>% html_text()
carsMileage2 <- carsLexus2 %>% html_nodes(".listing-row__mileage") %>% html_text()

Lexusdf <- data.frame(carsPrice, carsTitle, carsMileage)
Lexusdf2 <- data.frame(carsPrice2, carsTitle2, carsMileage2)

names(Lexusdf2) <- c("carsPrice", "carsTitle", "carsMileage")
bindLexus <- rbind(Lexusdf, Lexusdf2)


bindLexus[,1] <- str_trim(bindLexus[,1])
bindLexus[,2] <- str_trim(bindLexus[,2])
bindLexus[,3] <- str_trim(bindLexus[,3])


Todo:
  remove "$" and ","
  Split off year
  remove mi and comma
  
  
  
  
  
  
