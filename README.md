# Global Financial Inclusion in Iran

This repository accompanies an upcoming paper that investigates whether
women with access to better financial infrastructure are more likely to join
the labour force when controlling for all other variables available in the
survey. The work is strictly correlational and relies on the World Bank's
**Global Financial Inclusion (Global Findex) Survey**. All notebooks are
written in R and can be run either locally or inside the provided dev
container. Public copies of the notebooks are also available on Kaggle.

## Repository overview

- **data/** – zipped Global Findex datasets for 2017 and 2021
- **documents/** – official codebooks and documentation
- **src/** – Jupyter notebooks used for cleaning, analysis, and modeling
- **figures/** – plots generated from the notebooks
- **output/** – cleaned CSVs and other derived data

## Development environment

A Docker-based dev container is included for reproducibility. To launch it,
you need Docker and the VS Code Remote Containers extension:

1. Open the repository in VS Code.
2. Reopen in the dev container when prompted.
3. The container will install R, Python, and the required packages.

Alternatively, you can run the notebooks with any recent R installation and
the `tidyverse` and `tidymodels` packages.

## Using the notebooks

The analysis lives in the `src/` directory (and is mirrored on Kaggle):

- `clean.ipynb` – prepares the raw survey data
- `discriptive-plots.ipynb` – produces descriptive figures
- `gfi-iran-analysis.ipynb` – performs the main exploration
- `model.ipynb` – fits logistic regression models of account ownership and
  tests the robustness of the results

Outputs such as figures and processed data are written to `figures/` and
`output/`.

## License and data

The scripts are released under the MIT License. The data come from the World
Bank's Global Financial Inclusion Survey (Global Findex). The microdata is
distributed under the World Bank terms of use; see the files in `documents/`
for details.

## Contributing

Contributions are welcome! Feel free to open an issue or pull request if you
have suggestions or improvements.