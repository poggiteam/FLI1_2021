This image contains:

- pyScenic 0.11.2

# ######################
     COMPILE THE IMAGE
# ######################

docker build -t workspace/Docker/Scenic

# ######################
     SAVE THE IMAGE
# ######################

docker save scenic>workspace/Docker/Scenic/pyscenic0112.tar

# ######################
     RUN THE IMAGE
# ######################

docker run -d --name scenic -p 8888:8888 -v /home/bigott/workspace:/home/bigott/workspace -e USER=$(whoami) -e USERID=$(id -u) -e GROUPID=$(id -g) scenic

# ######################
     TOKEN REVEALED
# ######################

docker exec scenic jupyter notebook list
