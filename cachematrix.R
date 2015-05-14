## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

# variable x must be square matrix  # x1 <- (matrix(c(1,2,3, 11,12,13, 1,2,1), nrow = 3, ncol = 3, byrow = TRUE))
#>                                  # x2 <- (matrix(c(1,1,3, 11,12,13, 1,2,2), nrow = 3, ncol = 3, byrow = TRUE))
#
# aa <- makeCacheMatrix(x1)   # return special "matrix" object wich consist of four function
# aa$get()                    # return original matrix (fgrom cache or from memory)
# aa$set(x2)                  # update (set) cached value of original matrix; ff - new square matrix
# aa$setinverse()             # cache inversed matrix
# aa$getinverse()             # get cached  matrix from special "matrix" object; return NULL before first using setinverce()

  m <- NULL
  set <- function(y) {                       # update (set) cached value of x matrix
    x <<- y
    m <<- NULL
  }
  get <- function() x                        # get x matrix (from cache or from memory)
  setinverse <- function() m <<- solve(x)    # update cached value of inverced matrix
  getinverse <- function() m                 # get cached inverced matrix
  list(set = set, get = get,                 # return special "matrix" object
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
