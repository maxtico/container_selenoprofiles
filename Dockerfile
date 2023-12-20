# Use an official Python runtime as a parent image
FROM python:3.9

# Install Miniconda
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    /bin/bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh
ENV PATH="/opt/conda/bin:${PATH}"

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

RUN conda create -yn sp4 python=3.9 

RUN echo "source activate sp4" > ~/.bashrc

# Run selenoprofiles
RUN /bin/bash -c "source ~/.bashrc && conda install -c mmariotti -c anaconda -c bioconda -c biobuilds selenoprofiles4"

# Setting up selenoprofiles
RUN /bin/bash -c "source ~/.bashrc && /opt/conda/envs/sp4/bin/selenoprofiles -setup"

# Downloading profiles
RUN /bin/bash -c "source ~/.bashrc && echo -e '\n' | /opt/conda/envs/sp4/bin/selenoprofiles -download"

# Deactivate conda environment (for sp4)
RUN /bin/bash -c "source ~/.bashrc && source deactivate"

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World
