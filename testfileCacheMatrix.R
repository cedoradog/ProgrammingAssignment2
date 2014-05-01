# Developed by Camilo Dorado
# April 30th / 2014

# Maybe you have to source your cachematrix.R file if you have not done yet.
#fileAddress <- ""
#source(file)

# Select a square matrix large enough to appreciatte the difference (without 
# crashing your machine). A 1000 x 1000 matrix, works well in my case.
dim = 1e3
A = matrix(runif(dim ^ 2), dim, dim)

# Get a cached version of A
cat(paste("To get the data from A to cache takes", 
          (system.time(cachedA <- makeCacheMatrix(A)))[3], "s.\n"))

# Compute the inverse of A by the first time, both by the solve function and by 
# using the cached version, and reports the time it takes.
cat("\nFirst time R computes inverse of A \n")
cat(paste("- Without cached version, computation takes",
          system.time(solveA <- solve(A))[3], "s. \n"))
cat(paste("- With cached version, computation takes",
          system.time(inverseA <- cacheSolve(cachedA))[3], "s. \n"))

# Compute the inverse of A by the second time, both by the solve function and by 
# using the cached version, and reports the time it takes.
cat("\nSecond time R computes inverse of A \n")
cat(paste("- Without cached version, computation takes",
          system.time(solveA <- solve(A))[3], "s. \n"))
cat(paste("- With cached version, computation takes",
          system.time(inverseA <- cacheSolve(cachedA))[3], "s. \n"))