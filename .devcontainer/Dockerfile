# Use the official R base image
FROM rocker/tidyverse:latest

# Install system dependencies needed for many R packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
 && rm -rf /var/lib/apt/lists/*

# Install required R packages including IRkernel (to enable R as a notebook kernel)
RUN R -e "install.packages(c('ggtext', 'showtext', 'tidymodels', 'furrr', 'readxl', 'glmnet', 'IRkernel'), repos='https://cloud.r-project.org')"

# Install Jupyter
RUN apt-get update

RUN apt-get install -y python3-pip

# Allow pip to modify system packages in Docker
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Install Jupyter plus the rest of the stack
RUN pip3 install jupyter

# Register the IRkernel so that VS Code can use it as the notebook kernel.
RUN R -e "IRkernel::installspec(user=FALSE)"

# Set the working directory inside the container
WORKDIR /workspace
