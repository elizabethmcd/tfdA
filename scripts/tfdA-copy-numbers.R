library(tidyverse)

counts <- read.delim("results/tfdA-genbank-counts.txt", sep="\t", header=FALSE)
metadata <- read.csv("metadata/tfdA-metadata-final.csv") %>% select(accession, name, source)

colnames(counts) <- c("accession", "tfdA_copies")

table <- left_join(metadata, counts)
isolates <- table %>% filter(source == "isolate")

ggplot(table, aes(x=tfdA_copies)) + geom_histogram(binwidth=0.5)
ggplot(isolates, aes(x=tfdA_copies)) + geom_histogram(binwidth=1)
