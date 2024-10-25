s <- readLines('rosalind_hamm.txt')
s1 <- s[1]
s2 <- s[2]
mismatch <-0
for(x in 1:nchar(s1)){
  if (substring(s1,x, x) != substring(s2,x, x) ){
    mismatch<- mismatch + 1
  }
}

print(mismatch)