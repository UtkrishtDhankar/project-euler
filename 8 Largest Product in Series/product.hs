import Data.Char

products :: String -> [Int]
products [] = []
products s = (product $ take 13 $ map digitToInt s) : (products $ tail s)

maxProduct :: String -> Int
maxProduct s = maximum $ products s

main = do
    s <- getLine
    print $ maxProduct s