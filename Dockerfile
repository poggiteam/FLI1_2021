##################
##CITE-Seq-Count##
##################

FROM conda/miniconda3

LABEL version="1.4.5"

RUN apt-get update -y && \
    apt-get install -y build-essential && \
    pip install --upgrade pip && \
    pip install CITE-seq-Count==1.4.5