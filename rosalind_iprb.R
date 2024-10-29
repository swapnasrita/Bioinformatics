s <- strsplit(readLines('rosalind_iprb.txt'), ' ')[[1]]
s<- lapply(s, as.numeric)
print(s)

a1 <- s[[1]]
a2 <- s[[2]]
a3 <- s[[3]]

a <- a1 + a2 + a3

total <- a*(a-1)

prob <- c(1, 1, 1, 1, 0.75, 0.5, 1, 0.5, 0)

comb <- c(a1*(a1-1), a1*a2, a1*a3, a2*a1, a2*(a2-1), a2*a3, a3*a1, a3*a2, a3*(a3-1) )

total_prob <- sum(unlist(prob)*unlist(comb))/total

print(total_prob)


