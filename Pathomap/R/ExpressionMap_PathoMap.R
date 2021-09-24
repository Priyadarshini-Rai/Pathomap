#' Provides a visual pathological association between a gene and different tissues
#'
#' @param GeneName 
#' @param Anatomy Anatomy can be either Male or Female
#' 
#' @example 
#' ExpressionMap_Pathomap('BRCA1', 'female') 
#' 
#' @import ggplot2
#' @import ggpolypath
#' 
#' @export
ExpressionMap_PathoMap <- function(GeneName, Anatomy)
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
  
  if (Anatomy == 'male')
  {
    
    MaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    MaleBodymap = MaleBodymap[complete.cases(MaleBodymap), ]
    P1 = gganatogram::gganatogram(data = MaleBodymap, fillOutline = '#ffffff', organism = 'human', sex = 'male', fill = 'value') + theme_void() + scale_fill_gradient(name = "expression", low = "white", high = "#007500") + ggtitle("ExpressionMap") + theme(plot.title = element_text(family = "", face = "bold", size = 20, hjust = 0.5), legend.title.align = 0.5)
    
    MalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    MalePathomap = MalePathomap[complete.cases(MalePathomap), ]
    P2 = gganatogram::gganatogram(data = MalePathomap, fillOutline = '#ffffff', organism = 'human', sex = 'male', fill = 'value') + theme_void() + scale_fill_gradient(name = "similarity", low = "white", high = "#FF0000") + ggtitle("PathoMap") + theme(plot.title = element_text(family = "", face = "bold", size = 20, hjust = 0.5))
    
    gridExtra::grid.arrange(P1, P2, ncol = 2)
    
  }
  
  else
  {
    
    FemaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    FemaleBodymap = FemaleBodymap[complete.cases(FemaleBodymap), ]
    P5 = gganatogram::gganatogram(data = FemaleBodymap, fillOutline = '#ffffff', organism = 'human', sex = 'female', fill = 'value') + theme_void() + scale_fill_gradient(name = "expression", low = "white", high = "#007500") + ggtitle("ExpressionMap") + theme(plot.title = element_text(face = "bold", size = 20, hjust = 0.5))
    
    FemalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    FemalePathomap = FemalePathomap[complete.cases(FemalePathomap), ]
    P6 = gganatogram::gganatogram(data = FemalePathomap, fillOutline = '#ffffff', organism = 'human', sex = 'female', fill = 'value') + theme_void() + scale_fill_gradient(name = "similarity", low = "white", high = "#FF0000") + ggtitle("PathoMap") + theme(plot.title = element_text(family = "", face = "bold", size = 20, hjust = 0.5))
    
    gridExtra::grid.arrange(P5, P6, ncol = 2)
    
  }
  
}