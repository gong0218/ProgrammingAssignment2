## cache the inverse of a matrix by 2 functions "makeCacheMatrix" & "cacheSolve"


## "makeCacheMatrix" function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
            i <- NULL
            set <- function(y){
              x<<-y
              i<<-NULL
            }
            get<-function() x
            setinverse<-function(solve) i <<-solve 
            getinverse<-function() i
            list(set=set,get=get,
                 setinverse=setinverse,
                 getinverse=getinverse)
}


## "cacheSolve" function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
          i <- x$getinverse()
          if(!is.null(i)){
            message("getting cached data")
            return(i)
          }
          data<-x$get()
          i<-solve(data, ...)
          x$setinverse(i)
          i
        ## Return a matrix that is the inverse of 'x'
}
