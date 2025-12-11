-- Recursive types first example: list like type
-- Cons instead of :, Nil instead of []

data List a = Cons a (List a) | Nil deriving (Show)

fromList (x : xs) = Cons x (fromList xs)
fromList [] = Nil

-- Exercise: Write the converse of fromList for the List type: a function that takes a List a and generates a [a]
converse :: List a -> [a]
converse (Cons x xs) = x : converse xs
converse Nil = []
