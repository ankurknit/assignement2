makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
     set <- function(y) {
            x <<- y
            m <<- NULL
        }
      get <- function() x
      setinv <- function(inv) m <<- inv
      getinv <- function() m
      list(set=set, get=get, setinv=setinv, getinv=getinv)
  
}



cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
          m <- x$getinv()
          if(!is.null(m)){
              message("Obtaining cached data!")
              return(m)
          }
          data <- x$get()
          m <- solve(data)
          x$setinv(m)
          m
}	
