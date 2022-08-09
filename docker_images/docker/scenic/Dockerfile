ARG BASE_CONTAINER=jupyter/scipy-notebook:python-3.8.8
FROM $BASE_CONTAINER

MAINTAINER Timothée.Bigot (timothee.bigot@univ-amu.fr)

RUN pip install --upgrade pip && \
    pip install numpy==1.21.5 && \
    pip install cytoolz==0.11.2 && \
    pip install ctxcore==0.1.1 && \
    pip install pyscenic==0.11.1
