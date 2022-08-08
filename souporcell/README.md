# ETV6_2020 : Souporcell analysis

## Overview

This repository contains the instruction to reproduce Souporcell analysis reported in the article.
Required data and builded Singularity image are respectively available in GEO and Zenodo. 
Intructions to reproduce the analysis are provided below.

To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis step by step (see "Run the analysis" section below).

## Setup

### Prerequisites (System system & containers and data)

Singularity container images are available in zenodo : https://doi.org/10.5281/zenodo.4114854

In order to prepare the environment for analysis execution, it is required to:

<ul>
<li> Clone the github repository and set the WORKING_DIR environment variable</li> 
<li> Download the singularity images tar file</li> 
<ul>
<li> souporcell singularity images : https://zenodo.org/record/4114854/files/BAFExtract.tar?download=1 & https://zenodo.org/record/4114854/files/casperseurat315.tar?download=1</li>
</ul>
<li> Load the singularity images on your system</li>  
<li> Get the pre-processed data
<li> Get the reference genome
</ul>

<b>1) Clone the github repository</b>

Use you favorite method to clone this repository in a chosen folder. This will create a "ETV6_2020" folder with all the source code. You must set an environment variable called WORKING_DIR with a value set to the path to this folder.

On linux:
<pre><code>export WORKING_DIR=/enter/here/your/path/ETV6_2020</pre></code>



<b>2) Download the docker images</b>

Docker images tar files are stored on Zenodo. Open a shell command and change dir to the root of the cloned Git repository. Then execute the following commands to download the images tar files:


<pre><code>wget https://zenodo.org/record/4114854/files/BAFExtract.tar?download=1</pre></code>

<b>3) Load docker images</b>

In order to execute analysis, you must load the provided docker images onto your Singularity. Singularity must be installed on your system. Open a shell command, change dir to the folder in which you cloned the project and type:

<pre><code>docker load -i $WORKING_DIR/Images/docker/dpotier_B-ALL-CAR-T_casper/BAFExtract/BAFExtract.tar</pre></code>
<pre><code>docker load -i $WORKING_DIR/Images/docker/dpotier_B-ALL-CAR-T_casper/CaSpER/casperseurat315.tar</pre></code>

Those commands may take some time. 

<b>4) Get the pre-processed data</b>
The pre-processed data is already in github directory you cloned, alternatively, you can:<br>
Download or produce the pre-processed data (cellRanger results) <br>
Pre-processed data (CellRanger results) are available on GEO (accession ID : GSE153697): <br>
    - https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM4649255
<ul>
  <li>Binary aligment map (BAM) </li>
	<li>raw mRNA count per cells : </li>
	<ul>
		<li>mRNA_barcodes.tsv.gz</li>
		<li>mRNA_features.tsv.gz</li>
		<li>mRNA_matrix.mtx.gz</li>
	</ul>
</ul>
If you prefer to perform the fastq data pre-processing, instructions are described in https://github.com/Delphine-Potier/B-ALL-CAR-T/tree/master/fastq_pre-processing. <br>

## Run the Souporcell analysis 

CaSpER analysis needs 3 inputs (for more details see,https://github.com/wheaton5/souporcell):
1- BAM file from cellranger output
2- raw "barcodes.tsv" file from cellranger output (raw)
3- Reference genome GRCh38-2020-A (available on zenodo and on ....)

Run the analysis

<pre><code>$WORKING_DIR/singularity exec souporcell_latest.sif souporcell_pipeline.py -i $WORKING_DIR/possorted_genome_bam.bam -b $WORKING_DIR/seurat_analysis/data/mRNA/raw/barcodes.tsv -f $WORKING_DIR/GRCh38-2020-A.fa -o $WORKING_DIR/souporcell_outputs/ -k 4 -t 20</pre></code>


##### Ouputs

Once the analysis done, the results should be in you $WORKING_DIR/souporcell_outputs/ folder. Seurat analysis will use "clusters.tsv" as only souporcell input.
This .tsv, result file is already present in the github output directory. Produced souporcell outputs objects will also be saved to this folder.
