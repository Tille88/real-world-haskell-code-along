import Data.List (sortBy)

-- 1) Write a function that computes the number of elements in a list. To test it, ensure that it gives the same answers as the standard length function.

-- 2) Add a type signature for your function to your source file. To test it, load the source file into ghci again.

len' :: [a] -> Int
len' [] = 0
len' (_ : xs) = 1 + len' xs

-- 3) Write a function that computes the mean of a list,
--      i.e. the sum of all elements in the list divided by its length.
-- (You may need to use the fromIntegral function to convert the length of the list from an integer into a floating point number.)

mean' :: (Integral a, Fractional b) => [a] -> b
mean' [] = 0.0
mean' xs = fromIntegral (sum xs) / fromIntegral (len' xs)

-- 4) Turn a list into a palindrome, i.e. it should read the same both backwards and forwards. For example, given the list [1,2,3], your function should return [1,2,3,3,2,1]
palindrome :: (Eq a) => [a] -> [a]
palindrome xs
  | xs == reverse xs = xs
  | otherwise = xs ++ reverse xs

-- 5) Write a function that determines whether its input list is a palindrome.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = reverse xs == xs

-- 6) Create a function that sorts a list of lists based on the length of each sublist. (You may want to look at the sortBy function from the Data.List module.)
sortByLength :: [[a]] -> [[a]]
sortByLength = sortBy (\xs ys -> compare (length xs) (length ys))

-- 7) Define a function that joins a list of lists together using a separator value.
-- The separator should appear between elements of the list, but should not follow the last element.
intersperse' :: a -> [[a]] -> [a]
intersperse' _ [] = []
intersperse' sep [x] = x
intersperse' sep (x : xs) = x ++ [sep] ++ intersperse' sep xs