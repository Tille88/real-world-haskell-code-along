import Data.Char (toUpper)

-- Squaring every element in an array (C) -> List (Haskell)

square :: [Double] -> [Double]
square (x : xs) = x * x : square xs
square [] = []

-- Every letter to upper case
upperCase :: String -> String
upperCase (x : xs) = toUpper x : upperCase xs
upperCase [] = []

-- Using prelude included map for list function instead
square' xs = map squareOne xs
  where
    squareOne x = x * x

-- Alt: square' = map (\x -> x * x) [also excluding the xs term]

upperCase' xs = map toUpper xs

myMap :: (a -> b) -> [a] -> [b]
myMap f (x : xs) = f x : myMap f xs
myMap _ _ = []