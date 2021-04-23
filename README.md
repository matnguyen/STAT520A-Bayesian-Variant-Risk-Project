# Bayesian method for SARS-CoV-2 variant risk analysis
## This repository contains the code for the STAT-520A term project
### Author: Matthew Nguyen

## Scripts
* `src/variant_unannotated.bl` contains the unannotated model, written in Blang
* `src/variant_annotated.bl` contains the hierarchical annotated model, written in Blang
* `eda.Rmd` contains some exploratory data analysis code
* `preprocess.ipynb` contains the preprocessing code for the data
* `simulate.ipynb` contains the code for simulating a dataset and analyzing the calibration results

## Data
* `data/combined.tsv` contains the processed metadata
* `data/variants.csv` contains the post-processed data file (used as input to Blang), processed from the metadata and the VCF file (not included due to size)
