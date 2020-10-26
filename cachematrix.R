## This code is designed to cache (save) the inverse of the matrix a user inputs. After entering a matrix (recall that only square -nxn- matrices have inverse) the function will proceed to store it in a function with 4 internal functions that describe the global environment.
## These functions are the get() - to show the user the components of said matrix, the set() - to replace the initial matrix with a new one, the set_inverse() - to place the value of the calculated inverse from the cacheSolve() for the 'm' variable, and finally, the get_inverse()- to show the user the components of the inverse of the matrix calculated.

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
 set <- function(y) {
   x <<- y
   m <<- NULL
 }
 get <- function() x
 set_inverse <- function(solve) m <<- solve
 get_inverse <- function() m
 list(set = set, get = get,
      set_inverse = set_inverse,
      get_inverse = get_inverse)
}


## cacheSolve works in conjunction with the makeCacheMatrix to calculate the inverse of the input matrix. After caching the matrix, cacheSolve calculates the inverse.

cacheSolve <- function(x, ...) {
m <- x$get_inverse()
if(!is.null(m)) {
 message("getting cached data")
 return(m)
}

data <- x$get()
m <- solve(data, ...)
x$set_inverse(m)
m
}
