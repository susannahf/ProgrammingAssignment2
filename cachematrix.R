## this code creates a "matrix that can cache its inverse, 
# and a function to calculate and store the inverse

## makeCacheMatrix: creates a "matrix" that can can store its inverse
# there are actually some functions that set and get the value of the matrix
# there are also functions to set and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  # initially set the inverse to be null because we haven't calculated it yet
  inv <- NULL
  # this internal function sets the value of the matrix
  set <- function(val) {
    x <<- val # assign value to x
    inv <<- NULL # any previous value of the inverse is now wrong
  }
  # retrieve the matrix stored by set
  get <- function() x
  # set the inverse property
  setinv <- function(invval) inv<<-invval
  # retrieve the inverse property
  getinv <- function() inv
  
  # return a useful list of functions
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## returns the inverse of a cachematrix created using makeCacheMatrix
cacheSolve <- function(x, ...) {
  # check if x has an inverse cached
  inv <- x$getinv()
  # if there is an inverse cached, return it :)
  if (!is.null(inv)) {
    message("retrieving cached inverse")
    return(inv) 
  }
  # there is not inverse cached
    # check that the matrix is square
    m <- x$get()
    if(nrow(m)!=ncol(m)) stop("matrix is not square, cannot compute inverse")
    # if we get this far, then we have a square matrix, so it's worth trying to calculate the inverse
    inv <- solve(m)
    # now cache it
    x$setinv(inv)
    # return the inverse of the matrix
    inv
  
}
