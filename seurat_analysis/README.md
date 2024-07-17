# FLI1_2021 : Seurat analysis

## Overview

This repository describes how the scRNAseq data Seurat analysis was performed. 
It contains the instructions and material to reproduce the analysis reported in the article. 
<br>Source code is available in the github repository (FLI1_2021/seurat_analysis/script). 
<br>Required data and builded Docker images are available in SRA/GEO and Zenodo. 
Intructions to reproduce the analysis are provided below.

To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis as explained in the "Run the analysis" section below.

## Setup

### Prerequisites (Docker system & containers and data)

Docker container image is available on zenodo : https://zenodo.org/record/6980009/files/Seurat4.tar?download=1<br>
Pre-processed data is available in github and GEO (...) : https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=... <br>


In order to prepare the environment for analysis execution, it is required to:

<ul>
	<li> Clone the github repository and set the WORKING_DIR environment variable</li> 
	<li> Download the RStudio / Seurat docker image tar file</li> 
	<li> Load the docker image on your system</li> 
	<li> Download Cellranger and CITE-seq-count results (available in GEO : ...) or pre-processed fastq data</li> 
</ul>

<h2>1) Clone the github repository</h2>
Use your favorite method to clone this repository in a chosen folder. This will create a "FLI1_2021" folder with all the source code. You must set an environment variable called WORKING_DIR with a value set to the path to this folder.

On linux:
<pre><code>export WORKING_DIR=/enter/here/your/path/</pre></code>



<h2>2) Download the docker images</h2>
Docker image tar file is stored on Zenodo. Open a shell command and change dir to the root of the cloned Git repository. Then execute the following commands to download the images tar files to the right project folder:

<pre><code>wget https://zenodo.org/record/6980009/files/Seurat4.tar?download=1 -o $WORKING_DIR/FLI1_2021/docker_images/docker/seurat/Seurat4.tar</pre></code>

<h2>Load docker images</h2>
In order to execute analysis, you must load the provided docker images onto your Docker. Docker must be installed on your system. See https://docs.docker.com/install/ for details on Docker installation. Open a shell command, change dir to the folder in which you cloned the project and type:

<pre><code>docker load -i $WORKING_DIR/FLI1_2021/docker_images/docker/seurat/Seurat4.tar</pre></code>

Those commands will take some time. 

<h2>Get the pre-processed data</h2>
The pre-processed data is already (partially, ".mtx.gz" files are missing for mRNA data) in github directory you cloned, alternatively, you can:<br>
Download or produce the pre-processed data (CellRanger / CITE-seq-count results) <br>
Pre-processed data (CellRanger / CITE-seq-count results) are available on GEO (accession ID : ...)

If you prefer to perform the fastq data pre-processing, instructions are described in https://github.com/poggiteam/FLI1_2021/tree/main/preprocessing/Readme.md <br>


### Run the R/Seurat analysis  

Analysis can be directly run inside docker containers by compiling Rmarkdown files. The Rmarkdown file compilation will launch the required analysis for the step and produce a final HTML report.

<b>Input</b>

Pre-processed data is already in github. Alternatively, it can be generated following detailed commands to run fastq preprocessing are given in the "fastq_pre-processing" directory or directly downloaded in GEO (accession ID : ...). 
<ul>
	<li>mRNA count per cells : </li>
	<ul>
		<li>mRNA_barcodes.tsv.gz</li>
		<li>mRNA_features.tsv.gz</li>
		<li>mRNA_matrix.mtx.gz</li>
	</ul>
	<li>HTO count per cells :</li> 
	<ul>
		<li>HTO_barcodes.tsv.gz</li>
		<li>HTO_features.tsv.gz</li>
		<li>HTO_matrix.mtx.gz</li>
	</ul>
</ul>

If downloaded or generated (need to copy or move files in the directories listed below), mRNA and HTO files have to be in separated directories as following:
<ul>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/HTO/barcodes.tsv.gz</li>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/HTO/features.tsv.gz</li>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/HTO/matrix.mtx.gz</li>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/mRNA/barcodes.tsv.gz</li>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/mRNA/features.tsv.gz</li>
	<li> <WORKING_DIR>/FLI1_2021/seurat_analysis/data/mRNA/matrix.mtx.gz</li>
</ul>


Rmd scripts to run :
<WORKING_DIR>/FLI1_2021/seurat_analysis/script/


<b>Output</b>

After running the analysis, the ouput directory will contain:
<ul>
	<li> 5 Seurat objects (intermediate and final)</li>
	<li> Some DEG analysis result csv files and save objects : Their names always start by FindMarkers (or FindAllMarkers) followed by an explicit naming of the comparison made</li>
	<li> metadata informations stored in Seurat objects</li>
</ul>



<b>Execution</b>

To run the Seurat analysis, ensure you have correctly downloaded the pre-processed data in the folder <WORKING_DIR>/FLI1_2021/seurat_analysis/data/mRNA and <WORKING_DIR>/FLI1_2021/seurat_analysis/data/HTO. 

To get into the RStudio environnement and run the analysis, just open the scripts: Files>Open


<b>Results</b>

Once the analysis done, the results should be in your WORKING_DIR/FLI1_2021/seurat_analysis/output/ folder.
