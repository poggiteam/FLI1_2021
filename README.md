# ETV6_2020

Article: Single cell characterization of megakaryopoiesis: new insights into ETV6-related thrombocytopenia

Authors: 

Appartenances. 

Link to the article, first on biorXiv then Pubmed. 

Citation:

## Overview 

This repository contains instructions and material to reproduce the analysis reported in the article. Source code is available in the github repository. Required data and Docker images are available in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories: 

  - FASTQ preprocessing is described in "preprocessing" directory
  - Seurat analysis is described in "seurat_analysis" directory
  - SCENIC analysis is described in "scenic_analysis" directory

## Data avaibility

### FASTQ preprocessing

  - 8 FASTQ files are available in SRA under the accession number ............
    - 4 FASTQ files of paired-end reads sequenced from the mRNA libraries
      - 2 FASTQ files for the 2020-42-set1 mRNA library
      - 2 FASTQ files for the 2020-42-set2 mRNA library
    - 4 FAST files of paired-end reads sequenced from the HTO libraries
      - 2 FASTQ files for the 2020-42-set1 HTO library
      - 2 FASTQ files for the 2020-42-set2 HTO library
  - Cellranger and CITE-seq-count outputs are available in GEO (GSE206089): 
    - Cellranger outputs: 
      -  2020-42-set1 outputs are available under accession number GSM6241530
      -  2020-42-set2 outputs are available under accession number GSM6241532
    - CITE-seq-count outputs:
      -  2020-42-set1 outputs are available under accession number GSM6241529
      -  2020-42-set2 outputs are available under accession number GSM6241531

### Seurat analysis 

Seurat html reports containing figures generated in R and Seurat scripts Rmd can be download on this repository

### SCENIC analysis 

  - pySCENIC analysis output is available on Zenodo: link ! 
  - python notebook to reproduce analysis is available on this repository
  - Docker container is available on Zenodo: link ! 
  - Instructions to reproduce analysis are available under "scenic_analysis" repository

### Docker

All Docker images are available in Zenodo: link !
