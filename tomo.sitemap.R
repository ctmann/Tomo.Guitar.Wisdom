last updated <- 

library(xsitemap)
library(tidyverse)
library(clipr)

x <- xsitemapGet("https://tomovhxtv.vhx.tv/sitemap.xml")%>% 
  slice(10:n() ) %>% 
  mutate(my.basename  = str_remove(loc, "https://tomovhxtv.vhx.tv/")) %>% 
  separate(my.basename,
           into=c("series", "trashme", "title"),
           sep="/") %>% 
  mutate(title = str_replace_na(title, "landing.page") ) %>% 
  mutate(sort.id = row_number() ) %>% 
  select(sort.id,
         lastmod, 
         loc,
         series,
         title)

View(x)
glimpse(x)

x %>% 
  filter(lastmod > "2021-05-14") %>% View()

write_clip(x)