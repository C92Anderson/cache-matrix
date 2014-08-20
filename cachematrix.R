## makeCacheMatrix is assigns the x variable locally, 

makeCacheMatrix <- function(x = matrix()) {
	invmat <- NULL   ### create blank matrix
	set <- function(y) {   ### y is now a free variable in the function
x <<- y 		### saves x in different environment
invmat <<- NULL  ### create blank 'answer' 
}

get <- function() x   #### call matrix above locally
setinvmat <- function(inv_mat) invmat <<- solve  ###assigns the solve function to different enviornment
getinvmat <- function() invmat
list(set = set, get = get,
             setinvmat = setinvmat ,
             getinvmat = getinvmat)   ###returns function contents

}


cacheSolve <- function(x, ...) {
      invmat <- x$getinvmat()
	if(!is.null(invmat)){   ###check to see invmat has been calculated
		message("getting cached data")
		return(invmat)    ###give message and previously calculated inversed matrix
	}
data <- x$get ()    ###else it calls on the data above
invmat <- solve(data, ...)  ### put through the solve function
x$setinvmat(invmat)  ####calls 
invmat
}

## Return a matrix that is the inverse of 'x'

