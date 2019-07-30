# Diversity and Distribution of _tfdA_
 
 Project repository for investigating the diversity and distribution of micoorganisms harboring the _tfdA_ marker for 2,4-D degradation. This project is part of a collaboration between the McMahon, Remucal, and Koch labs at UW-Madison with Amber White and Lily Gonzalez-Vazquez. 

## Dependencies 

- [NCBI Genome Download Tool](https://github.com/kblin/ncbi-genome-download)
- [Prodigal](https://github.com/hyattpd/Prodigal)
- [Prokka](https://github.com/tseemann/prokka) 
- [metabolisHMM](https://github.com/elizabethmcd/metabolisHMM)

## General Workflow 

Metagenome-assembled genomes (MAGs) from select environments from which large-scale metagenomic sequencing and assembly were carried out were downloaded from Genbank, and all complete reference genomes from Refseq were download as described [here](https://github.com/elizabethmcd/genomes-MAGs-database). ORFs were predicted with prodigal and functional annotations performed with Prokka. The _tfdA_ HMM was downloaded from the KEGG database (K06912) collection of HMMs found within the [KofamKOALA](https://www.genome.jp/tools/kofamkoala/) release. The _tfdA_ marker was searched among nearly 30,000 genomes using the [metabolisHMM](https://github.com/elizabethmcd/metabolisHMM) package. 

All other scripts and files are for exploring the diversity and distribution of _tfdA_ hits and their broader ecological roles and evolutionary histories.