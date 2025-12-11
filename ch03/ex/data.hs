-- 9) Consider three two-dimensional points a, b, and c.
-- If we look at the angle formed by the line segment from a to b and the line segment from b to c, it either turns left, turns right, or forms a straight line.
-- Define a Direction data type that lets you represent these possibilities.
data Direction = TurnLeft | TurnRight | Straight deriving (Show)

data Point = Point Double Double deriving (Show)

-- 10) Write a function that calculates the turn made by three 2D points and returns a Direction.
-- Don't want to do this manually -> AI generated... w/ just read through
turn :: Point -> Point -> Point -> Direction
turn (Point ax ay) (Point bx by) (Point cx cy) =
  let angle = atan2 (cy - by) (cx - bx) - atan2 (ay - by) (ax - bx)
   in if angle < 0 then TurnLeft else if angle > 0 then TurnRight else Straight

-- 11) Define a function that takes a list of 2D points and computes the direction of each successive triple.
-- Given a list of points [a,b,c,d,e], it should begin by computing the turn made by [a,b,c],
-- then the turn made by [b,c,d], then [c,d,e]. Your function should return a list of Direction.
directions :: [Point] -> [Direction]
directions (a : b : c : rest) = turn a b c : directions (b : c : rest)
directions _ = []

-- 12) Using the code from the preceding three exercises, implement Graham's scan algorithm for the convex hull of a set of 2D points.  -> No chance doing this here...