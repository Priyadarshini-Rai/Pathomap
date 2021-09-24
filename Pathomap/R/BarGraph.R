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
  CS = read.table(system.file("extdata", "Cosine Similarity of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  GE = read.table(system.file("extdata", "Gene Expression of Genes Present in Both Gene-Tissue Similarity and GTEx Data.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE, row.names = 1)
  
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
    Var1 = plotly::plot_ly(Ordered_MaleBodymap, x = ~value, y = ~organ, name = "Gene Expression (log normalized)", type = "bar", color = I("#59981A"), size = I(1), orientation = 'h') 
    P3 = Var1 %>% plotly::layout(xaxis = list(title = "Gene Expression (log nomalized)", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 7, color = 'black'), categoryorder = "array", categoryarray = Ordered_MaleBodymap$value))
    
    MalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    MalePathomap = MalePathomap[complete.cases(MalePathomap), ]
    Ordered_MalePathomap = MalePathomap[order(MalePathomap$value), ]
    Var2 = plotly::plot_ly(Ordered_MalePathomap, x = ~value, y = ~organ, name = "Similarity", type = "bar", color = I("#A30000"), size = I(1), orientation = 'h') 
    P4 = Var2 %>% plotly::layout(xaxis = list(title = "Similarity", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 7, color = 'black'), categoryorder = "array", categoryarray = Ordered_MalePathomap$value))
    
    plotly::subplot(P3, P4, nrows = 1)
    
  }
  
  else
  {
    
    FemaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    FemaleBodymap = FemaleBodymap[complete.cases(FemaleBodymap), ]
    Ordered_FemaleBodymap = FemaleBodymap[order(FemaleBodymap$value), ]
    Var3 = plotly::plot_ly(Ordered_FemaleBodymap, x = ~value, y = ~organ, name = "Gene Expression (log normalized)", type = "bar", color = I("#59981A"), size = I(1), orientation = 'h') 
    P7 = Var3 %>% plotly::layout(xaxis = list(title = "Gene Expression (log nomalized)", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 9, color = 'black'), categoryorder = "array", categoryarray = Ordered_FemaleBodymap$value))
    
    FemalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    FemalePathomap = FemalePathomap[complete.cases(FemalePathomap), ]
    Ordered_FemalePathomap = FemalePathomap[order(FemalePathomap$value), ]
    Var4 = plotly::plot_ly(Ordered_FemalePathomap, x = ~value, y = ~organ, name = "Similarity", type = "bar", color = I("#A30000"), size = I(1), orientation = 'h') 
    P8 = Var4 %>% plotly::layout(xaxis = list(title = "Similarity", color = 'black', tickfont = list(size = 9, color = 'black')), yaxis = list(title = "", tickfont = list(size = 9, color = 'black'), categoryorder = "array", categoryarray = Ordered_FemalePathomap$value))
    
    plotly::subplot(P7, P8, nrows = 1)
    
  }
  
}
