-- Returns the second element of input list -> if not long enough, throws an error
mySecond :: [a] -> a
mySecond xs =
  if null (tail xs)
    -- Immediately aborts evaluation
    then error "list too short"
    else head (tail xs)

-- Using a maybe instead of an error
safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs =
  if null (tail xs)
    then Nothing
    else Just (head (tail xs))

-- Can improve readability with some pattern matching
tidySecond :: [a] -> Maybe a
tidySecond (_ : x : _) = Just x
tidySecond _ = Nothing