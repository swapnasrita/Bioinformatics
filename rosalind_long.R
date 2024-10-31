library(stringdist)
library(stringr)

splt_name_dna <- function(x) {
  pos <- regexpr("\n", x)
  parts <- c(substring(x, 1, pos-1), substring(x, pos+1, nchar(x)))
  return(gsub("\n", "", parts[2]))
}

# Function to find the longest common substring starting from the suffix or prefix
find_overlap <- function(P, Q) {
  max_len <- min(nchar(P), nchar(Q))
  overlap <- ""
  
  # Start from the end of P and beginning of Q to find maximum overlap
  for (i in seq(max_len, 1)) {
    if (str_sub(P, -i) == str_sub(Q, 1, i)) {
      overlap <- str_sub(P, -i)
      break
    }
  }
  
  return(overlap)
}

common_substr <- function(P, Q) {
  # Check if Q is already a substring of P
  if (str_detect(P, Q)) {
    return(P) # Q is already part of P, no need to merge
  }
  
  # Check if P is already a substring of Q
  if (str_detect(Q, P)) {
    return(Q) # P is already part of Q, return Q
  }
  overlap <- find_overlap(P, Q)
  if (nzchar(overlap)) {
    merged_str <- paste0(P, str_replace(Q, overlap, ""))
  } else {
    merged_str <- paste0(P, Q) # No overlap, concatenate directly
  }
  

  
  return(merged_str)
}

# Process the input
s <- paste(readLines('rosalind_long.txt'), collapse = "\n")
strings <- unlist(strsplit(s, '>'))
strings <- strings[strings != ""]

# Create list of DNA sequences
result <- unlist(lapply(strings, splt_name_dna))

# Start with the first sequence
commn <- result[1]

# Loop over remaining sequences to build the common superstring
for (i in 2:length(result)) {
  print(i)
  commn <- common_substr(commn, result[i])
}
