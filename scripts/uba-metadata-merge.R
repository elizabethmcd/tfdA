library(tidyverse)

samples = read.csv("~/Desktop/Parks2017-sample-metadata.csv")
mags = read.delim("~/Desktop/Parks2017-uba-mags-metadata.tsv", sep="\t", header=TRUE)

colnames(samples)[1] = "SRA"
colnames(mags)[3] = "SRA"

combined = left_join(mags, samples, by="SRA")

write_delim(combined, "~/Desktop/Parks2017-UBA-full-metadata.tsv", delim="\t")

environments = combined %>% select(UBA.Genome.ID, Experiment.Title, Study.Title)

write_delim(environments, "~/Desktop/Parks2017-environmental-data.tsv", delim="\t")
