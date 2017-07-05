divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

triangle :: [Int]
triangle = [n * (n-1) `quot` 2 | n <- [2..]]

divisors :: Int -> [Int]
divisors x = (smallDivisors) ++ (reverse $ map (\i -> x `quot` i) $ smallDivisors)
    where sqrtX = floor $ sqrt $ fromIntegral $ x
          smallDivisors = filter (divisible x) [1..sqrtX]

numDivisors :: Int -> Int
numDivisors x = length $ divisors x

main = do
    print $ head $ filter (\x -> (numDivisors x) > 500) triangle
