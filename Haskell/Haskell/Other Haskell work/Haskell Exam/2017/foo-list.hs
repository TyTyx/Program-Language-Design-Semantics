foo :: [a] -> [a] -> [a]
foo x y = li x y 1
  where
    li :: [a] -> [a] -> Int -> [a]
    li x y z
      | (length x) == 0 && (length y) == 0 = []
      | (length x) == 0 && (length y) /= 0 = y
      | (length x) /= 0 && (length y) == 0 = x
      | (odd z) = take z x ++ li (drop z x) y (succ z)
      | (even z) = take z y ++ li x (drop z y) (succ z)
