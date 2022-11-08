library(tidyverse)
library(naniar)

# Read in data ---------------------
nov_data <- read_csv("nov-data.csv")



glimpse(nov_data)


nov_data %>% 
  select(starts_with("WEEK"), ARM) %>%
  vis_miss() +
  facet_wrap(~ ARM )


nov_data %>% 
  select(starts_with("WEEK")) %>%
  gg_miss_upset(nsets = n_var_miss(nov_data))



ggplot(nov_data,
       aes(x = WEEK27,
           y = WEEK48)) +
  geom_miss_point() + 
  facet_grid(BMIGR ~ AGEGR) +
  theme_light()


ggplot(nov_data,
       aes(x = AGE,
           y = WEEK48)) +
  geom_miss_point() + 
  facet_grid(BMIGR ~ ARM )



gg_miss_var(nov_data)


gg_miss_var(nov_data,
            facet = ARM, show_pct = TRUE)




gg_miss_case(nov_data, order_cases = TRUE, facet = ARM)


gg_miss_fct(x = nov_data, fct = ARM)

