# Function to create a special matrix object with cache
makeCacheMatrix <- function(x) {
  inv <- NULL  # Initialize inverse as NULL
  
  # Function to solve the matrix and update cache if needed
  solve <- function(...) {
    if (is.null(inv) || !all.equal(x, ...)) {
      inv <- solve(x)  # Calculate inverse if not cached or matrix changed
    }
    inv
  }
  
  # Return a list containing the matrix and solve function
  list(matrix = x, solve = solve)
}

# Function to solve the cached matrix
cacheSolve <- function(x, ...) {
  # Extract solve function from the cached object
  solve <- x$solve
  
  # Call the solve function with passed arguments
  solve(...)
}
