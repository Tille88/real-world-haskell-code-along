-- Function that returns the third element of a tuple
third (_, _, x) = x

-- Can look/match inside a tuble and elements within
complicated (True, a, x : xs, 5) = (a, xs)