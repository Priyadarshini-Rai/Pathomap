# Pathomap: Literature mining discerns latent disease-gene relationships

Priyadarshini Rai, Atishay Jain, Shivani Kumar, Neha Jha, Divya Sharma, Smriti Chawla, Abhijit Raj, Apoorva Gupta, Sarita Poonia, Angshul Majumdar, Tanmoy Chakraborty, Gaurav Ahuja, and Debarka Sengupta

## Description

Pathomap provides a strategy to obtain an unbiased continuous representation of disease causing genes and their tissue specificity.

### Dependencies

Packages: devtools, gganatogram, ggplot2, ggploypath, gridExtra, magrittr, plotly

### Excecution

To install the *Pathomap* R package use the following command:

```ruby
library(devtools)
install_github('Priyadarshini-Rai/Pathomap/Pathomap')

OR

setwd("Path to the Pathomap folder")
devtools::install()

OR

install.packages("Path to the Pathomap folder", repos = NULL, type = “source”)
```

To view a genes' *expression* and its *Patho-score* in different tissues using a human body template, use the following command:

```
ExpressionMap_PathoMap('Gene Name', 'Anatomy')

For example, 
ExpressionMap_PathoMap('APC', 'male')
ExpressionMap_PathoMap('BRCA1', 'female')
```

![APC ExpressionMap and Pathomap for GitHub README](https://user-images.githubusercontent.com/45351848/135345745-b1f62ce4-90c7-48b6-b1ae-71fb672a6aba.png)

To view a genes' *expression* and its *Patho-score* in different tissues with the help of bar graph, use the following command:

```
BarGraph('Gene Name', 'Anatomy')

For example,
BarGraph('APC', 'male')
BarGraph('BRCA1', 'female')
```

![APC Bar Graphs for GitHub README](https://user-images.githubusercontent.com/45351848/135345890-49d033bf-4404-42ad-b8e1-b61e8deafdde.png)

To view tissue specific gene *expression* and 'Patho-score', use the following command:

```
Biopsy('Gene Name', 'Tissue')

For example, 
Biopsy('BRCA1', 'breast')
```

![APC Biopsy for GitHub README](https://user-images.githubusercontent.com/45351848/135346078-b1ceb367-3e2c-4276-8078-e8b5b4bfc808.png)
