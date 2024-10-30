library(dplyr)
library(stringr)

splt_name_dna <- function(x) {
  pos <- regexpr("\n", x)
  parts <- c(substring(x, 1, pos-1), substring(x, pos+1, nchar(x)))
  list(name = parts[1], dna = gsub("\n", "", parts[2]))
}
s<-'>Rosalind_0498
AAATAAA
>Rosalind_2391
AAATTTT
>Rosalind_2323
TTTTCCC
>Rosalind_0442
AAATCCC
>Rosalind_5013
GGGTGGG'
s <- paste(readLines('rosalind_grph.txt'), collapse = "\n")

strings <- unlist(strsplit(s, '>'))
strings<- strings[strings != ""]

result<-lapply(strings, splt_name_dna)
names_list <- unlist(lapply(result, function(x) x$name))
dna_list <- lapply(result, function(x) x$dna)
order <- 3

top <- unlist(lapply(dna_list, function(x) substring(x, 1, 3)))
bottom <- unlist(lapply(dna_list, function(x) substring(x, nchar(x)-2, nchar(x))))
adjacency_lst <- c()
for (i in 1:length(top)){
  for (j in 1:length(bottom)){
    if (top[i]== bottom[j]){
      if (names_list[i]!= names_list[j]){
        adjacency_lst<- append(adjacency_lst, list(c(names_list[j], names_list[i])))
      }
    
      
    }
  }
}

# Print each pair on a new line in the desired format
for (pair in adjacency_lst) {
  cat(pair[1], pair[2], "\n")
}
  