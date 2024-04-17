# FLI1_2021 : FASTQ preprocessing

## Overview

This repository contains the instructions and material to reproduce fastq pre-processing reported in the article. 
Required data and Singularity images are respectively available in SRA and Zenodo. 
Intructions to reproduce the analysis are provided below.

To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis described in the "Run the analysis" section below.

<i><b>If you don't want to redo data pre-processing directly go to "seurat_analysis"</b></i>

## Setup

### Prerequisites

Docker container images are available in zenodo : 
<li>CellRanger : https://zenodo.org/record/6980009/files/cellranger5.img?download=1 </li>
<li>CITE-seq-Count : https://zenodo.org/record/6980009/files/citeseq-count1.4.3.img?download=1 </li>

Raw fastq files are available in SRA (....) 
Transcriptome is available at 10xGenomics website (https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz) and in Zenodo (https://zenodo.org/record/6980009/files/refdata-gex-GRCh38-2020-A.tar.gz?download=1)

<pre><code>
#Download the transcriptome files
wget https://zenodo.org/record/6980009/files/refdata-gex-GRCh38-2020-A.tar.gz?download=1
</pre></code>

<br>
In order to prepare the environment for analysis execution, it is required to:

<ul>
	<li> Clone the github repository and set the WORKING_DIR </li> 
	<li> Download the singularity images</li> 
		<ul>
			<li>CITE-seq-count singularity image : https://zenodo.org/record/6980009/files/citeseq-count1.4.3.img?download=1 (to use with HTO fastq files)</li> 
			<li>CellRanger singularity image : https://zenodo.org/record/6980009/files/cellranger5.img?download=1 (to use with mRNA fastq files)</li> 
		</ul>
	<li> Load the singularity image you need on your system</li> 
	<li> Download the 8 fastq files</li> 
</ul>

<h3>1) Clone the github repository</h3>
Use you favorite method to clone this repository in a chosen folder. This will create a "FLI1_2021" folder with all the source code. 

You must set an environment variable called WORKING_DIR with a value set to the path to this folder.

On linux:
<pre><code>export WORKING_DIR=/enter/your/path/here</pre></code>

<h3>2) Download the singularity images</h3>
Singularity images are stored on Zenodo. Open a shell command and change dir to the root of the cloned Git repository. Then execute the following commands to download the images tar files to the right project folder:

<pre><code>wget https://zenodo.org/record/6980009/files/cellranger5.img?download=1 

wget https://zenodo.org/record/6980009/files/citeseq-count1.4.3.img?download=1 </pre></code>


<h3>3) Launch singularity image</h3>
Singularity must be installed on your system.
In order to execute analysis, you must first launch the singularity image you want to use (See below). 


<h3>4) Download the FASTQ files </h3>
Fastq files available on SRA (accession ID : .......) can be processed with CellRanger (mRNA) or CITE-seq-count (HTO).

## Run the analysis 
 
### Cellranger analysis

Output will be generated in the <WORKING_DIR>/preprocessing/output

<b>Input</b>

Fastq files are avaible in SRA (...).
Pre-processed data can be generated following detailed commands to run fastq preprocessing are given in the "preprocessing" directory or directly downloaded in GEO (accession ID : GSE <i>To be completed </i>).

<b>Output</b>

The ouput directory contains the classical cellranger output with the preprocessed data that is used later in the Seurat analysis and a hmtl report.
<ul>
    <li>mRNA count per cells : </li>
    <ul>
    <li>mRNA_barcodes.tsv.gz</li>
    <li>mRNA_features.tsv.gz</li>
    <li>mRNA_matrix.mtx.gz</li>
    </ul>
</ul>

<b>Execution</b>

To run the cellranger analysis, ensure you have correctly downloaded the fastq files in the folder <WORKING_DIR>/preprocessing/data/ and run the following command:

<pre><code>
# Launch singularity image
singularity shell <WORKING_DIR>/FLI1_2021/docker_images/singularity/cellranger/cellranger5.img

bash

# Go to the ouput directory
cd <WORKING_DIR>/FLI1_2021/preprocessing/output

#Run cellranger
cellranger count --id=FLI1_2021-42-set3-GRCh38 --transcriptome=../data/cellranger_GRCh38/refdata-cellranger-GRCh38-2020-A/  --fastq=../data/ --sample=mRNA --expect-cell=10000

</pre></code>

<b>Results</b>

Once the analysis done, you should get result files in the <WORKING_DIR>/FLI1/preprocessing/output folder  (with the newly created "FLI1_2021-42-set3-GRCh38" folder)



### CITE-seq-count analysis

Output will be generated in the <WORKING_DIR>/preprocessing/output where <WORKING_DIR> is the folder where you clone the git repository (and set the WORKING_DIR environment variable).

<b>Input</b>

Fastq files are avaible in SRA (...).
Pre-processed data can be generated following detailed commands to run fastq preprocessing are given in the "0_fastq_pre-processing" directory or directly downloaded in GEO (accession ID : GSE<i> To be completed </i>). 


<b>Output</b>

The ouput directory contains:
<ul>
	<li>HTO count per cells :</li> 
	<ul>
		<li>HTO_barcodes.tsv.gz</li>
		<li>HTO_features.tsv.gz</li>
		<li>HTO_matrix.mtx.gz</li>
	</ul>
</ul>

<b>Execution</b>

To run the CITE-seq-count analysis, ensure you have correctly downloaded the fastq files in the folder <WORKING_DIR>/preprocessing/data/ and run the following command:

<pre><code># Get barcodes list from cell ranger. 
# this file is already present in the data directory, if you want to reproduce it use (else skip it) :
zcat <WORKING_DIR>/FLI1_2021/preprocessing/FLI1_2021-42-set3_GRCh38/outs/raw_feature_bc_matrix/barcodes.tsv.gz ><WORKING_DIR>/FLI1_2021/preprocessing/data/barcodes_cellranger_nofilter_2021-42-set3.tsv

# Go to the image directory 
cd <WORKING_DIR>/FLI1_2021/docker_images/singularity/CITE-seq-count/

# Start the image
singularity shell citeseq-count1.4.3.img

bash

# Go to the ouput directory
cd <WORKING_DIR>/FLI1_2021/preprocessing/output

# Run CITE-seq-count
CITE-seq-Count -R1 <WORKING_DIR>/FLI1_2021/preprocessing/data/S000001_HTO_S1_L001_R1_001.fastq.gz -R2 <WORKING_DIR>/FLI1_2021/preprocessing/data/S000001_HTO_S1_L001_R2_001.fastq.gz -t <WORKING_DIR>/FLI1_2021/preprocessing/data/HTO_tags.csv -cbf 1 -cbl 16 -umif 17 -umil 26 --max-errors 2 --whitelist <WORKING_DIR>/FLI1_2021/preprocessing/data/barcodes_cellranger_nofilter_2021-42-set3.tsv -cell 40000 -T 12 -o CITE-seq-count143_output
</pre></code>

<b>Results</b>

Once the analysis done, you should get result files in the <WORKING_DIR>/FLI1_2021/preprocessing/output folder (with the newly created "CITE-seq-count143_output" folder)

You need to perform these analyses for each run (Run325 Run331 2021-42-set3 and 2021-42-set5).
