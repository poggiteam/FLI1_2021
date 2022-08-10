<h2>This image contains</h2>
<ul><li>Rstudio v4.1.2</li>
<li>Seurat v4.1</li>
<li>Various packages (check the docker file for more infos)</li></ul>



<h3>1- Get the docker image</h3>

<b> You can 
<ul><li>Use our docker image</b></li>

#####   Download the image

<pre><code>wget https://zenodo.org/record/4114854/files/seurat301.tar?download=1 -o $WORKING_DIR/Images/docker/dpotier_B-ALL-CAR-T_seurat/seurat301.tar</pre></code>

#####   Load the image
<pre><code>docker load < Seurat4.tar</pre></code>
</ul>
<b>OR 
<ul><li>use the docker file to produce your own with the following steps : </b></li>

#####   Compile the image
For this step you will also need a userconf.sh file.
<pre><code>docker build -t Seurat4 <WORKING_DIR>ETV6/docker_images/docker/seurat/</pre></code>

#####   Save the image
<pre><code>docker save Seurat4 ><WORKING_DIR>/ETV6/docker_images/docker/seurat/Seurat4.tar</pre></code>
</ul>


<h3>2- RUN THE IMAGE</h3>


<pre><code>docker run -d --name Seurat4 -p 8787:8787 -v $WORKING_DIR/:$WORKING_DIR/ -e USER=$(whoami) -e USERID=$(id -u) -e GROUPID=$(id -g) Seurat4</pre></code>
