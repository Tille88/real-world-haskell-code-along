import Data.List

-- ghci> :m +Data.List
-- ghci> tail "foobar"
-- "oobar"
-- ghci> tail (tail "foobar")
-- "obar"
-- ghci> tails "foobar"
-- ["foobar","oobar","obar","bar","ar","r",""]
-- NOTE: THE EMPTY LIST/STRING AT THE END

-- What if we want a function that behaves like tails, but which only returns the non-empty suffixes?
-- One possibility would be for us to write our own version by hand. We'll use a new piece of notation, the @ symbol.

suffixes :: [a] -> [[a]]
suffixes xs@(_ : xs') = xs : suffixes xs'
suffixes [] = []

-- xs@(_:xs') is called an as-pattern
-- = bind the variable xs to the value that matches the right side of the @ symbol
-- Above:
-- If the pattern after @ matches:
-- xs will be bound to the entire list that matched, and xs; to all BUT the head of the list (not interested in the head so using _ for part of the placement)
-- WHY IS THIS USEFUL?
-- Becasue then we can use xs to refer to the entire list even if consumed by matching.

-- Example not using matching:
noAsPattern :: [a] -> [[a]]
-- Deconstructed, then reconstructed again
noAsPattern (x : xs) = (x : xs) : noAsPattern xs
noAsPattern _ = []

-- Not only for readability, but also for performance.
-- In our definition of noAsPattern, when we match (x:xs), we construct a new copy of it in the body of our function. (new list at runtime)
-- In contrast, when we defined suffixes, we reused the value xs that we matched with our as-pattern. Since we reuse an existing value, we avoid a little allocation.

-- CODE REUSE:
-- Note that we have the "init" function which returns all but the last element of a list.

suffixes2 xs = init (tails xs)

-- Manually creating compose function (.)
compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g x = f (g x)

-- We can use this to "glue" functions together:
-- suffixes3 xs = compose init tails xs
-- Automatic currrying => can drop xs
suffixes3 = compose init tails

suffixes5 = init . tails