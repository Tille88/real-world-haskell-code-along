concat :: [[a]] -> [a]
concat = foldr (++) []

-- Concat for list using foldr, example in chapter to show that (<>) is analogous to (++) and empty to []