---
title: "QMM Assignment2"
output: html_document
date: "2023-09-23"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

The Weigelt Corporation has three branch plants with excess production capacity. Fortunately, the corporation has a new product ready to begin production, and all three plants have this
capability, so some of the excess capacity can be used in this way. This product can be made in three sizes--large, medium, and small--that yield a net unit profit of $420, $360, and $300, respectively. Plants 1, 2, and 3 have the excess capacity to produce 750, 900, and 450 units per
day of this product, respectively, regardless of the size or combination of sizes involved.
The amount of available in-process storage space also imposes a limitation on the production rates of the new product. Plants 1, 2, and 3 have 13,000, 12,000, and 5,000 square feet, respectively, of in-process storage space available for a day's production of this product. Each unit of the large, medium, and small sizes produced per day requires 20, 15, and 12 square feet, respectively.
Sales forecasts indicate that if available, 900, 1,200, and 750 units of the large, medium, and small sizes, respectively, would be sold per day.
At each plant, some employees will need to be laid off unless most of the plant’s excess production capacity can be used to produce the new product. To avoid layoffs if possible, management has decided that the plants should use the same percentage of their excess capacity to produce the new product.
Management wishes to know how much of each of the sizes should be produced by each of the plants to maximize profit.
Solve the problem using lpsolve, or any other equivalent library in R

#Installed the package lpSolve and calling the package using library function.

```{r}
library(lpSolve)
```

#Setting the objective function
```{r}
obj <- c(420, 360, 300, 420, 360, 300, 420, 360, 300)
```
#Listing the constraint matrix

constraints
```{r}
f.con <- matrix(c(1, 1, 1, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 1, 1, 1, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 1,  1,  1,
                  20, 15, 12, 0, 0, 0, 0, 0, 0,
                  0, 0, 0, 20, 15, 12, 0, 0, 0,
                  0, 0, 0, 0, 0, 0, 20, 15, 12,
                  1, 0, 0, 1, 0, 0, 1, 0, 0,
                  0, 1, 0, 1, 0, 0, 0, 1, 0,
                  0, 0, 1, 0, 0, 1, 0, 0, 1,
                  900, 900, 900, -750, -750, -750, 0, 0, 0,
                  0, 0, 0, 450, 450, 450, -900, -900, -900,
                  450, 450, 450, 0, 0, 0, -750, -750, -750), nrow=12, byrow = TRUE)
```
#Setting the inequality signs
```{r}
direction <- c("<=",
               "<=",
               "<=",
               "<=",
               "<=",
               "<=",
               "<=",
               "<=",
               "<=",
               "=",
               "=",
               "=")
```
#Right hand side values
```{r}
rhs_coeff <- c(750, 900, 450, 13000, 12000, 5000, 900, 1200, 750, 0, 0, 0)
```
#Value of objective funcation
```{r}
lp("max", obj, f.con, direction, rhs_coeff)
```
#Getting the values for decision variables
```{r}
lp("max", obj, f.con, direction, rhs_coeff)$solution
```
