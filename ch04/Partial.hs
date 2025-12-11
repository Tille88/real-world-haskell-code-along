import Data.List (isInfixOf)

isInAny2 needle = any (\s -> needle `isInfixOf` s)

-- But more useful is likely to use partial application:
isInAny3 needle haystack = any (isInfixOf needle) haystack

-- Can with 'sectioning' of infix (i.e. which side will be applied first) create even more reable by having needle and haystack be in correct order:
isInAny4 needle haystack = any (needle `isInfixOf`) haystack