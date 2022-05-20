library(plyr)
library(reshape2)
library(tidyverse)
library(RColorBrewer)
library(ggpubr)

metadata = read.csv("/Users/emcdaniel/Desktop/McMahon-Lab/tfdA/metadata/final-curated-tfdA-metadata.csv")

# frequency counts of environment and phylogenetic group for each genome
environment = metadata %>% 
  group_by(environment) %>% 
  filter(environment != "unknown") %>% 
  count()

group = metadata %>% 
  group_by(specific_group) %>% 
  count()

# Environments plots

bar_env <- environment %>% ggplot(aes(x=reorder(environment, n), y=n)) + geom_col(fill="#19B4C3") + coord_flip() + scale_y_continuous(limits=c(0,250), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())

env_pretty <- bar_env + 
  scale_x_discrete(breaks=c("isolate", "marine", "plant_associated", "terrestrial", "human_associated", "freshwater", "engineered", "wetlands", "subsurface", "symbiont"), labels=c("Isolate", "Marine", "Plant Associated", "Terrestrial", "Human Associated", "Freswhater", "Engineered System", "Wetlands", "Subsurface", "Symbiont")) + 
  ylab("Number of Genomes") + 
  xlab("Source") + 
  theme_pubr() + 
  theme(axis.title.y=element_text(face="bold"), axis.title.x=element_text(face="bold"), plot.margin = margin(10, 50, 10, 10))

env_pretty

ggsave(plot=bar_env, filename='figs/2021-02-26-tfdA-envs-plot.png', height=10, width=20, units=c('cm'))

# Phyla/groups plot
bar_phyla <- group %>% ggplot(aes(x=reorder(specific_group, n), y=n)) + geom_col(fill="#0A62A6") + coord_flip() + scale_y_continuous(limits=c(0,602), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_phyla

phyla_pretty <- bar_phyla + 
  ylab("Number of Genomes") + 
  xlab("Phyla") + 
  theme_pubr() + 
  theme(axis.title.y=element_text(face="bold"), axis.title.x=element_text(face="bold"), plot.margin = margin(10, 50, 10, 10))

phyla_pretty

ggsave(plot=bar_phyla, filename="figs/2021-02-26-tfdA-phyla-plot.png", height=10, width=20, units=c("cm"))

# Arrange in a grid 
tfdA_grid <- ggarrange(env_pretty, phyla_pretty, ncol=1, align=c("v"))

ggsave("figs/tfdA_metadata_grid.png", tfdA_grid, height=30, width=20, units=c("cm"))
