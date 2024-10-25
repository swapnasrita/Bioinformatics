library(dplyr)
library(stringr)
splt_name_dna <- function(x) {
  pos <- regexpr("\n", x)
  parts <- c(substring(x, 1, pos-1), substring(x, pos+1, nchar(x)))
  list(name = parts[1], dna = gsub("\n", "", parts[2]))
}

s = paste(readLines('rosalind_gc.txt'), collapse = "\n")

strings <- unlist(strsplit(s, '>'))
strings<- strings[strings != ""]

result<-lapply(strings, splt_name_dna)
result_df <- do.call(rbind, lapply(result, as.data.frame))

# Print the result as a data frame
print(result_df)

result_df <- result_df %>%
              mutate(gc = str_count(dna, 'G')+str_count(dna, 'C')) %>%
              mutate(percent = gc/nchar(dna)*100)

max_gc_row <- result_df %>%
  filter(percent == max(percent)) %>%
  select(name, percent)

print(max_gc_row)




