import Data.Char (digitToInt)

-- 1) Use a fold (choosing the appropriate fold will make your code much simpler) to rewrite and improve upon the asInt
-- loop :: Int -> String -> Int
-- loop acc [] = acc
-- loop acc (x : xs) =
--   let acc' = acc * 10 + digitToInt x
--    in loop acc' xs

-- asInt :: String -> Int
-- asInt xs = loop 0 xs

-- SOLUTION: With fold:

asInt :: String -> Int
asInt xs = foldl step 0 xs
  where
    step acc x = acc * 10 + digitToInt x

-- Extend your function to handle the following kinds of exceptional conditions by calling error.
-- ghci> asInt_fold ""
-- 0
-- ghci> asInt_fold "-"
-- 0
-- ghci> asInt_fold "-3"
-- -3
-- ghci> asInt_fold "2.7"

-- *** Exception: Char.digitToInt: not a digit '.'

-- SOLUTION: dealing w/ some negation which should really be done in the excersise above...

asIntWErrors :: String -> Int
asIntWErrors "" = 0
asIntWErrors "-" = 0
asIntWErrors ('-' : xs) = -asIntWErrors xs -- or negate (foldl step 0 xs)
asIntWErrors xs = foldl step 0 xs
  where
    step acc x
      | x >= '0' && x <= '9' = acc * 10 + digitToInt x
      | otherwise = error ("not a digit '" ++ [x] ++ "'")

-- 2) The asInt_fold function uses error, so its callers cannot handle errors. Rewrite it to fix this problem.
type ErrorMessage = String

asInt_either :: String -> Either ErrorMessage Int
-- ghci> asInt_either "33"
-- Right 33
-- ghci> asInt_either "foo"
-- Left "non-digit 'o'"
-- SOLUTION:
asInt_either "" = Right 0
asInt_either "-" = Right 0
asInt_either ('-' : xs) =
  case foldl step (Right 0) xs of
    Right n -> Right (negate n)
    Left msg -> Left msg
asInt_either xs = foldl step (Right 0) xs
  where
    step (Right acc) x
      | x >= '0' && x <= '9' = Right (acc * 10 + digitToInt x)
      | otherwise = Left ("non-digit '" ++ [x] ++ "'")
    step (Left msg) _ = Left msg

-- 3) The Prelude function concat concatenates a list of lists into a single list, and has the following type.
concat :: [[a]] -> [a]
-- Write your own definition of concat using foldr.
concat xs = foldr (++) [] xs

-- 4) Write your own definition of the standard takeWhile function, first using explicit recursion, then foldr.
takeWhileRecursive :: (a -> Bool) -> [a] -> [a]
takeWhileRecursive p [] = []
takeWhileRecursive p (x : xs)
  | p x = x : takeWhileRecursive p xs
  | otherwise = []

takeWhileFoldr :: (a -> Bool) -> [a] -> [a]
takeWhileFoldr p xs = foldr step [] xs
  where
    step x acc
      | p x = x : acc
      | otherwise = acc

-- 5) The Data.List module defines a function, groupBy, which has the following type.
-- groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
-- It does:
-- ghci> groupBy (==) [1,1,2,3,3,1,2,3,1,2,3]
-- [[1,1],[2],[3,3],[1],[2],[3],[1],[2],[3]]
-- NOTE: CONSEQUTIVE GROUPINGS ONLY!!!
-- Write your own definition of groupBy using

groupByFoldR :: (a -> a -> Bool) -> [a] -> [[a]]
groupByFoldR eq xs = foldr step [] xs
  where
    step x acc
      | null acc = [[x]]
      | eq x (head (head acc)) = (x : head acc) : tail acc
      | otherwise = [x] : acc

-- 6) Skip...