library(ggvis)
library(googleVis)
set.seed(123)

all_games %>%
  select(PTS, TRB, AST, Player, RSorPO) %>%
  rename(Assists=AST,
         Points=PTS,
         Rebounds=TRB) %>%
  gather(Stats, Value, 1:3) %>%
  ggvis(x = ~Value, fill = ~Stats) +
  layer_histograms(width =  input_slider(0, 2, step = 0.10, label = "width"),
                    center = input_slider(0, 2, step = 0.05, label = "center"))

  ggplot(aes(x=Value, fill=Stats)) +
  geom_histogram(stat="count") +
  xlim(0, 60) +
  facet_grid(Player ~ .) +
  labs(title="All-Time career stats", subtitle="Points, Rebounds and Assists", y="Count") +
  theme_bw() +
  theme(legend.position="bottom",
       axis.title.x=element_blank(),
       legend.title=element_blank())