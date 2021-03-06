#install.packages("treemap")
library(treemap)
library(tidyverse)


df<-read_csv("../datasets/marbles.csv")

df_gp<-df %>%
  group_by(team_name) %>%
  summarise(mean_team = mean(points, na.rm = T))

png(filename="team.png",width=800, height=800)
treemap(df_gp,
        index = c("team_name"),
        vSize ="mean_team",
        title = "Team Points",
        fontsize.title = 14,
        fontsize.labels=c(10,5))
dev.off()
