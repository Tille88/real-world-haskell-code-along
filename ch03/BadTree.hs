-- Pattern matching limits us to performing fixed tests of a values shape.
-- We often want to make more expressive checks before evaluating the function's body.
-- Guards provides this

-- FROM:
-- bad_nodesAreSame (Node a _ _) (Node a _ _) = Just a
-- bad_nodesAreSame _            _            = Nothing

-- TO:
-- nodesAreSame (Node a _ _) (Node b _ _)
--   | a == b = Just a
-- nodesAreSame _ _ = Nothing

-- A pattern can be followed by zero or more guards, each an expression of type Bool.
-- A guard is introduced by a | symbol.
-- This is followed by the guard expression,
-- then an = symbol (or -> if we're in a case expression),
-- then the body to use if the guard expression evaluates to True.

-- If a pattern matches, each guard associated with that pattern is evaluated, in the order in which they are written.
-- If a guard succeeds, the body affiliated with it is used as the result of the function.
-- If no guard succeeds, pattern matching moves on to the next pattern

-- When a guard expression is evaluated, all of the variables mentioned in the pattern with which it is associated are bound and can be used.

-- Reworked lend from other file using guards:
lend amount balance
  | amount <= 0 = Nothing
  | amount > reserve * 0.5 = Nothing
  | otherwise = Just newBalance
  where
    reserve = 100
    newBalance = balance - amount
