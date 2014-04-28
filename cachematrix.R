## These two functions work hand in hand. The first 
## function will create a matrix from the arguments and a list of 
## functions (like "get", "set",etc) and store them for later use 
## The second function then checks for the "cached" special matrix in 
## global enviornment and if it isn't there it computes the inverse
## of the special matrix.

## Function #1 creates the special matrix, and a list of functions 
## that allow for retrieval of this special matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x 
  setinverse <- function(ginv) m <<- ginv
  getinverse <- function() m 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
} ## <<- stores makeCaheinverse for later use if needed
}


## Function #2 checks  for the cached inverse of the matrix
## if it does not exist, then it computes the inverse of the matrix

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- ginv(data, ...)
  x$setinverse(m)
  m  ## Returns a matrix that is the inverse of 'x'
}
}
