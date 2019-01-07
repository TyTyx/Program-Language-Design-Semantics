nheads :: Int -> [a] -> [a]
nheads n [] = []
nheads n (x:xs) = if n == 1 then x:[] else x:nheads (n - 1) xs

ntails :: Int -> [a] -> [a]
ntails n [] = []
ntails n (x:xs) = if n == 1 then xs else x:ntails (n - 1) xs

weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks n xs [] = xs
weaveHunks n [] ys = ys
weaveHunks n xs ys = nheads n xs ++ nheads n ys ++ weaveHunks n (ntails n xs) (ntails n ys)
