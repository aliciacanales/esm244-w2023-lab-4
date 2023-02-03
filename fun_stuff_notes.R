library(tidyverse)
library(knitr)
library(kableExtra)
library(tictoc)
library(furrr)
library(purrr)


# map helps us apply a function to multiple things

mtcars %>% 
  map(mean)%>% 
  kable() %>% 
  kable_classic()

mtcars %>% 
  map_dbl(mean) %>%  # dbl is short for double e.g numbers with decimal points
  head() %>% kable() %>%
  kable_classic()


mtcars %>% 
  split(mtcars$cyl) %>%   #split is a base R so not part of the tidyverse
  map(~lm(mpg~wt,data = .)) # the . is passed from the pipe with .x of map

by_cyl <- mtcars %>%  split(mtcars$cyl)  # Store the dataset for predictions
mods <- by_cyl %>%  map(~lm(mpg ~ wt, data = .))
predictions<-map2(mods, by_cyl, predict)

# Take my linear mods (first comma) and use the new data (second comma) to predict mpg


library(tictoc)
library(furrr)
plan(sequential)
#Run code to pause the computer for two seconds
tic()
test_slow<-future_map(c(2,2,2),~Sys.sleep(.x))
toc()




library(purrr)
x<-map(1:50,\(x) Sys.sleep(0.1),
       .progress=TRUE)
# Notice I used an anonymous function

