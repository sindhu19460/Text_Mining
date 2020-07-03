#install.packages("rvest")
library(rvest)
library(XML)
library(magrittr)
#aurl is variable


aurl<-"https://www.snapdeal.com/product/micromax-canvas-fire-3-8gb/631229493009?supc=SDL374546619&utm_source=earth_web&utm_medium=175_7070&utm_content=631229493009&vendorCode=S982d9&isSellerPage=true&fv=true&utm_source=earth_display&utm_campaign=snapdeal_display_dr_d2_7_visitors_rest_7d_ftu&utm_term=389341475462_79654914717&gclid=EAIaIQobChMI1Mzwjq_86QIVANZMAh20BAz8EAEYASAEEgLLofD_BwE"
snapdeal_reviews<-NULL
for(i in 1:10){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>% #output of data passes
    html_nodes(".review-text") %>%
    html_text()
  snapdeal_reviews<-c(snapdeal_reviews,rev) #rev is use to pass on the data
}
write.table(snapdeal_reviews,"snapdeal.txt",row.names=F)
getwd() #directorie

