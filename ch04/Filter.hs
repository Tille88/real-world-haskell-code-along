oddList :: [Int] -> [Int]
oddList (x : xs)
  | odd x = x : oddList xs
  | otherwise = oddList xs
oddList _ = []

-- Instead of oddList [1,2,3,4,5] -> [1,3,5]
-- can use filter function:
-- filter odd  [1,2,3,4,5] -> [1,3,5]
