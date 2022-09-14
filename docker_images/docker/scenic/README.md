<h2>This image contains</h2>
<ul><li>pySCENIC version 0.11.2</li>
<li>Jupyter Notebook </li></ul>



<h3>1- Get the docker image</h3>

<b> You can 
<ul><li>Use our docker image</b></li>

#####   Download the image

<pre><code>wget https://zenodo.org/record/6980009/files/pyscenic0112.tar?download=1 -o $WORKING_DIR/ETV6_2020/docker_images/docker/scenic/pyscenic0112.tar</pre></code>

#####   Load the image
<pre><code>docker load < pyscenic0112.tar</pre></code>
</ul>
<b>OR 
<ul><li>use the docker file to produce your own with the following steps : </b></li>

#####   Compile the image
<pre><code>docker build -t scenic <WORKING_DIR>/ETV6_2020/docker_images/docker/scenic</pre></code>

#####   Save the image
<pre><code>docker save scenic ><WORKING_DIR>/ETV6_2020/docker_images/docker/scenic/pyscenic0112.tar</pre></code>
</ul>

<h3>2- RUN THE IMAGE</h3>

<pre><code>docker run -d --name scenic -p 8888:8888 -v $WORKING_DIR/:$WORKING_DIR/ scenic</pre></code>

###   Extra tips
#####   Change directory permission to be able to save the outputs
<pre><code>sudo chmod - R 777 $WORKING_DIR</pre></code>

#####   Get back the token 
<pre><code>docker exec scenic jupyter notebook list</pre></code>
