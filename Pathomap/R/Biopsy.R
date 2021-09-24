#' Provides a visual pathological association between a gene and the input tissue
#' 
#' @param GeneName 
#' @param Tissue Name of a tissue 
#' 
#' @example 
#' Biopsy('BRCA1', 'breast')
#' 
#' @import ggplot2
#' @import ggpolypath
#' 
#' @export
Biopsy <- function(GeneName, Tissue)
{
  
  GeneName = as.character(GeneName)
  GeneName = toupper(GeneName)
  Tissue = as.character(Tissue)
  Tissue = tolower(Tissue)
  
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
  
  if(Tissue %in% MaleBodymap$organ)
  {
    
    t1 = Tissue
    
    MaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    MaleBodymap = MaleBodymap[complete.cases(MaleBodymap), ]
    
    MalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    MalePathomap = MalePathomap[complete.cases(MalePathomap), ]
    
    
    Index5 = as.numeric(match(t1, MaleBodymap$organ))
    Exp = MaleBodymap[Index5, 4]
    CosSim = MalePathomap[Index5, 4]
    
    Bodymap_Biopsy = data.frame(biopsy = t1, value = Exp)
    Pathomap_Biopsy = data.frame(biopsy = t1, value = CosSim)
    
    P11 = MaleBodymap %>% dplyr::filter(organ %in% c(t1)) %>% gganatogram::gganatogram(fillOutline = "lightgray", organism = "human", sex = "male", fill = "value") + theme_void() + ggtitle("ExpressionMap") + theme(plot.title = element_text(family = "", face = "bold", size = 15, hjust = 0.5)) + scale_fill_gradient(name = "expression", low = "#007500", high = "#007500")
    
    P13 = MalePathomap %>% dplyr::filter(organ %in% c(t1)) %>% gganatogram::gganatogram(fillOutline = "lightgray", organism = "human", sex = "male", fill = "value") + theme_void() + ggtitle("PathoMap") + theme(plot.title = element_text(family = "", face = "bold", size = 15, hjust = 0.5)) + scale_fill_gradient(name = "similarity", low = "#FF0000", high = "#FF0000")
    
    gridExtra::grid.arrange(P11, P13, ncol = 2)
    
  }
  
  else
  {
    
    t1 = Tissue
    
    FemaleBodymap$value = as.vector(as.matrix(GE[GeneName, ]))
    FemaleBodymap = FemaleBodymap[complete.cases(FemaleBodymap), ]
    
    FemalePathomap$value = as.vector(as.matrix(tanh(CS[GeneName, ])))
    FemalePathomap = FemalePathomap[complete.cases(FemalePathomap), ]
    
    
    Index5 = as.numeric(match(t1, FemaleBodymap$organ))
    Exp = FemaleBodymap[Index5, 4]
    CosSim = FemalePathomap[Index5, 4]
    
    Bodymap_Biopsy = data.frame(biopsy = t1, value = Exp)
    Pathomap_Biopsy = data.frame(biopsy = t1, value = CosSim)
    
    P11 = MaleBodymap %>% dplyr::filter(organ %in% c(t1)) %>% gganatogram::gganatogram(fillOutline = "lightgray", organism = "human", sex = "male", fill = "value") + theme_void() + ggtitle("ExpressionMap") + theme(plot.title = element_text(family = "", face = "bold", size = 15, hjust = 0.5)) + scale_fill_gradient(name = "expression", low = "#007500", high = "#007500")
    
    P13 = MalePathomap %>% dplyr::filter(organ %in% c(t1)) %>% gganatogram::gganatogram(fillOutline = "lightgray", organism = "human", sex = "male", fill = "value") + theme_void() + ggtitle("PathoMap") + theme(plot.title = element_text(family = "", face = "bold", size = 15, hjust = 0.5)) + scale_fill_gradient(name = "similarity", low = "#FF0000", high = "#FF0000")
    
    gridExtra::grid.arrange(P11, P13, ncol = 2)
    
  }
  
}