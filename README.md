# Diversity and Distribution of _tfdA_
 
 Project repository for investigating the diversity and distribution of micoorganisms harboring the _tfdA_ marker for 2,4-D degradation. This project is part of a collaboration between the McMahon, Remucal, and Koch labs at UW-Madison with Amber White and Lily Gonzalez-Vazquez. 

## Dependencies 

- [genomes-MAGs-database](https://github.com/elizabethmcd/genomes-MAGs-database) Workflow
- [NCBI Genome Download Tool](https://github.com/kblin/ncbi-genome-download)
- [HMMER](http://hmmer.org/download.html)
- [Prodigal](https://github.com/hyattpd/Prodigal)
- [Prokka](https://github.com/tseemann/prokka) 
- [metabolisHMM](https://github.com/elizabethmcd/metabolisHMM)
- [EMPRESS](https://github.com/biocore/empress)

## General Workflow 

Genome assemblies and metagenome-assembled genomes (MAGs) were searched from Genbank, and genomes containing confident _tfdA_ hits were downloaded as described [here](https://github.com/elizabethmcd/genomes-MAGs-database). ORFs were predicted with Prodigal and functional annotations performed with Prokka. The _tfdA_ HMM was downloaded from the KEGG database (K06912) collection of HMMs found within the [KofamKOALA](https://www.genome.jp/tools/kofamkoala/) release. This resulted in over 200,000 genomes to search for _tfDA_ against. Downstream phylogenetic and metabolic analyses were performed with the [metabolisHMM](https://github.com/elizabethmcd/metabolisHMM) package. The hits were refined by creating a custom HMM based on experimentally verified isolates that degrade 24D and contain _tfdA_ and then searching those hits for required domains, since the KEGG HMM of tfdA had some tauD outgroups. A tree of the identified TfdA proteins was then constructed with RaxML and visualized with EMPRESS overlaying the environmental and taxonomical metadata for each hit. 