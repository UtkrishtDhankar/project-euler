-- Returns the square of the given integer
square :: Int -> Int
square x = x * x

-- Takes an integer, and returns the sum of all numbers 1 through given integer squared
squareOfSums :: Int -> Int
squareOfSums n = square $ sum [1..n]

-- Returns the sum of the squares of all the numbers 1 through n
sumOfSquares :: Int -> Int
sumOfSquares n = sum $ map square [1..n]

-- Returns the difference between the square of sums and the sum of squares 
-- of numbers up to the given integer
difference :: Int -> Int
difference n = ((squareOfSums n) - (sumOfSquares n))

main = do
    print $ difference 100