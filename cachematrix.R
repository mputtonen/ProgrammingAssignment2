## This function creates a matrix which caches its own inverse
makeCacheMatrix <- function(x = matrix()) {
  y <- NULL
  
## set the value of the matrix
  set <- function(z){
    x <<- z
    y <<- NULL
  }
  
## get the value of the matrix 
  get <- function() {
    x
  }
  
## set the inverse
  setinverse <- function() {
    y <<- solve(x)
  }


## get the inverse
  getinverse <- function() {
    y
  }

## paste the list of defined above (set, get, setinverse, getinverse)
  list (set = set, get = get, 
        setinverse = setinverse, getinverse = getinverse)
}

## if the inverse has been calculated and stored, get the inverse from the cache. 
## if not, calculate the inverse
cacheSolve <- function(x, ...) {
  
  ## return the inverse of the matrix x 
  y <- x$getinverse()
  
  ## if cached return the inverse, if not get the data and calculate the inverse
  if(!is.null(y)) {
    message("getting cached data")
    return(y)
  } else {
    data <- x$get()
    y <- solve(data) 
  }
  
    ## return the result (matrix)
    y
}

