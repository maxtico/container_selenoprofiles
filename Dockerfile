# Use an official Miniconda image as a parent image
FROM continuumio/miniconda3

RUN /bin/bash -c "conda create -yn sp4 python=3.9 && \
    source activate sp4 && \
    conda install -y -c mmariotti -c anaconda -c bioconda -c biobuilds selenoprofiles4 && \
    /opt/conda/envs/sp4/bin/selenoprofiles -setup && \
    echo -e '\n' | /opt/conda/envs/sp4/bin/selenoprofiles -download"

ENV PATH="/opt/conda/envs/sp4/bin:${PATH}"
