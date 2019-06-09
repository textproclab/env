FROM debian:latest

MAINTAINER Jonathan Gordon <jgordon@vassar.edu>

RUN apt-get update \
 && apt-get install -y \
        bzip2 \
        git \
        vim \
        wget \
 && apt-get autoremove

# Install Anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
 && wget https://repo.continuum.io/archive/Anaconda3-5.3.1-Linux-x86_64.sh \
         -O /tmp/anaconda.sh -q \
 && bash /tmp/anaconda.sh -b -p /opt/conda \
 && rm /tmp/anaconda.sh

ENV PATH /opt/conda/bin:$PATH


RUN pip install --upgrade pip

RUN conda update numpy scipy pandas scikit-learn


# Set up Jupyter notebook alias and disable notebook tokens
RUN echo 'alias jp="jupyter notebook --port=9999 --no-browser --ip=0.0.0.0 --allow-root"' >> /root/.bashrc
RUN mkdir -p /root/.jupyter \
 && jupyter notebook --generate-config \
 && echo "c.NotebookApp.token = ''" \
         >> /root/.jupyter/jupyter_notebook_config.py \
 && echo "c.NotebookApp.notebook_dir = '/mnt'" \
         >> /root/.jupyter/jupyter_notebook_config.py
