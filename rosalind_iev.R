s <- strsplit(readLines('rosalind_iev.txt'), ' ')[[1]]
couple <- as.numeric(s)

p <- c(1, 1, 1, 0.75, 0.5, 0)

total <- sum(unlist(p)*unlist(couple)*2)