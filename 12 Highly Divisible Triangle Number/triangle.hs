divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

triangle :: [Int]
triangle = [n * (n-1) `quot` 2 | n <- [2..]]

numDivisors :: Int -> Int
numDivisors x = 2 * (length $ filter (divisible x) [1..sqrtX])
    where sqrtX = floor $ sqrt $ fromIntegral $ x

main = do
    print $ head $ filter (\x -> (numDivisors x) > 500) triangle
