## 生成一个新的开始
## Put comments here that give an overall description of what your
## functions do
## 生成一个可逆矩阵
n <- 3  
B <- matrix(runif(n^2), nrow = n, ncol = n)  # 生成随机矩阵
while (det(B) == 0) {
        B <- matrix(runif(n^2), nrow = n, ncol = n)  # 重新生成矩阵直到行列式非零
}
print(B)
## Write a short comment describing this function
## 储存inverse matrix
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- solve(inv)
        getinv <- function() m
        catchobj <- list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
        return(catchobj)
}


## Write a short comment describing this function
## cacheSolve 1.计算inverse matrix 
## 2.如果前面已经缓存，从缓存catch中获得inverse matricx



cacheSolve <- function(x,makeCacheMatrix,...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
myiver <- makeCacheMatrix(B)

cacheSolve(A)

A <- makeCacheMatrix()

# 设置矩阵的值
A$set(B)

# 计算逆矩阵
cacheSolve(A)

