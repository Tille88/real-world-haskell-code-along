-- Normal function: can use sevaral clauses to cover different pattern matching possibilities
safeHead (x : _) = Just x
safeHead _ = Nothing

-- But can't use multiple clauses to define a lambda, must be certains any patterns we use will match:
unsafeHead = \(x : _) -> x
