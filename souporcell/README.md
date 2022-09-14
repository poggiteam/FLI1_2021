# ETV6_2020 : Souporcell analysis

## Overview

This repository contains the instruction to reproduce Souporcell analysis reported in the article.
Required data and builded Singularity image are respectively available in GEO and Zenodo. 
Intructions to reproduce the analysis are provided below.

To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis step by step (see "Run the analysis" section below).

## Setup

### Prerequisites (System system & containers and data)

Singularity container images are available in zenodo : https://doi.org/10.5281/zenodo.6980009

In order to prepare the environment for analysis execution, it is required to:

<ul>
<li> Clone the github repository and set the WORKING_DIR environment variable</li> 
<li> Download the singularity images tar file</li> 
<ul>
<li> souporcell singularity images : https://zenodo.org/record/6980009/files/souporcell_latest.sif?download=1</li>
</ul> 
<li> Get the pre-processed data
<li> Get the reference genome
</ul>

<b>1) Clone the github repository</b>

Use you favorite method to clone this repository in a chosen folder. This will create a "ETV6_2020" folder with all the source code. You must set an environment variable called WORKING_DIR with a value set to the path to this folder.

On linux:
<pre><code>export WORKING_DIR=/enter/here/your/path/</pre></code>



<b>2) Download the image</b>

Docker images tar files are stored on Zenodo. Open a shell command and change dir to the root of the cloned Git repository. Then execute the following commands to download the images tar files:


<pre><code>wget https://zenodo.org/record/6980009/files/souporcell_latest.sif?download=1</pre></code>


<b>3) Get the pre-processed data</b>
The pre-processed data is already partially in github directory you cloned, you will need to:<br>
Download or produce the pre-processed data (cellRanger results) <br>
Pre-processed data (CellRanger results) are available on GEO (accession ID : GSE206089): <br>
<ul>
  <li>Binary aligment map (BAM) </li>
	<li>mRNA count per cells : </li>
	<ul>
		<li>mRNA_barcodes.tsv.gz</li>
	</ul>
</ul>
If you prefer to perform the fastq data pre-processing, instructions are described in https://github.com/poggiteam/ETV6_2020/preprocessing <br>

## Run the Souporcell analysis 

Souporcell analysis needs 3 inputs that you have to download in "souporcell/data/" (for more details see,https://github.com/wheaton5/souporcell):
1- BAM file from cellranger output
2- "barcodes.tsv" file from cellranger output
3- Reference genome GRCh38-2020-A (available on zenodo : https://zenodo.org/record/6980009/files/refdata-gex-GRCh38-2020-A.tar.gz
?download=1)

Run the analysis

<pre><code>$WORKING_DIR/singularity exec souporcell_latest.sif souporcell_pipeline.py -i $WORKING_DIR/ETV6_2020/souporcell/data/possorted_genome_bam.bam -b $WORKING_DIR/seurat_analysis/data/mRNA/raw/barcodes.tsv -f $WORKING_DIR/ETV6_2020/souporcell/data/GRCh38-2020-A.fa -o $WORKING_DIR/ETV6_2020/souporcell/outputs/ -k 4 -t 20</pre></code>


##### Ouputs

Once the analysis done, the results should be in you $WORKING_DIR/ETV6_2020/souporcell/outputs/ folder. Seurat analysis will use "clusters.tsv" as only souporcell input.
This .tsv, result file is already present in the github output directory. Produced souporcell outputs objects will also be saved to this folder.
