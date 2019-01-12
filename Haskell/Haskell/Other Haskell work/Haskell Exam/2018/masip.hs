-- 2018 August.

mapSkip :: (a -> a) -> [a] -> a
mapSkip f xs = zipWith ($) (cycle [(f), id]) xs
