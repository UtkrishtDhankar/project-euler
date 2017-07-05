numPaths x y
    | x == 0 || y == 0     = 1
    | otherwise            = (pathsTable !! (x-1) !! y) + (pathsTable !! x !! (y-1))

pathsTable = [[numPaths x y | x <- [0..]] | y <- [0..]]

main = do
    print $ numPaths 20 20
