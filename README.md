# Crypto-Extreme-Value-Analysis
Files and scripts from my undergraduate thesis on Extreme Value Analysis of Cryptocurrency Market: Univariate, Bivariate and Multivariate Approach

This repository contains the code and data used for my undergraduate thesis: "Interdependence of Cryptocurrencies During Extreme Market Losses". The analysis focuses on understanding tail dependence among major cryptocurrencies using statistical methods from Extreme Value Theory (EVT).

🔧 Project Structure
- 01_data_preprocessing.ipynb
Contains data collection, cleaning, log-return computation, and ARMA-GARCH modeling. Also includes model diagnostics like ACF and QQ plots to validate volatility modeling.

- 02_univariate_bivariate_analysis.ipynb

Univariate EVT Analysis: Fits the Generalized Pareto Distribution (GPD) on the filtered (ARMA-GARCH) residuals using the 90th percentile threshold.

Bivariate EVT Analysis: Scatter plots of standardized residuals for cryptocurrency pairs and plots for Asymptotic Dependence and Independence to visualize and interpret tail dependence in pairs.

- 03_multivariate_analysis.R
Performs multivariate extreme value analysis using the graphicalExtremes package in R.

Converts residuals to multivariate Pareto data.

Fits a Hüsler–Reiss graphical model.

Learns and visualizes the extremal dependence graph.

📦 Dependencies
Python
pandas, numpy, matplotlib, scipy, statsmodels, arch

Jupyter Notebook

R
graphicalExtremes, igraph, ggplot2

Make sure to install packages in your respective environments before running the notebooks or R script.

📁 Data
Data includes daily prices of selected cryptocurrencies (e.g., Bitcoin, Ethereum) over the analysis period. Full list and summary provided in the preprocessing notebook.

📌 Methodology Overview
Data Preprocessing: Log returns modeled with ARMA-GARCH to extract standardized residuals.

Univariate Analysis: GPD fitting for extreme residuals above 90th percentile.

Bivariate Analysis: Visual exploration and asymptotic dependence measures for coin pairs.

Multivariate Analysis: Graphical modeling of extremal dependence structure among all cryptocurrencies.
