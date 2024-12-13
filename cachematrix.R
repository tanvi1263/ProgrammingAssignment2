## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}



makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse to NULL
  inv <- NULL
  
  # Set function to assign a new matrix and reset the cached inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Get function to retrieve the matrix
  get <- function() x
  
  # Set function to store the inverse in the cache
  setInverse <- function(inverse) inv <<- inverse
  
  # Get function to retrieve the cached inverse
  getInverse <- function() inv
  
  # Return a list of functions to interact with the special matrix
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



cacheSolve <- function(x, ...) {
  # Get the cached inverse
  inv <- x$getInverse()
  
  # If the inverse is already cached, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Get the matrix
  data <- x$get()
  
  # Compute the inverse using solve()
  inv <- solve(data, ...)
  
  # Cache the inverse
  x$setInverse(inv)
  
  # Return the inverse
  inv
}
