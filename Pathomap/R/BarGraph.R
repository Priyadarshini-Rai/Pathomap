#' Provides a pathological association between a gene and different tissues using a bar graph
#' 
#' @param GeneName 
#' @param Anatomy Anatomy can be either Male or Female
#' 
#' @example 
#' BarGraph('BRCA1', 'Female') 
#' 
#' @export
BarGraph <- function(GeneName, Anatomy)
{
  
  GeneName = as.character(GeneName)
  GeneName = toupper(GeneName)
  Anatomy = as.character(Anatomy)
  Anatomy = tolower(Anatomy)
  
  #CS = read.table("Cosine Similarity of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", sep = ',', header = TRUE, row.names = 1)
  #GE = read.table("Gene Expression of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", sep = ',', header = TRUE, row.names = 1)
  #CS = read.table(system.file("extdata", "Cosine Similarity of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  #GE = read.table(system.file("extdata", "Gene Expression of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  CS = read.table(system.file("extdata", "Gene-Tissue Cosine Similarity using BERT.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  GE = read.table(system.file("extdata", "Genes Expression from GTEx.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  M1 = read.table(system.file("extdata", "Tissue-Gene Null.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE)
  
  pval <- function(patho_score, null)
  {
    #patho_score = as.numeric(patho[1])
    #null = t1$x
    return((length(which(null >= patho_score)) + 1) / (length(null) + 1))
  }
  
  Tissues = colnames(GE)
  Index2 = match(Tissues, gganatogram::hgMale_key$organ)
  MaleBodymap = gganatogram::hgMale_key[Index2, ]
  MalePathomap = gganatogram::hgMale_key[Index2, ]
  
  Index3 = match(Tissues, gganatogram::hgFemale_key$organ)
  FemaleBodymap = gganatogram::hgFemale_key[Index3, ]
  FemalePathomap = gganatogram::hgFemale_key[Index3, ]
  
  if (Anatomy == 'Male')
  {
    
    MaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    MaleBodymap = MaleBodymap[complete.cases(MaleBodymap), ]
    Ordered_MaleBodymap = MaleBodymap[order(MaleBodymap$value), ]
    I1 = (Ordered_MaleBodymap[, 1] == 'nerve')
    I2 = as.numeric(which(I1 == TRUE))
    Ordered_MaleBodymap = Ordered_MaleBodymap[-c(I2), ]
    Var1 = plotly::plot_ly(Ordered_MaleBodymap, x = ~value, y = ~organ, name = "Gene Expression (log normalized)", type = "bar", color = I("#59981A"), size = I(1), orientation = 'h') 
    P3 = Var1 %>% plotly::layout(xaxis = list(title = "Gene Expression (log nomalized)", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 7, color = 'black'), categoryorder = "array", categoryarray = Ordered_MaleBodymap$value))
    
    #MalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    patho = as.numeric(CS[GeneName, ])
    ml10p = c()
    pvalue = c()
    for(j in 1:length(patho))
    {
      pvalue = c(pvalue, pval(patho[j], M1$x))
      ml10p = c(ml10p, -log10(pval(patho[j], M1$x)))
    }
    MalePathomap$value = as.vector(ml10p)
    MalePathomap = MalePathomap[complete.cases(MalePathomap), ]
    Ordered_MalePathomap = MalePathomap[order(MalePathomap$value), ]
    I1 = (Ordered_MalePathomap[, 1] == 'nerve')
    I2 = as.numeric(which(I1 == TRUE))
    Ordered_MalePathomap = Ordered_MalePathomap[-c(I2), ]
    Var2 = plotly::plot_ly(Ordered_MalePathomap, x = ~value, y = ~organ, name = "Similarity", type = "bar", color = I("#A30000"), size = I(1), orientation = 'h') 
    P4 = Var2 %>% plotly::layout(xaxis = list(title = "Similarity", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 7, color = 'black'), categoryorder = "array", categoryarray = Ordered_MalePathomap$value))
    
    plotly::subplot(P3, P4, nrows = 1)
    
  }
  
  else
  {
    
    FemaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    FemaleBodymap = FemaleBodymap[complete.cases(FemaleBodymap), ]
    Ordered_FemaleBodymap = FemaleBodymap[order(FemaleBodymap$value), ]
    I1 = (Ordered_FemaleBodymap[, 1] == 'nerve')
    I2 = as.numeric(which(I1 == TRUE))
    Ordered_FemaleBodymap = Ordered_FemaleBodymap[-c(I2), ]
    Var3 = plotly::plot_ly(Ordered_FemaleBodymap, x = ~value, y = ~organ, name = "Gene Expression (log normalized)", type = "bar", color = I("#59981A"), size = I(1), orientation = 'h') 
    P7 = Var3 %>% plotly::layout(xaxis = list(title = "Gene Expression (log nomalized)", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 9, color = 'black'), categoryorder = "array", categoryarray = Ordered_FemaleBodymap$value))
    
    #FemalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    patho = as.numeric(CS[GeneName, ])
    ml10p = c()
    pvalue = c()
    for(j in 1:length(patho))
    {
      pvalue = c(pvalue, pval(patho[j], M1$x))
      ml10p = c(ml10p, -log10(pval(patho[j], M1$x)))
    }
    FemalePathomap$value = as.vector(ml10p)
    FemalePathomap = FemalePathomap[complete.cases(FemalePathomap), ]
    Ordered_FemalePathomap = FemalePathomap[order(FemalePathomap$value), ]
    I1 = (Ordered_FemalePathomap[, 1] == 'nerve')
    I2 = as.numeric(which(I1 == TRUE))
    Ordered_FemalePathomap = Ordered_FemalePathomap[-c(I2), ]
    Var4 = plotly::plot_ly(Ordered_FemalePathomap, x = ~value, y = ~organ, name = "Similarity", type = "bar", color = I("#A30000"), size = I(1), orientation = 'h') 
    P8 = Var4 %>% plotly::layout(xaxis = list(title = "Similarity", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 9, color = 'black'), categoryorder = "array", categoryarray = Ordered_FemalePathomap$value))
    
    plotly::subplot(P7, P8, nrows = 1)
    
  }
  
}
