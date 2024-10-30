library(stringi)
p <- readLines('rosalind_subs.txt')
s<-p[1]
t<-p[2]

result<- stri_locate_all_fixed(s, t, overlap = TRUE)

# extract the start positions
starts <- result[[1]][, 1]
print(starts)