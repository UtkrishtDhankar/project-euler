-- Checks if the given string is a palindrome
palindromeStr :: String -> Bool
palindromeStr []   = True
palindromeStr [_]  = True
palindromeStr s
    | ((head s) == (last s))        = palindromeStr $ (init.tail) s 
    | otherwise                     = False

-- Checks if the given integer is a palindrome
palindromeInt :: Int -> Bool
palindromeInt x = palindromeStr $ show x

-- A list of all possible pairs of 3 digit numbers
possibleNumbers :: [(Int, Int)]
possibleNumbers = zip (concat $ map (replicate 900) [999,998..100]) (take (999*900) (cycle [999,998..100])) 

-- The maximum product of a pair of 3 digit numbers that is also a palindrome
answer :: Int
answer = maximum $ map (\x -> (fst x) * (snd x)) $ filter (\x -> palindromeInt $ (fst x) * (snd x)) possibleNumbers 

main = do
    print $ answer