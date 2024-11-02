splt_name_dna <- function(x) {
  pos <- regexpr("\n", x)
  parts <- c(substring(x, 1, pos-1), substring(x, pos+1, nchar(x)))
  return(gsub("\n", "", parts[2]))
}

# Function to calculate the superstring
get_superstring <- function(reads_list, superstring = "") {
  # If no reads are left, return the current superstring
  if (length(reads_list) == 0) {
    return(superstring)
  }
  
  # If superstring is empty, initialize with the first read
  if (superstring == "") {
    superstring <- reads_list[[1]]
    reads_list <- reads_list[-1]
    return(get_superstring(reads_list, superstring))
  }
  
  # Try to find an overlap with the remaining reads
  for (current_read_index in seq_along(reads_list)) {
    current_read <- reads_list[[current_read_index]]
    current_read_length <- nchar(current_read)
    
    # Test for overlaps from half the length of the read
    for (trial in 0:(current_read_length %/% 2)) {
      overlap_length <- current_read_length - trial
      
      # Check if superstring starts with the current read's overlap
      if (startsWith(superstring, substring(current_read, trial + 1))) {
        reads_list <- reads_list[-current_read_index]
        return(get_superstring(reads_list, paste0(substring(current_read, 1, trial), superstring)))
      }
      
      # Check if superstring ends with the current read's overlap
      if (endsWith(superstring, substring(current_read, 1, overlap_length))) {
        reads_list <- reads_list[-current_read_index]
        return(get_superstring(reads_list, paste0(superstring, substring(current_read, overlap_length + 1))))
      }
    }
  }
}

# Example dataset in FASTA format
small_dataset <- paste(readLines('rosalind_grph.txt'), collapse = "\n")

strings <- unlist(strsplit(s, '>'))
strings<- strings[strings != ""]

result<-lapply(strings, splt_name_dna)



# Get the superstring
superstring <- get_superstring(result)
print(superstring)
