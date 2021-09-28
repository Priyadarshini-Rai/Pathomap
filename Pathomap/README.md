# Pathomap: A visual atlas of genes’ tissue-specific pathological roles

Priyadarshini Rai, Atishay Jain, Neha Jha, Divya Sharma, Shivani Kumar, Abhijit Raj, Apoorva Gupta, Sarita Poonia, Smriti Chawla, Juhi Tayal, Anurag Mehta, Angshul Majumdar, Tanmoy Chakraborty, Gaurav Ahuja, and Debarka Sengupta

## Description

Pathomap provides a strategy to obtain an unbiased continuous representation of disease causing genes and their tissue specificity.

### Dependencies

Packages: devtools, gganatogram, ggplot2, ggploypath, gridExtra, magrittr, plotly

### Excecution

To install the *Pathomap* R package use the following command:

```ruby
setwd("Path to the Pathomap folder")
devtools::install()

OR

install.packages("Path to the Pathomap folder", repos = NULL, type = “source”)
```

```
# Loading data
Processed_Data = read.table('Single Cell Dataset/PBMC_Data_1019Samples.csv', sep = ',', header = FALSE)
```

```
# Number of features user wants to select
Number_of_Features = 50
```

```
# Calling SelfE
GeneIDs = SelfE(Processed_Data, Number_of_Features)
```

```
# Selecting genes from the data
SelfE_Data = Processed_Data[, GeneIDs]
```
