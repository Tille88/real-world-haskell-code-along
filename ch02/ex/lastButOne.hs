-- With very little shown so far
lastButOne :: [a] -> a
lastButOne [x, y] = x
lastButOne (x : y : ys) = lastButOne (y : ys)

-- lastButOne _ = [] can't do this as should return the value... so with 1 element:

-- *** Exception: Non-exhaustive patterns in function lastButOne