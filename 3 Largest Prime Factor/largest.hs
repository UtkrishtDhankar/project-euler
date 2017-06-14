divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

-- List of all primes
primes :: [Int]
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [x | x <- xs, not $ divisible x p]

-- Internal recursive implementation of prime factor finding
primeFactorsImpl :: Int -> [Int] -> [Int]
primeFactorsImpl 1 _ = []
primeFactorsImpl a (p:ps)
    | divisible a p     = p : (primeFactorsImpl (a `div` p) ps)
    | otherwise         = primeFactorsImpl a ps

-- Finds the prime factors of x
primeFactors:: Int -> [Int]
primeFactors x = primeFactorsImpl x primes

-- Finds the largest prime number of x
largestPrimeFactor :: Int -> Int
largestPrimeFactor x = maximum (primeFactors x)

main = do
    print $ largestPrimeFactor 600851475143