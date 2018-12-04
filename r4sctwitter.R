#the basics
install.packages("tidyverse")
library(tidyverse)
install.packages("rtweet")
library(rtweet)
#https://rud.is/books/21-recipes/extracting-tweet-entities.html
#favorite code
#searching for top ten hashtags used in conjunction with #sustainablebusiness
sustainability <- search_tweets("#sustainablebusiness", n=300)
select(sustainability, hashtags) %>% 
  unnest() %>% 
  mutate(hashtags = tolower(hashtags)) %>% 
  count(hashtags, sort=TRUE) %>% 
  filter(hashtags != "sustainability") %>% 
  top_n(10)
