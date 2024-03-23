#packages list 
pacman::p_load(tidyverse, #general data handling
               here, #easy file referencing
               ggplot2, #plots
               gridExtra) #arrange multiple ggplots

#loading data
here::i_am("code/02_make_figure1.R")

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

#making figure 1
options(scipen = 999) #removes scientific notation

figure_one <- data %>%
  ggplot( aes(x=ADMYR, fill=PREG)) +
  geom_histogram(color="#e9ecef",
                 alpha=0.6,
                 position = 'identity',
                 stat = "count",
                 binwidth = NULL) +
  scale_fill_manual(values = c("#c994c7", "#a6bddb", "#1c9099")) + #re run with this line
  stat_count(binwidth = 1,
             position = position_stack(vjust = 0.5)) +
  ggtitle("Admission to SUD treatment among reproductive aged women, 2000-2021",
          subtitle = "Data source: TEDS-A") + 
  labs(y = "Frequency", x = "Admission Year") +
  guides(fill=guide_legend(title="Pregnancy Status")) + 
  theme(axis.text.x = element_text(angle = 90)) #shifting x-axis label

#save figure 1
ggsave(
  here::here("figures/figure_one.png"),
  plot = figure_one,
  device = "png"
)

