-- Returns True if x is divisible by y
-- False otherwise
divisible :: Int -> Int -> Bool
divisible x y
    | ((x `rem` y) == 0)    = True
    | otherwise             = False

multiples :: [Int]
multiples = filter (\x -> (divisible x 3 || divisible x 5)) [1..]

main :: IO ()
main = do
    print $ sum $ takeWhile (<1000) multiples
