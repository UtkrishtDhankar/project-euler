divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

primes :: [Int]
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [x | x <- xs, not $ divisible x p]

-- Finds the prime factors of a, over the given search space of prime numbers
-- Needs to be supplied this list of primes
primeFactors :: Int -> [Int] -> [Int]
primeFactors 1 _ = []
primeFactors a (p:ps)
    | divisible a p     = p : (primeFactors (a `div` p) ps)
    | otherwise         = primeFactors a ps

largestPrimeFactor :: Int -> Int
largestPrimeFactor x = maximum (primeFactors x primes)

main = do
    print $ largestPrimeFactor 600851475143