library(plyr)
library(reshape2)
library(tidyverse)
library(RColorBrewer)

metadata = read.csv("/Users/emcdaniel/Desktop/McMahon-Lab/tfdA/metadata/hits-metadata/tfdA-all-genomes-metadata.csv")

# pull out the Bart and Weigand data sets, because did large-scale studies of human associated bordetella isolates with long read sequencing, skews the plots
filtered = metadata %>% filter(reference != 'Bart study' & reference != 'Weigand study')

# frequency counts of environment and phylogenetic group for each genome
environment = count(filtered, "source")
group = count(filtered, "group")

# Environments plots
longEnvs = spread(environment, source, freq)
longEnvs$built_env_eng = longEnvs$built_environment + longEnvs$engineered
longEnvs$unknown_isolates = longEnvs$unknown + longEnvs$isolate
envCounts = longEnvs %>% select(animal_associated, freshwater, human_associated, marine, plant_associated, subsurface, symbiont, terrestrial, wetlands, built_env_eng, unknown_isolates)
envList = gather(envCounts, "source", "freq")

bar_env = envList %>% ggplot(aes(x=reorder(source, freq), y=freq)) + geom_col(aes(fill=freq)) + scale_fill_gradient(low="cornsilk", high="#003c30") + coord_flip() + scale_y_continuous(limits=c(0,375), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_env
ggsave(plot=bar_env, filename='figs/2020-08-26-tfdA-envs-plot.png', height=10, width=20, units=c('cm'))

# Phyla/groups plot
longPhyla = spread(group, group,freq)
longPhyla$other =  longPhyla$`Candidatus Latescibacteria` + longPhyla$Unclassified + longPhyla$Gemmatimonadetes + longPhyla$Acidobacteria + longPhyla$`Candidatus Tectomicrobia` + longPhyla$`PVC Superphylum` + longPhyla$Proteobacteria + longPhyla$Deltaproteobacteria + longPhyla$`Candidatus Eremiobacteraeota`
phylaCounts = longPhyla %>% select(Alphaproteobacteria, Betaproteobacteria, Actinobacteria, `Candidatus Rokubacteria`, Gammaproteobacteria, other)
phylaList = gather(phylaCounts, "group", "freq")

bar_phyla = phylaList %>% ggplot(aes(x=reorder(group, freq), y=freq)) + geom_col(aes(fill=freq)) + scale_fill_gradient(low="rosybrown2", high="navyblue") + coord_flip() + scale_y_continuous(limits=c(0,650), expand = c(0, 0)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank())
bar_phyla

# select freshwater
freshwater = filtered %>% filter(source == 'freshwater')
