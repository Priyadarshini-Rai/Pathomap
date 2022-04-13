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
ExpressionMap_PathoMap('APOE', 'male')
ExpressionMap_PathoMap('BRCA1', 'female')
```

![APOE Bodymap](https://user-images.githubusercontent.com/45351848/162805391-1d5ae52c-de39-4bff-a378-2fdc23bcc203.png)

To view a genes' *expression* and its *Patho-score* in different tissues with the help of bar graph, use the following command:

```
BarGraph('Gene Name', 'Anatomy')

For example,
BarGraph('APOE', 'male')
BarGraph('BRCA1', 'female')
```

![APOE Bar Graph](https://user-images.githubusercontent.com/45351848/162805708-4e31b8fe-e04b-4f58-aae6-b141168da8aa.png)

To view tissue specific gene *expression* and *Patho-score*, use the following command:

```
Biopsy('Gene Name', 'Tissue')

For example, 
Biopsy('APOE', 'colon')
```

![APOE Biopsy](https://user-images.githubusercontent.com/45351848/162806317-6108e24b-94b4-4a4c-b2a0-71263baf6709.png)

If the *Patho-score* between a gene and a tissue is more than 1.3 then an alteration in the normal functioning of the given gene can impact the input tissue. To verify this relationship, user can refer to the web server *DiGSeE* (http://210.107.182.61/geneSearch/).

<img width="1107" alt="Screenshot 2022-04-13 at 11 28 07 AM" src="https://user-images.githubusercontent.com/45351848/163110133-937f2532-7bf7-4926-8a6d-c8d20de79687.png">


