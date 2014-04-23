## These two functions work hand in hand. The first 
## function will creat a matrix from the arguments and 
## store the inverse of that matrix in the global environment
## The second function then checks for the "cached" special matrix in 
## global enviornment and if it isn't there it computes the inverse
## of the special matrix

## Function #1 creates the special matrix, computes the
## inverse, and stores it in the global environment

makeCacheMatrix <- function(x = matrix()) {
  z<-matrix(1:x^2,nrow=x)
  makecacheinverse<<-ginv(z) ## <<- stores makecaheinverse in the global environment
}


## Function #2 checks the global environment for the cached inverse of the matrix
## if it does not exist, then it computes the inverse of the matrix

cacheSolve <- function(x, ...) {
  if(!is.null(makecacheinverse)) {           #if there is a cache
    message("getting cached data") 
    return(makecacheinverse)                #just return the cache, no computation needed
  }
  z<-matrix(1:x^2,nrow=x)
  makecacheinverse<<-ginv(z)
  return(makecacheinverse)
  
  ## Return a matrix that is the inverse of 'z'
}
