# Use the official R base image
FROM rocker/r-base:latest

# Install system dependencies needed for many R packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
 && rm -rf /var/lib/apt/lists/*

# Install required R packages including IRkernel (to enable R as a notebook kernel)
RUN R -e "install.packages(c('tidyverse', 'ggtext', 'showtext', 'tidymodels', 'furrr', 'readxl', 'glmnet', 'IRkernel'), repos='https://cloud.r-project.org')"

# Register the IRkernel so that VS Code can use it as the notebook kernel.
RUN R -e "IRkernel::installspec()"

# Set the working directory inside the container
WORKDIR /workspace
