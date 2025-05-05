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

Note: There is code in the respective jupyter notebooks to download and import everything necessary.

Capstone_processing jupyter notebook: 
downloaded - pyextremes, yfinance, pandas, numpy, arch
imports (apart from the downloads) - matplotlib, scipy, statsmodels

Capstone_R_multivariate jupyter notebook:
downloaded - dplyr, evir, ggplot2, evd, ismev, extRemes
imports(apart from the downloads) - readr

thesis_analysis.R
downloaded - readr, readxl
imports - readr, readxl, graphicalExtremes, igraph

📁 Data 
includes daily prices of selected cryptocurrencies (e.g., Bitcoin, Ethereum) over the analysis period. Full list and summary provided in the preprocessing notebook.

📌 Methodology Overview

Capstone_processing jupyter notebook: 
- Download the required data. Then select only the close prices from all the other columns and compute negative log-returns, and get summary statistics on the negative log-returns calculated.
- Then, negative log-returns modeled with ARMA-GARCH to extract standardized residuals.
- The notebook additionaly has 2 types of plots to choose a threshold : Mean Residual Life Plot and Parameters Stability Plot. These plots were not used given they're complicated nature(it's just hard to find the optimal threshold just by looking at the graphs.)

Capstone_R_multivariate:
- Here, you would have to upload the downloaded std_residuals from the Capstone_processing jupyter notebook.  
- Univariate Analysis: GPD fitting for extreme residuals above 90th percentile, to get a table with the Shape and Scale parameters which are the solutions of fitting GPD for each crypto, along with the value of 90th percentile. 
- Bivariate Analysis: For every single crypto pair combination, calculate the pearson correlation, coefficient of asymptotic dependence and independence.
- Multivariate Analysis: We combine the standard residuals into 1 table to download, that makes working in R easier to continue working for Multivariate Analysis.

thesis_analysis.R:
Multivariate Analysis:
- First we load the combined data of standard residuals
- Then, we conovert the data to multivariate Pareto.
- Learn graph structuring, and plot the graphs
- We then create a table of Log-Likelihood of the models to choose the best one.
- Lastly, since it can be hard to read the connections from the graph, we create a table with the pairs that are connected in the graph for detailed analysis.
