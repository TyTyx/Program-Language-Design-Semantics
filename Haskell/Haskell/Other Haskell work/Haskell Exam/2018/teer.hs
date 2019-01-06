tear :: (Int -> Int -> Bool) -> Int -> [Int] -> [Int]
tear op x list = [[a | a <- list, a `op` x], [a | a <- list, x `op` a]]
