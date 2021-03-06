## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
##set the value of the Matrix
##get the value of the Matrix
##set the value of the Inverse
##get the value of the Inverse
makeCacheMatrix <- function(x = matrix()) {
            m <- NULL
            set <- function(y) {
                        x <<- y
                        m <<- NULL
            }
            get <- function() x
            setinv <- function(solve) m <<- solve
            getinv <- function() m
            list(set = set, get = get,
                 setinv = setinv,
                 getinv = getinv)
}


## Write a short comment describing this function
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##If the inverse has already been calculated (and the matrix has not changed),
##then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
            ## Return a matrix that is the inverse of 'x'
            m <- x$getinv()
            if(!is.null(m)) {
                        message("getting cached data")
                        return(m)
            }
            data <- x$get()
            
            m <- solve(data, ...) #This function finds inverse of matrix provided input matrix should be square & inversible.
            #Basically determinant of input matrix should not be zero.
            x$setinv(m)
            m        
}
