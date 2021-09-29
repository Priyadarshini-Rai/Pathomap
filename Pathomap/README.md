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

To view a genes' *expression* and its *Patho-score* in different tissues using a human body template, use the following command:

```
ExpressionMap_Pathomap('Gene Name', 'Anatomy')

For example, 
ExpressionMap_Pathomap('APC', 'male')
ExpressionMap_Pathomap('BRCA1', 'female')
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
