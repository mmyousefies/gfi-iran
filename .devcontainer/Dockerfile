#syntax=docker/dockerfile:1.4

# Use the official R base image
FROM rocker/tidyverse:latest

# Install system requirements (including build‐essential) and Python/Jupyter
RUN apt-get update && apt-get install -y \
    build-essential \
    git\
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libzmq5 \
    libzmq3-dev \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Allow pip to modify system packages in Docker
ENV PIP_BREAK_SYSTEM_PACKAGES=1
RUN pip3 install jupyter

# Install required R packages including IRkernel (to enable R as a notebook kernel)
RUN Rscript -e "install.packages(c('IRkernel','languageserver'), repos='https://cloud.r-project.org')"
RUN Rscript -e "IRkernel::installspec(user=FALSE)"
RUN Rscript -e "install.packages(c('haven','arrow','tidymodels','furrr','readxl','tictoc','Hmisc','cli','glue','RODBC','gganimate','base64enc','gifski','ggridges'),repos='https://cloud.r-project.org')"

# copy only the bare minimum for renv to work
WORKDIR /workspace

# Set R_LIBS_USER for all R sessions (interactive and non-interactive)
RUN echo 'R_LIBS_USER=/usr/local/lib/R/site-library' >> /root/.Renviron

# Ensure .Rprofile exists and append .libPaths() line
RUN touch /root/.Rprofile && \
    echo '.libPaths(c("/usr/local/lib/R/site-library", .libPaths()))' >> /root/.Rprofile

# Create VS Code R init file safely and set up .libPaths()
RUN mkdir -p /root/.vscode-R && \
    echo '.libPaths(c("/usr/local/lib/R/site-library", .libPaths()))' >> /root/.vscode-R/init.R
