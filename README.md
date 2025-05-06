# Crypto-Extreme-Value-Analysis

This repository contains the code and data used for my undergraduate thesis:  
**"Interdependence of Cryptocurrencies During Extreme Market Losses."**  

The thesis applies Extreme Value Theory (EVT) to investigate tail dependencies among major cryptocurrencies through a univariate, bivariate, and multivariate analytical framework.

---

## Project Structure

### `Capstone_processing.ipynb`
- Collects, cleans, and processes daily cryptocurrency price data.
- Computes negative log-returns from closing prices.
- Fits ARMA-GARCH models to account for volatility.
- Performs model diagnostics using:
  - ACF of standardized residuals
  - ACF of squared standardized residuals
  - QQ plots

### `Capstone_R_multivariate.ipynb`
- **Univariate EVT Analysis**:
  - Applies the Generalized Pareto Distribution (GPD) to standardized residuals above the 90th percentile.
- **Bivariate EVT Analysis**:
  - Generates scatter plots for each pair of cryptocurrencies.
  - Computes and visualizes asymptotic dependence and independence to explore tail co-movements.

### `thesis_analysis.R`
- Performs multivariate EVT using the `graphicalExtremes` R package.
- Converts standardized residuals into multivariate Pareto data.
- Fits a Hüsler–Reiss graphical model.
- Learns and visualizes the extremal dependence graph.

---

## Dependencies

### `Capstone_processing.ipynb`
- **Downloaded**: `pyextremes`, `yfinance`, `pandas`, `numpy`, `arch`  
- **Also imported**: `matplotlib`, `scipy`, `statsmodels`

### `Capstone_R_multivariate.ipynb`
- **Downloaded**: `dplyr`, `evir`, `ggplot2`, `evd`, `ismev`, `extRemes`  
- **Also imported**: `readr`

### `thesis_analysis.R`
- **Downloaded**: `readr`, `readxl`  
- **Also imported**: `readr`, `readxl`, `graphicalExtremes`, `igraph`

---

## Data

Includes daily closing prices for selected cryptocurrencies (e.g., Bitcoin, Ethereum) over the analysis period. A full list and descriptive summary are provided in the `Capstone_processing.ipynb` notebook.

---

## Methodology Overview

### `Capstone_processing.ipynb`
- Downloads and selects closing prices from raw data.
- Computes negative log-returns and summarizes them.
- Fits ARMA-GARCH models to these returns to extract standardized residuals.
- Contains Mean Residual Life and Parameter Stability plots for potential threshold selection.  
  *(Note: These plots were not used due to their complexity and difficulty in threshold interpretation.)*

### `Capstone_R_multivariate.ipynb`
- **Input**: Standardized residuals obtained from `Capstone_processing.ipynb`.
- **Univariate Analysis**:
  - Fits GPD to residuals exceeding the 90th percentile.
  - Outputs a table of shape and scale parameters and the threshold value.
- **Bivariate Analysis**:
  - For every cryptocurrency pair:
    - Computes Pearson correlation
    - Calculates coefficients of asymptotic dependence and independence
- **Multivariate Prep**:
  - Combines residuals into a single table for export to R for multivariate modeling.

### `thesis_analysis.R`
- Loads the combined standardized residuals dataset.
- Converts the data to multivariate Pareto format.
- Learns and plots the extremal dependence graph structure.
- Compares model fit using log-likelihood values.
- Outputs a table of all cryptocurrency pairs that are connected in the learned graph, to aid interpretation.

