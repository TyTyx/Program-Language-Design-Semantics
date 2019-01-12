-- Credit to Daniel.
-- 2018 January.

tear op x list = [[a | a <- list, a `op` x], [a | a <- list, x `op` a]]
