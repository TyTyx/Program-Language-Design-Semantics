count :: [Int] -> [Int] -> [Int]
count (x:xs:y:ys) = [x] [y] ++ count [xs] [ys]

-- weaveHunks :: Int -> List -> List
weaveHunks :: [Int] -> [Int] -> [Int]
weaveHunks xs ys = (count xs ys)
