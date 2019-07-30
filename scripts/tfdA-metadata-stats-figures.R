library(tidyverse)
library(plyr)

metadata = read.csv("/Users/emcdaniel/Desktop/McMahon-Lab/tfdA/data/metadata/all-tfdA-metadata.csv")

environment = count(metadata, "environment")
group = count(metadata, "group")

# Environments plots
envColfunc = colorRampPalette(c("palegreen3", "slateblue"))
bar_env = environment %>% ggplot(aes(x=reorder(environment, freq), y=freq)) + geom_bar(stat="identity", fill=(envColfunc(9))) + coord_flip() + scale_y_continuous(limits=c(0,700), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_env

# Phyla/groups plot
phylaColfunc = colorRampPalette(c("khaki1", "orchid4"))
bar_phyla = group %>% ggplot(aes(x=reorder(group, freq), y=freq)) + geom_bar(stat="identity", fill=(phylaColfunc(16))) + coord_flip() + scale_y_continuous(limits=c(0,700), expand= c(0,0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_phyla
