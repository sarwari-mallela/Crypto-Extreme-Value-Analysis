# Installing required packages
install.packages("readr")        # for read_csv()
install.packages("readxl")       # for read_excel()

# Loading required packages
library(readr)   # for read_csv
library(readxl)  # for read_excel
library(graphicalExtremes)
library(igraph)

# Load combined data of standard residuals
data <- read_csv("C:/Users/Sarwari/Downloads/CAPSTONE_PAPER/standardized_residuals.csv")

# Convert to multivariate Pareto
pareto <- data2mpareto(data, 0.90, na.rm = F)

# Learn Graph Structuring using eglearn
rholist <- seq(0.1, 0.8, length.out = 20) # defining range of rho(regularization parameter)
mod <- eglearn(pareto, rholist = rholist, reg_method = "glasso", complete_Gamma = T)

# Plot the graphs
par(mfrow=c(1,3))   # Show two plots side-by-side
plot(mod$graph[[1]])     # less sparse
plot(mod$graph[[13]])
plot(mod$graph[[20]])

# Log-likelihood of the models
## Create an empty vector to store log-likelihood values
loglik_values <- numeric(length(mod$graph))

## Loop over all 20 graph models and compute log-likelihood
for (i in seq_along(mod$graph)) {
  loglik_values[i] <- loglik_HR(
    pareto,
    p = NULL,
    graph = mod$graph[[i]],
    Gamma = mod$Gamma[[i]],
    cens = FALSE
  )
}

## Create a data frame to view and maybe save the results
loglik_table <- data.frame(
  Model_Index = 1:length(mod$graph),
  Rho = rholist,
  LogLikelihood = loglik_values
)

## View the table
print(loglik_table)

## Optionally save the results to a CSV
write.csv(loglik_table, "C:/Users/Sarwari/Downloads/CAPSTONE_PAPER/loglikelihood_results.csv", row.names = FALSE)

# To get edges from the best garph(based on log-likelihood) as a Table 
## Upgrade the old-format graph to the current igraph format
best_graph <- upgrade_graph(mod$graph[[13]])

## Set vertex names (column names from data)
V(best_graph)$name <- colnames(data)

## Extract edges with names
edge_list <- as_edgelist(best_graph)
edge_df <- as.data.frame(edge_list)
colnames(edge_df) <- c("Variable1", "Variable2")

## Save to CSV
write.csv(edge_df, "C:/Users/Sarwari/Downloads/CAPSTONE_PAPER/connected_variable_pairs.csv", row.names = FALSE)

## View it
print(edge_df)







