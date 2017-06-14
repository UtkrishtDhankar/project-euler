divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

-- List of all primes
primes :: [Int]
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [x | x <- xs, not $ divisible x p]

main = do
    print $ primes !! 10000 -- this gets the 10001st prime