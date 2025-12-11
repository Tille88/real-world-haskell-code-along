-- Copied from Trees.hs
-- Binary tree type
data Tree a
  = Node a (Tree a) (Tree a)
  | Empty
  deriving (Show)

-- 8) Using the binary tree type that we defined earlier in this chapter, write a function that will determine the height of the tree.
-- The height is the largest number of hops from the root to an Empty.
-- For example, the tree Empty has height zero;
-- Node "x" Empty Empty has height one;
-- Node "x" Empty (Node "y" Empty Empty) has height two; and so on.
height :: Tree a -> Int
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)

-- ghci> height Empty
-- 0
-- ghci> height (Node "x" Empty Empty)
-- 1
-- ghci> height (Node "x" Empty (Node "y" Empty Empty))
-- 2