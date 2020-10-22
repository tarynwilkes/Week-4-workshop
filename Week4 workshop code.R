#Read in chaff.txt
chaff <- read.table("chaff.txt", header = T)
chaff

library(tidyverse)

#tidy data
chaff2<- chaff %>% 
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())
chaff2

#work out means
tapply(chaff2$mass, chaff2$sex, mean)
#females   males 
#20.480  22.275

#analyse the data
t.test(chaff2$mass~chaff2$sex, paired = T)
#t = -2.5168, df = 19, p-value = 0.02098
#p= 0.02098 < 0.05 therefore significant

#create a box plot
fig1 <- chaff2 %>% ggplot(aes(x=sex, y=mass)) +
  geom_boxplot()
fig1

# figure saving settings
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

#then write the figure to file
ggsave("fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)



