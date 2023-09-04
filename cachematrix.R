## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## the comment is Chinese;translate if you'd like 
## makeCacheMatrix会储存 矩阵和求逆的矩阵
## create a matrix B
# n <- 3  
# B <- matrix(runif(n^2), nrow = n, ncol = n)  # 生成随机矩阵
# while (det(B) == 0) {
#         +         B <- matrix(runif(n^2), nrow = n, ncol = n)  # 重新生成矩阵直到行列式非零
#         + }
# print(B)

makeCacheMatrix <- function(x = matrix()) {
        m <- matrix()
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        catchobj <- list(set = set, 
                         get = get,
                         setinv = setinv,
                         getinv = getinv)
        return(catchobj)
}

## Write a short comment describing this function
## it seems that the  operator"$" is invalid in my R version(R-4.3);
## and this work is very confusing.
cacheSolve <- function(x, ...) {
        s <- x$getinv
        if(!is.null(s)) {
                message("getting inversed matrix")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setinv(s)
        s
}

cacheSolve(B)
## Error in x$getinv : $ operator is invalid for atomic vectors















