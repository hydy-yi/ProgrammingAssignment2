## R programming wk3 assignment
## Created function "makeCachMatrix" and "cacheSolve" to cache inverse of matrix

## The function 'MakeCacheMatrix' generates an object containing the list: 
## set, get, setinv, and getinv.  

makeCacheMatrix <- function(mx = matrix()) {
  inv <- NULL
  set <- function(my) {      # set the values that can be searched in parent environment
  mx <<- my                   
  inv <<- NULL              
}
  get <- function() mx         # get the value of a matrix
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv     # calculate the inverse of the maxtrix
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}



## 'cacheSolve' calculates the inverse of the matrix generated by 'makeCacheMatrix'.
## It first checks to see if the inverse has already been calculated. If so, it `get`s the mean from the


cacheSolve <- function(mx, ...) {

  inv <- mx$getinv()                  # search value mx$getinv in parent environment 
  if(!is.null(inv)) {                 # check if the inverse has been calculated
    message("getting cached data")
    return(inv)
  }
  data <- mx$get()                   # get matrix value from 'makeCacheMatrix'
  inv <- solve(data, ...)            # caculate inverse of matrix 'data'
  mx$setinv(inv)
  inv
}
