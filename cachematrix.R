## example usage:

## someMatrix <- matrix(1:4, 2, 2)
## matrixObject <- makeCacheMatrix(someMatrix)

## ## calculate inverse and prints it
## cacheSolve(matrixObject)

## ## inverse can be retrieved later on
## matrixObject$getInverse()

## Creates a matrix object containing the matrix itself,
## and the inverse matrix.
## The object provides methods to get/set the matrix/inverse.
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  ## sets matrix, clear inverse matrix
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  ## gets matrix
  get <- function() x
  
  ## sets/gets inverse
  setinverse <- function(p) inverse <<- p
  getinverse <- function() inverse
  
  ## used for clean output when investigating object
  list(set = set, get = get,
       getinverse = getinverse,
       setinverse = setinverse)
}


## Sets the inverse matrix of a matrix object,
## depending on the matrix within the matrix object.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  
  ## check whether the inverse matrix is cached
  if(!is.null(inverse)) {
    message("getting inversed matrix from cache")
    return (inverse)
  }
  
  ## calculate inverse matrix and cache it
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  
  return(inverse)
}