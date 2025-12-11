-- NOT THE WAY TO GO: (UNSAFE CHECK THROUGH LENGTH OF LIST)
myDumbExample xs =
  if length xs > 0
    then head xs
    else 'Z'

-- This will walk the entire list!!!
-- BUT: 'null' to the rescue which runs in constant time
mySmartExample xs =
  if not (null xs)
    then head xs
    else 'Z'

myOtherExample (x : _) = x
myOtherExample [] = 'Z'