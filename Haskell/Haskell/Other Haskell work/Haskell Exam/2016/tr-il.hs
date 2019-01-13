tr :: [[a]] -> [[a]]
tr x
  | (null (head x)) = []
  | otherwise = [map head x] ++ tr (map tail x)
