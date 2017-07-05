import Data.List
import Data.Function

collatz :: Int -> [Int]
collatz 1 = [1]
collatz x 
    | even x = x:(collatz $ x `div` 2) 
    | odd x = x:(collatz $ 3 * x + 1) 

-- I'm doing this weird zipping with length thing and then
-- recalculating the required collatz as if I stored all the
-- collatz sequences in memory, the memory usage would easily
-- go above what I have, and freeze my system.
longestCollatz :: Int -> [Int]
longestCollatz x = collatz $ fst $ maximumBy (compare `on` snd) $ zip [1..] (map (length . collatz) [1..x])

main = do
    print $ longestCollatz 1000000
