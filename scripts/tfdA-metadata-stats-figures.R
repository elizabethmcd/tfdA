library(plyr)
library(reshape2)
library(tidyverse)
library(RColorBrewer)

metadata = read.csv("/Users/emcdaniel/Desktop/McMahon-Lab/tfdA/metadata/final-curated-tfdA-metadata.csv")

# frequency counts of environment and phylogenetic group for each genome
environment = metadata %>% 
  group_by(environment) %>% 
  filter(environment != "unknown") %>% 
  count()

group = metadata %>% 
  group_by(phylum) %>% 
  count() %>% 
  filter(n > 10)

# Environments plots

bar_env <- environment %>% ggplot(aes(x=reorder(environment, n), y=n)) + geom_col(fill="#19B4C3") + coord_flip() + scale_y_continuous(limits=c(0,250), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_env
ggsave(plot=bar_env, filename='figs/2021-02-26-tfdA-envs-plot.png', height=10, width=20, units=c('cm'))

# Phyla/groups plot
bar_phyla <- group %>% ggplot(aes(x=reorder(phylum, n), y=n)) + geom_col(fill="#0A62A6") + coord_flip() + scale_y_continuous(limits=c(0,602), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_phyla
ggsave(plot=bar_phyla, filename="figs/2021-02-26-tfdA-phyla-plot.png", height=10, width=20, units=c("cm"))

