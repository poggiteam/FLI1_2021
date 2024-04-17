# FLI1_2021

Article: The transcription factor FLI-1 regulates TLN1 expression in megakaryocytes

Authors: Marjorie Poggi* <i> To be completed </i>

/*/ Corresponding authors 

<i> Link to the article. </i>

Citation: <i> To be completed </i>

## Overview 

This repository contains instructions and material to reproduce the analysis reported in the article. Source code is available in the github repository. Required data and Docker images are available in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories: 

  - FASTQ preprocessing is described in "preprocessing" directory
  - Seurat analysis is described in "seurat_analysis" directory

## Data avaibility

### FASTQ preprocessing

  - 56 FASTQ files are available in SRA under the accession number ......... (Accessible once published).
    - 28 FASTQ files of paired-end reads sequenced from the mRNA libraries
      - 4  FASTQ files for the 2021-42-set3 mRNA library
      - 8  FASTQ files for the 2021-42-set5 mRNA library
      - 8  FASTQ files for the Run325 mRNA library
      - 8  FASTQ files for the Run331 mRNA library
    - 28 FAST files of paired-end reads sequenced from the HTO libraries
      - 4 FASTQ files for the 2021-42-set3 HTO library
      - 8 FASTQ files for the 2021-42-set5 HTO library
      - 8 FASTQ files for the Run325 HTO library
      - 8 FASTQ files for the Run331 HTO library
  - Cellranger and CITE-seq-count outputs are available in GEO (GSE <i> To be completed </i>): 
    - Cellranger outputs: 
      -  2021-42-set3 outputs are available under accession number GSM <i> To be completed </i>
      -  2021-42-set5 outputs are available under accession number GSM <i> To be completed </i>
      -  Run325 outputs are available under accession number GSM <i> To be completed </i>
      -  Run331 outputs are available under accession number GSM <i> To be completed </i>
    - CITE-seq-count outputs:
      -  2021-42-set3 outputs are available under accession number GSM <i> To be completed </i>
      -  2021-42-set5 outputs are available under accession number GSM <i> To be completed </i>
      -  Run325 outputs are available under accession number GSM <i> To be completed </i>
      -  Run331 outputs are available under accession number GSM <i> To be completed </i>

### Seurat analysis 

Seurat scripts Rmd can be download on this repository


### Images

All images are available in Zenodo: https://zenodo.org/record/6980009

### Figures 

Two scripts are available for download in "script_figures" to re-create all R-computed figures in the article.
