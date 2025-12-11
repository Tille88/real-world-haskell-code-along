-- Within the body of a function, we can introduce new local variables using a let expression
lend amount balance =
  let reserve = 100
      newBalance = balance - amount
   in if balance < reserve
        then Nothing
        else Just newBalance

-- We can use the names of a variable in a let block both within the block of declarations and in the expression that follows the in keyword.

-- We can use another mechanism to introduce local variables: the where clause.
-- The definitions in a where clause apply to the code that PRECEDS it.
-- Using where instead of let:
lend2 amount balance =
  if amount < reserve * 0.5
    then Just newBalance
    else Nothing
  where
    reserve = 100
    newBalance = balance - amount