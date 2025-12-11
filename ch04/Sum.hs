mySum xs = helper 0 xs
  where
    helper acc (x : xs) = helper (acc + x) xs
    helper acc _ = acc

-- Rewritten using foldl
foldlSum xs = foldl step 0 xs
  where
    step acc x = acc + x

-- The local "step" fucntion simply adds two numbers, which is equal to (+)
niceSum :: [Integer] -> Integer
niceSum xs = foldl (+) 0 xs