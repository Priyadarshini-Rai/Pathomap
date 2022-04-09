#' Provides PMID(s) of manuscripts where a particular gene-disease pair is present 
#' 
#' @param Gene 
#' @param Disease
#' 
#' @example 
#' GeneDisFreq('BRCA1', 'breast cancer') 
#' 
#' @export
GeneDisFreq[Freq, Final_PMID] <- function(Gene, Disease)
{
  G = toupper(Gene)
  D = tolower(Disease)
  
  
  
  # PMID-Gene List for pathological abstracts
  Genes = read.table(system.file("extdata", "PMID-Gene List for Pathological Abstracts.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE)
  Genes[, 2] = toupper(G[, 2])
  
  # PMID-Disease List for pathological abstracts
  Diseases = read.table(system.file("extdata", "PMID-Disease List for Pathological Abstracts.csv", package = "Pathomap", mustWork = TRUE), sep = ',', header = TRUE)
  Diseases[, 2] = tolower(Diseases[, 2])
  
  
  
  I_G = which(Genes[, 2] == G)
  I_D = which(Diseases[, 2] == D)
  PMID_G = Genes[I_G, 1]
  PMID_D = Diseases[I_D, 1]
  Uniq_PMID_G = unique(PMID_G)
  Uniq_PMID_D = unique(PMID_D)
  Final_PMID = match(Uniq_PMID_G, Uniq_PMID_D)
  Final_PMID = Final_PMID[complete.cases(Final_PMID)]
  Freq = as.numeric(length(Final_PMID))
  
  
  
  if(Freq != 0)
  {
    Freq_PMID = list(Freq, Final_PMID)
    return(Freq_PMID)
  }
  else
  {
    print("No result found")
  }
}