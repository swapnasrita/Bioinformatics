library(dplyr)
library(stringr)
splt_name_dna <- function(x) {
  pos <- regexpr("\n", x)
  parts <- c(substring(x, 1, pos-1), substring(x, pos+1, nchar(x)))
  return(gsub("\n", "", parts[2]))
}


s <- paste(readLines('rosalind_cons.txt'), collapse = "\n")

strings <- unlist(strsplit(s, '>'))
strings<- strings[strings != ""]

result<-lapply(strings, splt_name_dna)

bases <- c('A', 'C', 'G', 'T')

final_DNA <- c()

for (i in 1:nchar(result[1])){
    list_counts<-table(sapply(result, function(x) substr(x, i, i)))
    final_DNA <- append(final_DNA, names(which.max(list_counts)))
    
}

final_DNA <- paste(final_DNA, collapse='')
  
