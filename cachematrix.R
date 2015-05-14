
## This function creates a special "matrix" object that can cache its inverse.
# variable x must be square matrix  # x1 <- (matrix(c(1,2,3, 11,12,13, 1,2,1), nrow = 3, ncol = 3, byrow = TRUE))
#                                   # x2 <- (matrix(c(1,1,3, 11,12,13, 1,2,2), nrow = 3, ncol = 3, byrow = TRUE))
#
# aa <- makeCacheMatrix(x1)   # returns special "matrix" object wich consist of four function;  x1 - square matrix
# aa$get()                    # 1. returns original matrix (from cache or from memory); no arguments 
# aa$set(x2)                  # 2. updates (sets) cached value of original matrix and clears cache of inverced matrix; x2 - new square matrix
# aa$setinverse()             # 3. caches inversed matrix; no arguments
# aa$getinverse()             # 4. gets cached inversed matrix; returns NULL before first using of setinverce(); no arguments


makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {                       # updates (set) cached value of x matrix and clears cache of inverced matrix
    x <<- y
    m <<- NULL                               # clear cache of inverced matrix
  }
  get <- function() x                        # gets x matrix (from cache or from memory)
  setinverse <- function() m <<- solve(x)    # updates cached value of inverced matrix
  getinverse <- function() m                 # gets cached inverced matrix
  list(set = set, get = get,                 # returns special "matrix" object wich consist of four function
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix
#  If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

# aa <- makeCacheMatrix(x1)   # returns special "matrix" object wich consist of four function;  x1 - square matrix
# cacheSolve(aa)              # returns matrix wich is inverced x1 matrix

cacheSolve <- function(x) {
    m <- x$getinverse()                        # get cashed data from "special" matrix object
    
  if(!is.null(m)) {                            # cache contains inverced matrix
    message("getting cached data")
    return(m)
  }
  else {                                       # cache is empty
    message("computing inverced matrix")
    x$setinverse()          # update cache with new inverced matrix
    return(x$getinverse())  
  }
  

}
