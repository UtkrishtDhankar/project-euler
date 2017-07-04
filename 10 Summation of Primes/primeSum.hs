divisible :: Int -> Int -> Bool
divisible x y = ((x `rem` y) == 0)

-- List of all primes
primes :: [Int]
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [x | x <- xs, not $ divisible x p]

answer :: Integer
answer = sum $ map toInteger $ takeWhile (<2000000) $ primes

main =
    print answer