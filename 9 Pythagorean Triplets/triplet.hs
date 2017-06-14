-- Now, c^2 = a^2 + b^2, 
-- so we're really only finding a and b and then solving for c to get the triplet

-- From Mathematica, I solved a + b + sqrt (a^2 + b^2) for b
-- I got b = 1000(-500 + a) / (-1000 + a)
-- So really the problem is to find an integer a s.t. b is also an integer

import Data.List

a :: Int
a = 
    case y of
        Just n    -> n
        Nothing   -> 0
    where y = find (\x -> (1000 * (x - 500) `rem` (x - 1000) == 0)) [1..1000]

b :: Int
b = 1000 * (a - 500) `div` (a - 1000)

c :: Int
c = floor $ sqrt $ fromIntegral $ a*a + b*b

main = do
    print a
    print b
    print c
    print $ a * b * c