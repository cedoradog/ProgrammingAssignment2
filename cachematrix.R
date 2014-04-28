## The following functions allows to recover the inverse of a matrix from cache
## if it has been previously computed.

## Take a matrix x and return a list of functions to work with: set, get,
## setInverse and getInverse.

makeCacheMatrix <- function(x = matrix()) {
  # When this function is called first time for matrix x, initialize the 
  # inverse as NULL object.
  inverse <- NULL
  # Define set function: assignate to the argument x of makeCacheMatrix, the value 
  # of its own argument y, and then, reset its inverse to NULL. 
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  # Define get function: return the argument x of makeCacheMatrix.
  get <- function() x
  # Define setInverse function: return the inverse function, which is identical 
  # to solve function.
  setInverse <- function(solve) inverse <<- solve
  # Define getInverse function: return the inverse function.
  getInverse <- function() inverse
  # Return a list containing the four functions previously defined.
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Return the value of the inverse of a matrix, recovering from cache if it was 
## computed recently.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of matrix x.
  # Define inverse: getInverse function
  inverse <- x$getInverse()
  # If inverse is not NULL, recover it from cache and terminate.
  if(!is.null(inverse)) {
    message("Getting cached data...")
    return(inverse)
  }
  # If inverse is NULL, compute the inverse and return it.
  #data <- makeCacheMatrix(x)$get()
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInverse(inverse)
  inverse
}