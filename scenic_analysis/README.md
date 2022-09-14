# ETV6_2020: SCENIC analysis

## Overview

This repository contains the instruction to reproduce SCENIC analysis reported in the article.
Required data and builded Docker images are respectively available in GEO and Zenodo. 
Intructions to reproduce the analysis are provided below.

To reproduce the analysis, you have to first, prepare the environments (see "Prerequisites" section below), then execute the analysis step by step (see "Run the analysis" section below).

## Setup

### Prerequisites (Docker system & containers and data)

Docker container image is available in zenodo : https://zenodo.org/record/6980009/files/pyscenic0112.tar?download=1

Raw count expression matrix file is available in Zenodo : https://zenodo.org/record/6980009/files/SCENIC_inputs.tar?download=1


In order to prepare the environment for analysis execution, it is required to:

<ul>
	<li> Clone the github repository and set the WORKING_DIR environment variable</li> 
	<li> Download the docker images tar file</li> 
		<ul>
			<li>SCENIC docker image : https://zenodo.org/record/6980009/files/pyscenic0112.tar?download=1</li>
		</ul>
	<li> Load the docker images on your system</li> 
	<li> Download the raw expression matrix obtained after Seurat analysis</li> 
</ul>

<h2>1)Clone the github repository</h2>
Use you favorite method to clone this repository in a chosen folder. This will create a "ETV6_2020" folder with all the source code. You must set an environment variable called WORKING_DIR with a value set to the path to this folder.

On linux:
<pre><code>export WORKING_DIR=/enter/your/path/here/</pre></code>



<h2>2)Download the docker images</h2>
Docker images tar file are stored on Zenodo. Open a shell command and change dir to the root of the cloned Git repository. Then execute the following commands to download the images tar files to the right project folder:

<pre><code>wget https://zenodo.org/record/6980009/files/pyscenic0112.tar?download=1 -o $WORKING_DIR/ETV6_2020/docker_images/docker/scenic/pyscenic0112.tar</pre></code>

<h2>Load docker images</h2>
In order to execute analysis, you must load the provided docker images onto your Docker. Docker must be installed on your system. See https://docs.docker.com/install/ for details on Docker installation. Open a shell command, change dir to the folder in which you cloned the project and type:

<pre><code>docker load -i $WORKING_DIR/ETV6_2020/docker_images/docker/scenic/pyscenic0112.tar</pre></code>

Those commands will take some time. 

<h2>Download the raw expression matrix</h2>

Raw count expression matrix file is available in Zenodo: https://zenodo.org/record/6980009/files/SCENIC_inputs.tar?download=1 
Alternatively, this expression matrix can be produced within R and Seurat.


### Run the SCENIC analysis

The analysis will be performed in a jupyter notebook. The corresponding notebook is avalable here: 
https://github.com/poggiteam/ETV6_2020/scenic_analysis/script/ETV6_2020_pySCENIC_analysis.ipynb


<b>Input</b><br>
Input files have to be download to <WORKING_DIR>/scenic_analysis/data/
<ul>
	<li> Raw expression matrix file : https://zenodo.org/record/6980009/files/SCENIC_inputs.tar?download=1</li>
	<li> All other required files are available in this github under "data" or in the zenodo download. 
	<ul>
		<li> data/hg19-tss-centered-10kb-7species.mc9nr.feather !!1Gb!!</li> 
		<li> data/motifs-v9-nr.hgnc-m0.001-o0.0.tbl </li> 
		<li> data/hs_hgnc_tfs.txt is already in this git </li></li> 
	</ul>
</ul>

<br>
<b>Execution</b><br>
1) Run "scenic" docker container
<pre><code>docker run -d --name scenic -p 8888:8888 -v $WORKING_DIR:$WORKING_DIR scenic</pre></code>
2) Use the "SCENIC_analysis.ipynb" jupyternotebook present in /ETV6/scenic_analysis/script/ folder to reproduce the analysis
<br>
<br>
<b>Results</b><br>
Once the analysis done, you may obtain all the output files in <WORKING_DIR>/ETV6/scenic_analysis/output directory.
<br>
<ul>
<li> regulons.p</li>
<li> motifs.csv</li>
<li> expr_mat.adjacencies.csv</li>
<li> regulons.tsv</li>
<li> auc_mtx.csv</li>
</ul>

auc_mtx.csv, is the only file used for downstream seurat analysis. You can find our scenic output files in zenodo.
