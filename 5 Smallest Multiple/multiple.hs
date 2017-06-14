import Data.List

divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

-- Check if a number x is divisible by all the numbers from 1 to y
divisibleUpTo :: Int -> Int -> Bool
divisibleUpTo x y = and $ map (\i -> divisible x i) [1..y]

-- Find the smallest number that is divisible by all numbers 1 through y
smallestDivisibleUpTo :: Int -> Int
smallestDivisibleUpTo y = 
    smallestDivisibleUpToImpl y y
    where 
        smallestDivisibleUpToImpl x y 
            | divisibleUpTo x y         = x
            | otherwise                 = smallestDivisibleUpToImpl (x+1) y

main = do
    print $ smallestDivisibleUpTo 20