## This function returns a list of 4 functions to be used 
## to work with the matrix passed as a formal argument

makeCacheMatrix <- function(x = matrix()) {
## This function receinves a matrix as a formal argument

# this statement initializes the variable s
  s <- NULL

## this function sets the value of the argument variable
  set <- function(y) {
    x <<- y
    s <<- NULL
  }

## this function gets the value of the argument variable
  get <- function() x

## this function sets the value of the inverse matrix of argument variable
  setinv <- function(solve) s <<- solve

## this function gets the value of the inverse matrix of argument variable
  getinv <- function() s

## this statement creates a list with the functions created earlier
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}



## This function receives a list of functions that are used to work with a matrix
## that was previously passed as an argument to the makeCacheMatrix function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
## this statement chechks if there is a cached value already available
  s <- x$getinv()

## If there is a cached value then it retrieves the cached value
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }

##if there is nos a cached value available this statement gets the original matrix
  data <- x$get()

## this statement calculates the inverse of the matrix
  s <- solve(data, ...)

## this statement stores the value of the inverse matrix in the list of functions
  x$setinv(s)
  s
}
