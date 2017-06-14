fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

evenFibs :: [Int]
evenFibs = filter even fibs

requiredSum :: Int
requiredSum = sum $ takeWhile (<4000000) evenFibs

main = do
    print requiredSum