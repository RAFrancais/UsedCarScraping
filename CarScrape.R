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


#cars.com
carsLexus <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&rd=500&searchSource=QUICK_FORM&zc=92845")

carsPrice <- carsLexus %>% html_nodes(".listing-row__price") %>% html_text()
carsTitle <- carsLexus %>% html_nodes(".listing-row__title") %>% html_text()
carsMileage <- carsLexus %>% html_nodes(".listing-row__mileage") %>% html_text()


carscombined <- carsLexus %>% html_nodes(c(".listing-row__price", ".listing-row__title", ".listing-row__mileage")) %>% html_text()






#2nd Page of Results
carsLexusp2 <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&page=2&perPage=20&rd=500&searchSource=PAGINATION&sort=relevance&zc=92845")

carsPrice2 <- carsLexus2 %>% html_nodes(".listing-row__price") %>% html_text()
carsTitle2 <- carsLexus2 %>% html_nodes(".listing-row__title") %>% html_text()
carsMileage2 <- carsLexus2 %>% html_nodes(".listing-row__mileage") %>% html_text()

Lexusdf <- data.frame(carsPrice, carsTitle, carsMileage)
Lexusdf2 <- data.frame(carsPrice2, carsTitle2, carsMileage2)

names(Lexusdf2) <- c("carsPrice", "carsTitle", "carsMileage")
bindLexus <- rbind(Lexusdf, Lexusdf2)

noprice <- subset(bindLexus, carsPrice == "Not Priced")  
pricedlexus <- subset(bindLexus, carsPrice != "Not Priced")

pricedlexus[,1] <- gsub("//$" , "",pricedlexus[,1])
pricedlexus[,c(2,4)] <- str_split_fixed(pricedlexus[,2], " ", 2)



bindLexus[,1] <- str_trim(bindLexus[,1])
bindLexus[,2] <- str_trim(bindLexus[,2])
bindLexus[,3] <- str_trim(bindLexus[,3])

bindLexus[,1] <- gsub("," , "",bindLexus[,1])
bindLexus[,1] <- gsub("$" , "",bindLexus[,1])


bindLexus[,1] <- gsub("$" , "",bindLexus[,1])


bindLexus[,3] <- gsub("mi." , "",bindLexus[,3])
bindLexus[,3] <- gsub("," , "",bindLexus[,3])


  
  










