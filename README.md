# FLI1_2021

Article: FLI1 and GATA1 govern TLN1 transcription: new insights into FLI1-related platelet disorders

Authors: Elisa Gabinaud, Laurent Hannouche, Mathilde Veneziano-Broccia, Johannes Van Agthoven, Justine Suffit, Julien Maurizio, Delphine Potier, Dominique Payet-Bornet, Delphine Bastelica, Elisa Andersen, Manal Ibrahim-Kosta, Timothée Bigot, Céline Falaise, Anne Vincenot, Pierre-Emmanuel Morange, Paul Saultier, Marie-Christine Alessi, Marjorie Poggi*

/*/ Corresponding authors 

<i> https://pubmed.ncbi.nlm.nih.gov/39744817/ </i>

Citation: <i> To be completed </i>

## Overview 

This repository contains instructions and material to reproduce the analysis reported in the article. Source code is available in the github repository. Required data and Docker images are available in SRA/GEO and Zenodo. Instructions to reproduce the analysis are provided in the different subdirectories: 

  - FASTQ preprocessing is described in "preprocessing" directory
  - Seurat analysis is described in "seurat_analysis" directory

## Data avaibility

### FASTQ preprocessing

  - 24 FASTQ files are available in SRA under the accession number GSE273210.
    - 12 FASTQ files of paired-end reads sequenced from the mRNA libraries
      - 4  FASTQ files for the 2021-42-set3 mRNA library
      - 8  FASTQ files for the 2021-42-set5 mRNA library
    - 12 FAST files of paired-end reads sequenced from the HTO libraries
      - 4 FASTQ files for the 2021-42-set3 HTO library
      - 8 FASTQ files for the 2021-42-set5 HTO library
  - Cellranger and CITE-seq-count outputs are available in GEO (GSE GSE273210): 
    - Cellranger outputs: 
      -  2021-42-set3 outputs are available under accession number GSM8424057
      -  2021-42-set5 outputs are available under accession number GSM8424058
    - CITE-seq-count outputs:
      -  2021-42-set3 outputs are available under accession number GSM8424055
      -  2021-42-set5 outputs are available under accession number GSM8424056

### Seurat analysis 

Seurat scripts Rmd can be download on this repository


### Images

All images are available in Zenodo: https://zenodo.org/uploads/12759766

