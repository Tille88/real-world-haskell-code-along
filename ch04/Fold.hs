foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' step zero (x : xs) = foldl' step (step zero x) xs

foldl _ zero [] = zero

-- the "L" suffix is because consuming the list from the head (left)

-- The version that folds a list from the right (foldr)
-- Note: 'zero' builds up the list including the 'start' which is usually similar to an identity value for the type of the list...
-- It distributes here until the end of the list, but for foldl it distributes from the start
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' step zero (x : xs) = step x (foldr' step zero xs)
foldr' _ zero [] = zero

-- So really, for foldr: replaces empty lsit with 'zero' and then every constructor of list with application of the step function
-- 1 : (2 : (3 : []))
-- 1 + (2 + (3 + 0 ))

-- identity :: [a] -> [a]
-- identity xs = foldr (:) [] xs

-- append :: [a] -> [a] -> [a]
-- append xs ys = foldr (:) ys xs

-- NOTE: WE WILL NEVER USE FOLDL IN PRACTICE BECAUSE OF NON-STRICT EVALUATION
-- Data.List module provides foldl' but does not build up thunks