install.packages("xml2")

library(rvest)
library(xml2)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)


#cars.com
carslexus <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&rd=500&searchSource=QUICK_FORM&zc=92845")

carsprice <- carslexus %>% html_nodes(".listing-row__price") %>% html_text()
carstitle <- carslexus %>% html_nodes(".listing-row__title") %>% html_text()
carsmileage <- carslexus %>% html_nodes(".listing-row__mileage") %>% html_text()

#2nd Page of Results
carslexusp2 <- read_html("https://www.cars.com/for-sale/searchresults.action/?mdId=21025&mkId=20070&page=2&perPage=20&rd=500&searchSource=PAGINATION&sort=relevance&zc=92845")

carsprice2 <- carslexusp2 %>% html_nodes(".listing-row__price") %>% html_text()
carstitle2 <- carslexusp2 %>% html_nodes(".listing-row__title") %>% html_text()
carsmileage2 <- carslexusp2 %>% html_nodes(".listing-row__mileage") %>% html_text()

lexusdf <- data.frame(carsprice, carstitle, carsmileage)
lexusdf2 <- data.frame(carsprice2, carstitle2, carsmileage2)

names(lexusdf2) <- c("carsprice", "carstitle", "carsmileage")
bindlexus <- rbind(lexusdf, lexusdf2)


bindlexus[,1] <- str_trim(bindlexus[,1])
bindlexus[,2] <- str_trim(bindlexus[,2])
bindlexus[,3] <- str_trim(bindlexus[,3])

bindlexus[,1] <- gsub("," , "" , bindlexus[,1])

bindlexus[,3] <- gsub("mi." , "" , bindlexus[,3])
bindlexus[,3] <- gsub("," , "" , bindlexus[,3])


noprice <- subset(bindlexus, carsprice == "Not Priced")  
pricedlexus <- subset(bindlexus, carsprice != "Not Priced")
  


pricedlexus[,1] <- gsub("\\$" , "",pricedlexus[,1])
pricedlexus[,c(2,4)] <- str_split_fixed(pricedlexus[,2], " ", 2)

pricedlexus[,1] <- as.numeric(pricedlexus[,1])  
pricedlexus[,3] <- as.numeric(pricedlexus[,3])

lexuslm <- lm(carsprice ~ carsmileage, data = pricedlexus)
summary(lexuslm)








