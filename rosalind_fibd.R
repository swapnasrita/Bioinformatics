
library(gmp)

s <- readLines('rosalind_fibd.txt')
print(s)

# Convert n and d into big integers for arbitrary precision
n <- as.numeric(strsplit(s, ' ')[[1]][1])
d <- as.numeric(strsplit(s, ' ')[[1]][2])

# Use gmp's bigz type for arbitrary precision
f_immature <- as.bigz(0)
f_mature <- as.bigz(0)
f_baby <- as.bigz(1)
f <- c(as.bigz(1))
b <- c(as.bigz(1))

for (x in 2:n) {
  
  f_mature <- f_immature + f_mature 
  f_immature <- f_baby
  f_baby <- f_mature 
  if (x > d) {
    f_mature <- f_mature - b[x - d]
  }
  
  f <- append(f, f_mature + f_immature + f_baby)
  b <- append(b, f_baby)
}

# Use gmp's as.character() to print large number without scientific notation
print(as.character(f[n]))
