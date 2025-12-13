class Borked a where
  bork :: a -> String

instance Borked Int where
  bork = show

-- NOTE: BELOW WILL (COMPILE) BUT NOT WORK IN USAGE BECAUSE IT OVERLAPS WITH THE INSTANCE FOR A PAIR OF ANYTHING ELSE THATS BORKED
instance Borked (Int, Int) where
  bork (a, b) = bork a ++ ", " ++ bork b

instance (Borked a, Borked b) => Borked (a, b) where
  bork (a, b) = ">>" ++ bork a ++ " " ++ bork b ++ "<<"

-- !!! HAVE TWO INSTANCES OF THE TYPECLASS BORKED FOR PAIRS, ONE FOR INTS AND ANOTHER FOR A PAIR OF ANYTHING ELSE THATS BORKED